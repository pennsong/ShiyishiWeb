<?php

class APP_Db
{
	protected $_config = array();

	protected $_rdb = null;

	protected $_wdb = null;

	protected $_queryFromExec = false;

	public function __construct(array $config)
	{
		if(!isset($config['dbname']) || !isset($config['write'])){
			throw new APP_Exception("config array error : dbname/write required");
		}
		$this->_config = $config;
	}

	public function getConfig(){
		return $this->_config;
	}

	public function closeDb(){
		$this->_rdb = $this->_wdb = null;
	}

	public function setQueryFromExec($type){
		$this->_queryFromExec = $type;
	}

	// 建立PDO连接
	protected function _connect($config){
		if(!isset($config['dbhost']) || !isset($config['username']) || !isset($config['password'])){
			throw new APP_Exception("config array error : dbhost/username/password/dbname required");
		}
		$dsn = 'mysql:'.'host='.$config['dbhost'].';dbname='.$this->_config['dbname'];
		if(isset($config['port'])){
			$dsn .=  ';port=' . $config['port'];
		}
		$driver_options = array();
		if(isset($this->_config['charset'])){
			$driver_options[PDO::MYSQL_ATTR_INIT_COMMAND] = 'SET NAMES '.$this->_config['charset'];
		}
		try{
			$db = new PDO($dsn,$config['username'],$config['password'],$driver_options);
		}catch (PDOException $e){
			throw new APP_Exception($e->getMessage(),$e->getCode());
		}
		return $db;
	}

	protected function _rconnect(){
		if ($this->_rdb){
			return $this->_rdb;
		}
		if(!isset($this->_config['read'])){
			$this->_rdb = $this->_wconnect();
		}else{
			$this->_rdb = $this->_connect($this->_config['read']);
		}
		return $this->_rdb;
	}

	// 建立PDO连接
	protected function _wconnect(){
		if ($this->_wdb){
			return $this->_wdb;
		}
		$this->_wdb = $this->_connect($this->_config['write']);
		return $this->_wdb;
	}

	// 读取执行总出口
	protected function _query($sql)
	{
		//var_dump($sql);exit;
		if($this->_queryFromExec){
			$this->_wconnect();
			if(!$stmt = $this->_wdb->query($sql)){
				$tmparr = $this->_wdb->errorInfo();
				throw new APP_Exception($tmparr[2].'), SQL('.$sql, $tmparr[1]);
			}
		}else{
			$this->_rconnect();
			if(!$stmt = $this->_rdb->query($sql)){
				$tmparr = $this->_rdb->errorInfo();
				throw new APP_Exception($tmparr[2].'), SQL('.$sql, $tmparr[1]);
			}
		}
		return $stmt;
	}

	// 写入执行总出口
	protected function _exec($sql)
	{
		$this->_wconnect();
		if(($rowCount = $this->_wdb->exec($sql)) === false) {
			$tmparr = $this->_wdb->errorInfo();
			throw new APP_Exception($tmparr[2].'), SQL('.$sql, $tmparr[1]);
		}
		return $rowCount;
	}

	// 执行读操作
	public function query($sql){
		return $this->_query($sql);
	}

	// 执行写操作
	public function exec($sql){
		return $this->_exec($sql);
	}

	/**
	 * 获取sql的全部结果集,以数字索引的数组形式返回
	 * 默认使用当前adapter的fetchMode
	 *
	 * @param string  $sql        An SQL SELECT statement.
	 * @param mixed   $bind       Data to bind into SELECT placeholders.
	 * @param mixed   $fetchMode  Override current fetch mode.
	 * @return array
	 */
	public function fetchAll($sql){
		$stmt = $this->query($sql);
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}

	/**
	 * Fetches the first row of the SQL result.
	 * 默认使用当前adapter的fetchMode
	 *
	 * @param string|APP_Db_Select $sql An SQL SELECT statement.
	 * @param mixed $bind Data to bind into SELECT placeholders.
	 * @param mixed              $fetchMode Override current fetch mode.
	 * @return array
	 */
	public function fetchRow($sql){
		$stmt = $this->query($sql);
		return $stmt->fetch(PDO::FETCH_ASSOC);
	}

	function fetchOne($sql, $i = 0) {
		$stmt = $this->query($sql);
		return $stmt->fetchColumn($i);
	}

	/**
	 * gift an item
	 *
	 * @param string table name
	 * @param array  该条记录的相关数组(key为字段名，value为字段值)
	 * @return int   成功返回1(代表这个执行影响到的数据条数)
	 */
	public function insert($table, array $bind){
		$cols = array();
		$vals = array();
		foreach ($bind as $col => $val)
		{
			if($val=='')continue;
			$cols[] = $col;
			$vals[] = "'$val'";
		}
		$sql = "INSERT INTO ".$table.' (' . implode(', ', $cols) . ') '.'VALUES ('.implode(', ', $vals).')';
		//echo $sql;exit;
		return $this->exec($sql);
	}

	/**
	 * 最后插入的id
	 *
	 * @return int 返回最后插入的id
	 */
	public function lastInsertId()
	{
		$this->_wconnect();
		return $this->_wdb->lastInsertId();
	}

	/**
	 * 更改数据记录 update
	 *
	 * @param string        表名
	 * @param array      更改字段的键值对 eg. array('name'=>'tomsui')
	 * @param array|string  where 条件     eg. "name='tomsui' and age='27'"
							注意：$where 的数组形式是'与'的关系 array('id=14','id=28')是没有意义的

	 * @return int          返回执行影响的数据条目数
	 */
	public function update($table, array $bind, $where = '')
	{
		$set = array();
		foreach ($bind as $col => $val){
			if(in_array(substr($val,0,1),array('+','-'))&&$col!='status')
				$set[] = $col . ' = `'.$col.'`'.$val;
			elseif(strstr($val,'`'.$col.'`'))
				$set[] = $col . " = " . $val;
			else
				$set[] = $col . " = '" . $val . "'";
		}
		$sql = "UPDATE ".$table.' SET '.implode(', ', $set).(($where) ? " WHERE $where" : '');
		return $this->exec($sql);
	}

	/**
	 * 删除数据记录 delete
	 *
	 * @param string        表名
	 * @param array|string  where 条件  eg. "name='tomsui' and age='27'"
							注意：$where 的数组形式时是'与'的关系，见update

	 * @return int          返回执行影响的数据条目数
	 */

	public function delete($table, $where = ''){
		$sql = "DELETE FROM ".$table.(($where) ? " WHERE $where" : '');
		return $this->exec($sql);
	}

	public function listTables(){
		$stmt = $this->query('SHOW TABLES');
		return  $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
	}

	public function describeTable($tableName, $schemaName = null){
		if (!$schemaName){
			$schemaName = $this->_config['dbname'];
		}
		$sql = 'DESCRIBE '.$schemaName.'.'.$tableName;
		$stmt = $this->query($sql);
		$result = $stmt->fetchAll(PDO::FETCH_NUM);
		$desc = array();
		$i = 1;
		$p = 1;
		foreach ($result as $row){
			list($length, $scale, $precision, $unsigned, $primary, $primaryPosition, $identity)
				= array(null, null, null, null, false, null, false);
			if (preg_match('/unsigned/', $row[1])){
				$unsigned = true;
			}

			if (preg_match('/^((?:var)?char)\((\d+)\)/', $row[1], $matches)){
				$row[1] = $matches[1];
				$length = $matches[2];
			}else if (preg_match('/^decimal\((\d+),(\d+)\)/', $row[1], $matches)){
				$row[1] = 'decimal';
				$precision = $matches[1];
				$scale = $matches[2];
			}else if (preg_match('/^((?:big|medium|small|tiny)?int)\((\d+)\)/', $row[1], $matches)){
				$row[1] = $matches[1];
				$length = $matches[2];
			}
			if (strtoupper($row[3]) == 'PRI'){
				$primary = true;
				$primaryPosition = $p;
				if ($row[5] == 'auto_increment'){
					$identity = true;
				}else{
					$identity = false;
				}
				++$p;
			}
			$desc[$row[0]] = array(
				'SCHEMA_NAME'     => $schemaName,
				'TABLE_NAME'       => $tableName,
				'COLUMN_NAME'     => $row[0],
				'COLUMN_POSITION'  => $i,
				'DATA_TYPE'     => $row[1],
				'DEFAULT'         => $row[4],
				'NULLABLE'       => (bool) ($row[2] == 'YES'),
				'LENGTH'           => $length,
				'SCALE'         => $scale,
				'PRECISION'     => $precision,
				'UNSIGNED'       => $unsigned,
				'PRIMARY'         => $primary,
				'PRIMARY_POSITION' => $primaryPosition,
				'IDENTITY'       => $identity
			);
			++$i;
		}
		return $desc;
	}
}
