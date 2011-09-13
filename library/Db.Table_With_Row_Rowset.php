<?php

class APP_Db_Table_Row implements ArrayAccess
{
	protected $_data = array();

	protected $_modifiedFields = array();

	protected $_table = null;

	protected $_primary= array();

	protected $_isNew = true;

	protected $_isConstruct = false;

	public function __construct($table, $new = null){
		$this->_table = $table;
		$this->_primary = $table->getPrimaryKey();
		$this->_data += $this->_table->getCols();
		$this->_isNew = $new;
		$this->_isConstruct = true;
	}

	/**
	 * Returns the table object, or null if this is disconnected row
	 *
	 * @return APP_Db_Table_Abstract|null
	 */
	public function getTable(){
		return $this->_table;
	}

	/**
	 * Saves the properties to the database.
	 *
	 * This performs an intelligent insert/update
	 *
	 * @return mixed The primary key value(s), as an associative array if the
	 *     key is compound, or a scalar if the key is single-column.
	 */
	public function save(){
		if($this->_isNew === null){
			$this->_validateRow();
		}
		if ($this->_isNew) {
			return $this->_doInsert();
		} else {
			return $this->_doUpdate();
		}
	}

	public function remove(){
		return $this->delete();
	}

	/**
	 * Deletes existing rows.
	 *
	 * @return int The number of rows deleted.
	 */
	public function delete(){
		$where = $this->_getWhereQuery();
		$result = $this->_table->_delete($where);
		$this->_data = array();
		$this->_modifiedFields = array();
		return $result;
	}

	/**
	 * Returns the column/value data as an array.
	 *
	 * @return array
	 */
	public function toArray(){
		return (array) $this->_data;
	}

	/**
	 * Sets all data in the row from an array.
	 *
	 * @param  array $data
	 * @return APP_Db_Table_Row_Abstract Provides a fluent interface
	 */
	public function set(array $data){
		$data = array_intersect_key($data, $this->_data);
		foreach ($data as $key => $value){
			$this->__set($key, $value);
		}
		return $this;
	}

	/**
	 * @return mixed The primary key value(s), as an associative array if the
	 *     key is compound, or a scalar if the key is single-column.
	 */
	protected function _doUpdate(){
		$diffData = array_diff_key(array_intersect_key($this->_data, $this->_modifiedFields), array_flip($this->_primary));
		//$diffData = array_intersect_key($this->_data, $this->_modifiedFields);
		$rowCount = 0;
		if (count($diffData) > 0) {
			$rowCount = $this->_table->_update($diffData,$this->_getWhereQuery());
		}
		$this->_modifiedFields = array();
		return $rowCount;
	}

	/**
	 * @return mixed The primary key value(s), as an associative array if the
	 *     key is compound, or a scalar if the key is single-column.
	 */
	protected function _doInsert(){
		$data = array_intersect_key($this->_data, $this->_modifiedFields);
		$primaryKey = $this->_table->_insert($data);
		if (is_array($primaryKey)){
			$newPrimaryKey = $primaryKey;
		}else{
			$newPrimaryKey = array(current($this->_primary) => $primaryKey);
		}
		$this->_isNew = false;
		$this->_data = array_merge($this->_data, $newPrimaryKey);
		$this->_modifiedFields = array();
		return $primaryKey;
	}

	public function refresh($force = true){
		$this->_refresh($force);
	}

	/**
	 * Refreshes properties from the database.
	 *
	 * @return void
	 */
	protected function _refresh($force = false){
		$where = $this->_getWhereQuery();
		if(!$that = $this->_table->fetchRow($where)){
			$this->_isNew = true;
			return;
		}
		if($force){
			$this->_data = $that->toArray();
		}else{
			$this->_data = array_merge($this->_data, array_diff_key($that->toArray(),$this->_modifiedFields));
		}
		$this->_isNew = false;
	}

	protected function _validateRow(){
		$primary = array_intersect_key($this->_data, array_flip($this->_primary));
		foreach($primary as $key){
			if(!$key){
				$this->_isNew = true;
				return;
			}
		}
		$this->_refresh();
	}

	/**
	 * Constructs where statement for retrieving row(s).
	 *
	 * @param bool $useDirty
	 * @return array
	 */
	protected function _getWhereQuery(){
		return $this->_table->where(array_intersect_key($this->_data, array_flip($this->_primary)));
	}

	public function __get($key){
		 return $this->_data[$key];
	}

	public function __set($key, $value){
		if ($this->_isConstruct) {
			if(!array_key_exists($key, $this->_data)){
				throw new APP_Exception("col($key) is not in the row");
			}
			//不允许修改主键
			if(in_array($key, $this->_primary) && $this->_data[$key] && $this->_data[$key] != $value){
				throw new APP_Exception("primary($key) not allow modify");
			}
			//if($this->_data[$key] != $value){
			$this->_modifiedFields[$key] = true;
			//}
		}
		$this->_data[$key] = $value;
	}

	public function __isset($key){
		return array_key_exists($key, $this->_data);
	}

	public function __unset($key){
		unset($this->_data[$key]);
	}


	/**
	 *  offsetExists
	 *
	 *  Not designed for delvelopers. just method to implements ArrayAccess
	 *
	 * @param string $key
	 * @return bool
	 */
	public function offsetExists($key){
		return $this->__isset($key);
	}

	/**
	 *  offsetGet
	 *
	 *  Not designed for delvelopers. just method to implements ArrayAccess
	 *
	 * @param string $key
	 * @return mixed
	 */
	public function offsetGet($key){
		return $this->__get($key);
	}

	/**
	 *  offsetSet
	 *
	 *  Not designed for delvelopers. just method to implements ArrayAccess
	 *
	 * @param string $key
	 * @param mixed $value
	 * @return void
	 */
	public function offsetSet($key, $value){
		$this->__set($key, $value);
	}

	/**
	 *  offsetUnset
	 *
	 *  Not designed for delvelopers. just method to implements ArrayAccess
	 *
	 * @param string $key
	 * @return void
	 */
	public function offsetUnset($key){
		$this->__unset($key);
	}
	
	public function __sleep(){
		return array('_data');
	}
}


class APP_Db_Table_Rowset implements IteratorAggregate, ArrayAccess, Countable
{
	/**
	 * The APP_Db_Table_Row object for each row.
	 *
	 * @var array
	 */
	protected $_data = array();

	/**
	 * Constructor.
	 *
	 * @param array $_data
	 */
	public function __construct($_data){
		$this->_data = $_data;
	}

	/**
	 * Returns all data as an array.
	 *
	 * Not needed , just for compatibility with Zend
	 *
	 * @return array
	 */
	public function toArray(){
		$rev = array();
		foreach($this->_data as $item){
			$rev[] = $item->toArray();
		}
		return $rev;
	}

	/**
	 *  offsetExists
	 *
	 *  Not designed for delvelopers. just method to implements IteratorAggregate
	 *
	 * @param string $key
	 * @return bool
	 */
	public function getIterator(){
		return new ArrayIterator($this->_data);
	}

	/**
	 *  offsetExists
	 *
	 *  Not designed for delvelopers. just method to implements ArrayAccess
	 *
	 * @param string $key
	 * @return bool
	 */
	public function offsetExists($key){
		return isset($this->_data[$key]);
	}

	/**
	 *  offsetGet
	 *
	 *  Not designed for delvelopers. just method to implements ArrayAccess
	 *
	 * @param string $key
	 * @return mixed
	 */
	public function offsetGet($key){
		if($this->offsetExists($key)){
			return $this->_data[$key];
		}
		return null;
	}

	/**
	 *  offsetSet
	 *
	 *  Not designed for delvelopers. just method to implements ArrayAccess
	 *
	 * @param string $offset
	 * @param mixed $value
	 * @return void
	 */
	public function offsetSet($key, $value)
	{
		$this->_data[$key] = $value;
	}

	/**
	 *  offsetUnset
	 *
	 *  Not designed for delvelopers. just method to implements ArrayAccess
	 *
	 * @param string $offset
	 * @return void
	 */
	public function offsetUnset($key){
		unset($this->_data[$key]);
	}

	/**
	 *  offsetUnset
	 *
	 *  Not designed for delvelopers. just method to implements Countable
	 *
	 * @param string $offset
	 * @return void
	 */
	public function count(){
		return count($this->_data);
	}

	public function __sleep(){
		return array('_data');
	}
}



class APP_Db_Table
{
	protected $_db;

	protected $_prefix = null;

	protected $_schema = null;

	protected $_name = null;

	protected $_order = null;

	protected $_group = null;

	protected $_tableName = null;

	protected $_cols;

	protected $_primary = null;

	protected $_identity = 0;

	protected $_tableCache = null;

	protected $_rowClass = 'APP_Db_Table_Row';

	protected $_rowsetClass = 'APP_Db_Table_Rowset';

	public function __construct(array $config){
		if(!isset($config['name']) || !isset($config['db'])){
			throw new APP_Exception("config array error : 'name/db' required");
		}
		foreach ($config as $key => $value){
			switch ($key){
				case 'db':
					$this->_db = $value;
					break;
				case 'prefix':
					$this->_prefix = $value;
					break;
				case 'schema':
					$this->_schema = (string) $value;
					break;
				case 'name':
					$this->_name = (string) $value;
					break;
				case 'master':
					$this->isMaster((bool)$value);
					break;
				default:
					break;
			}
		}
		$this->_setup();
	}

	public function isMaster($type){
		$this->_db->setQueryFromExec($type);
	}

	public function getDb(){
		return $this->_db;
	}

	/**
	 * Turnkey for initialization of a table object.
	 * Calls other protected methods for individual tasks, to make it easier
	 * for a subclass to override part of the setup logic.
	 *
	 * @return void
	 */
	protected function _setup(){
		$this->_setupNames();
		$this->_setupTableCache();
	}

	/**
	 * Initialize table and schema names.
	 *
	 * @return void
	 */
	protected function _setupNames(){
		if (strpos($this->_name, '.')){
			list($this->_schema, $this->_name) = explode('.', $this->_name);
		}
		$dbconfig = $this->_db->getConfig();
		if ($this->_prefix !== null){
			$this->_name = $this->_prefix.$this->_name;
		}else{
			$this->_name = $dbconfig['prefix'] ? $dbconfig['prefix'].$this->_name : $this->_name;
		}
		if (!$this->_schema){
			$this->_schema = $dbconfig['dbname'];
		}
		
		if($this->_schema != $dbconfig['dbname']){
			$this->_tableName = $this->_schema.'.'.$this->_name;
		}else{
			$this->_tableName = $this->_name;
		}
		$this->_tableCache = "db.$this->_schema.$this->_name";
	}

	/**
	 * Initialize table's metadata and primary
	 *
	 * @return void
	 */
	protected function _setupTableCache(){
		$cache = Load::lib('cache_file');
		if(!$data = $cache->get($this->_tableCache)){
			/**
			 *  Initialize metadata
			 */
			$metadata = $this->_db->describeTable($this->_name, $this->_schema);

			/**
			 *  Initialize metadata
			 */
			$this->_cols = array();
			foreach ($metadata as $col => $val){
				$this->_cols[$col] = $val['DEFAULT'];
			}

			/**
			 *  Initialize primary
			 */
			if (!$this->_primary){
				$this->_primary = array();
				foreach ($metadata as $col){
					if ($col['PRIMARY'])
					{
						$this->_primary[ $col['PRIMARY_POSITION'] ] = $col['COLUMN_NAME'];
						if ($col['IDENTITY'])
						{
							$this->_identity = $col['PRIMARY_POSITION'];
							$this->_order = $col['COLUMN_NAME'].' DESC';
						}
					}
				}
				if (empty($this->_primary)){
					throw new APP_Exception('Table '.$this->_name.' must have a primary key, but none was found');
				}
			}else if (!is_array($this->_primary)){
				$this->_primary = array(1 => $this->_primary);
			}else if (isset($this->_primary[0])){
				array_unshift($this->_primary, null);
				unset($this->_primary[0]);
			}
			
			$this->_order = array_key_exists('orderid',$this->_cols) ? 'orderid' : $this->_order;
			

			/**
			 *  write the table infomation into cache
			 */
			$data = array(
								'schema'   => $this->_schema,
								'name'   => $this->_name,
								'cols'   => $this->_cols,
								'primary'  => $this->_primary,
								'identity' => $this->_identity,
								'order' => $this->_order
			);
			$cache->set($this->_tableCache, $data);
		}
		$this->_cols      = $data['cols'];
		$this->_primary   = $data['primary'];
		$this->_identity   = $data['identity'];
		$this->_order   = $data['order'];
	}

	/**
	 * Returns table information.
	 *
	 * You can select to return only a part of this information by supplying its key name,
	 * otherwise all information is returned as an array.
	 *
	 * @param  $key The specific info part to return OPTIONAL
	 * @return mixed
	 */
	public function info($key = null){
		$info = array(
			'schema'     => $this->_schema,
			'name'     => $this->_name,
			'cols'     => $this->_cols,
			'primary'   => $this->_primary
		);

		if ($key === null){
			return $info;
		}
		return $info[$key];
	}

	/**
	 * fetch the table's primary key
	 *
	 * @return array
	 */
	public function getPrimaryKey(){
		return $this->_primary;
	}


	/**
	 * Fetches rows by primary key.  The argument specifies one or more primary
	 * key value(s).  To find multiple rows by primary key, the argument must
	 * be an array.
	 * @param  mixed $key                   The value(s) of the primary keys.
	 * @return APP_Db_Table_Rowset_Abstract  Row(s) matching the criteria.
	 * @throws APP_Db_Table_Exception
	 */
	public function find($data, $by = null){
		$data = array($data);
		return $this->fetchRow($this->where($data, $by));
	}

	public function findBy($data, $by){
		$data = array($data);
		return $this->fetchAll($this->where($data, $by));
	}

	public function findAll(array $data, $by = null){
		return $this->fetchAll($this->where($data, $by));
	}

	/**
	 * Fetches all rows.
	 *
	 * @param string|array  $where  OPTIONAL An SQL WHERE clause 
	 * @param string|array  $order  OPTIONAL An SQL ORDER clause.
	 * @param int          $count   OPTIONAL An SQL LIMIT count. 
	 * @param int          $offset  OPTIONAL An SQL LIMIT offset.
	 * @return             APP_Db_Table_Rowset_Abstract object
	 */
	public function fetchAll($where = null, $order = null, $count = 0, $offset = 0){
		$sql = "SELECT * FROM $this->_tableName";

		if ($where !== null){
			$sql .= ' WHERE ' . $this->where($where);
		}

		$sql .= $this->order($order);

		$stmt = $this->_db->query($sql, $count, $offset);
		$data = $stmt->fetchAll(PDO::FETCH_CLASS, $this->_rowClass, array($this, false));
		return new $this->_rowsetClass($data);
	}

	/**
	 *  Fetches one row
	 *
	 * @param string|array  $where    OPTIONAL An SQL WHERE clause. 
	 * @param string|array  $order    OPTIONAL An SQL ORDER clause.
	 * @return            返回APP_Db_Table_Row_Abstract对象
	 */
	public function fetchRow($where = null, $order = null){
		/**
		 * 拼装sql语句
		 */
		$sql = "SELECT * FROM $this->_tableName";

		if ($where !== null){
			$sql .= ' WHERE ' . $this->where($where);
		}

		$sql .= $this->order($order);

		$sql .= ' LIMIT 1';

		/**
		 * 调用PDO查询, 获取数组.
		 */
		$stmt = $this->_db->query($sql);
		$stmt->setFetchMode(PDO::FETCH_CLASS, $this->_rowClass, array($this, false));
		return $stmt->fetch();
	}

	public function fetchOne($sql, $i = 0){
		return $this->_db->fetchOne($sql,$i);
	}

	/**
	 * 获取总条目
	 *
	 * 默认情况下获取表中全部记录条数
	 *
	 * @param   String|Array 附加的条件
	 * @return  Integer
	 */
	public function count($where = null){
		/**
		 * 拼装sql语句
		 */
		$sql = "SELECT count(*) as count FROM $this->_tableName";

		if ($where !== null){
			$sql .= ' WHERE ' . $this->where($where);
		}

		/**
		 * 调用PDO查询, 获取数组.
		 */
		return $this->fetchOne($sql);

	}

	/**
	 * 获取表中各字段的的默认值
	 *
	 * @return  Array 返回数组的key为字段名，value为该字段默认值.
	 */
	public function getCols(){
		return $this->_cols;
	}

	/**
	 * 新建一个APP_Db_Table_Row对象
	 *
	 * @param   array 是否提供的数据可选，提供的数据也不必是完整的
	 * @return  返回APP_Db_Table_Row对象
	 */
	public function createRow(array $data = array(), $new = null){
		$row = new $this->_rowClass($this,$new);
		$row->set($data);
		return $row;
	}

	public function add($data){
		$row = $this->createRow($data,true);
		$row->save($data);
		return $row;
	}

	public function update($data, $where = null){
		$pkData = array_intersect_key($data, array_flip($this->_primary));
		if(!$pkData){
			if($where === null){
				throw new APP_Exception("do update primary and where is empty");
			}
			return $this->_update($data, $where);
		}else{
			if($where !== null){
				throw new APP_Exception("do update primary exist and where exist");
			}
			$row = $this->createRow($data,false);
			$row->save($data);
			return $row;
		}
	}

	public function save($data){
		$row = $this->createRow($data,null);
		$row->save($data);
		return $row;
	}

	public function delete($where){
		return $this->_delete($where);
	}

	/**
	 * Inserts a new row.
	 *
	 * @param  array        $data  Column-value pairs.
	 * @return int|array    The primary key of the row inserted.
	 */
	public function _insert(array $data){
		$primary = $this->_primary;
		$pkIdentity = $primary[(int)$this->_identity];

		if (array_key_exists($pkIdentity, $data) && !$data[$pkIdentity])
		{
			unset($data[$pkIdentity]);
		}
		$this->_db->insert($this->_tableName, $data);
		if ($this->_identity && empty($data[$pkIdentity])){
			$data[$pkIdentity] = $this->_db->lastInsertId();
		}

		$pkData = array_intersect_key($data, array_flip($primary));
		if (count($primary) == 1)
		{
			reset($pkData);
			return current($pkData);
		}
		return $pkData;
	}

	/**
	 * Updates existing rows.
	 *
	 * @param  array        $data  Column-value pairs.
	 * @param  array|string $where An SQL WHERE clause, or an array of SQL WHERE clauses.
	 * @return int          The number of rows updated.
	 */
	public function _update(array $data, $where){
		return $this->_db->update($this->_tableName, $data, $where);
	}

	/**
	 * Deletes existing rows.
	 *
	 * @param  array|string $where SQL WHERE clause(s).
	 * @return int        The number of rows deleted.
	 */
	public function _delete($where){
		return $this->_db->delete($this->_tableName, $where);
	}

	/**
	 * form the sub where sql
	 *
	 * @param array
	 * @return string
	 */
	public function where($where, $by = null)
	{
		if(!eregi('[>|<|=| ]|like|in',$where)){
			if($by){
				$by = (array) $by;
				if(array_diff_key(array_flip($by), $this->_cols)){
					throw new APP_Exception("primary key not in cols");
				}
			}else{
				$by = $this->_primary;
			}
			$where = (array) $where;
			$whereOrTerms = array();
			foreach($where as $val){
				$val = (array) $val;
				if (count($val) != count($by)){
					throw new APP_Exception("cols not eq the num of primary key");
				}
				$val = array_combine($by, $val);
				$whereAndTerms = array();
				foreach ($val as $col => $v){
					$whereAndTerms[] = "$col = '$v'";
				}
				$whereOrTerms[] = '(' . implode(' AND ', $whereAndTerms) . ')';
			}
			$where = implode(' OR ', $whereOrTerms);
		}
		return $where;
	}

	public function setOrder($order){
		$this->_order = $order;
	}

	
	protected function order($order){
		if($order === null){
			$order = $this->_order;
		}
		if(!$order){
			return '';
		}
		$order = (array) $order;
		$order = implode(' , ', $order);
		return ' ORDER BY '.$order;
	}
}

