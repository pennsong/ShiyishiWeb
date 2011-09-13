<?php
class APP_Db_Table
{
	protected $_db = null;

	protected $_prefix = null;

	protected $_schema = null;

	protected $_name = null;

	protected $_order = null;

	protected $_group = null;

	protected $_tableName = null;

	protected $_cols = array();

	protected $_primary = null;

	protected $_identity = 0;

	protected $_tableCache = null;

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
		if (!$this->_prefix){
			$this->_prefix = $dbconfig['prefix'] ? $dbconfig['prefix'] : '';
		}
		$this->_name = $this->_prefix.$this->_name;
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
		if(!$data = $cache->get($this->_tableCache,'dbs')){
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
			
			$this->_order = array_key_exists('order_id',$this->_cols) ? 'order_id' : $this->_order;
			

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
			$cache->set($this->_tableCache, $data,'dbs');
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
	public function query($sql){
		return $this->_db->query($sql);
	}
	
	public function queryRow($sql){
		return $this->_db->fetchRow($sql);
	}
	
	public function queryAll($sql){
		return $this->_db->fetchAll($sql);
	}

	public function find($data, $by = null){
		return $this->fetchRow($this->whereby(array($data), $by));
	}

	public function findBy($data, $by, $where = null){
		if(is_array($where)){
			$where1 = $where;
			$where1[] = $this->whereby(array($data), $by);
		}elseif(is_string($where)){
			$where1[] = $this->whereby(array($data), $by);
			$where1[] = $where;
		}else{
			$where1 = $this->whereby(array($data), $by);
		}
		return $this->fetchAll($where1);
	}

	public function findAll(array $data, $by = null){
		return $this->fetchAll($this->whereby($data, $by));
	}
	
	public function pageUnionAll($page, $count, $url, $rtable,$on,$where = null, $order = null,$field=null,$groupby = null){
		if($field){
			$field = (array)$field;
			$select = "SELECT ".implode(',',$field)." ";
		}else{
			$select = "SELECT a.*,b.* ";
		}
		$sql = " FROM `$this->_tableName` a LEFT JOIN `".$this->_prefix.$rtable."` b ON {$on}";
		if ($where){
			$sql .= ' WHERE ' . $this->where($where);
		}
		
		if($groupby){
			$total = $this->fetchOne('SELECT COUNT(DISTINCT '.$groupby.') '.$sql);
			$sql .= " GROUP BY ".$groupby;
		}else{
			$total = $this->fetchOne('SELECT COUNT(*)'.$sql);
		}

		$sql .= $this->order($order);

		if($count < 1){
			throw new APP_Exception('pageAll count must > 0.');
		}

		$pagesize = @ceil($total/$count);
		$page = max(1,min($pagesize,(int) $page));
		$sql .= " LIMIT " . (($page > 1) ? ($page-1)*$count . ', ' . $count : $count);
		if(is_array($url)){
			$type = $url['t'];
			$url = $url['url'];
		}else{
			$url .= strpos($url, '?') ? '&amp;' : '?';
			$type = 0;
		}
		$rows = $this->_db->fetchAll($select.$sql);
		Template::getInstance()->assign('page_arr',array('total'=>$total, 'page'=>$page, 'count'=>$count, 'pagesize'=>$pagesize, 'url'=>$url, 't'=>$type));
		return $rows;
	}
	
	public function pageAll($page, $count, $url, $where = null, $order = null,$field=null,$groupby=null){
		if($field){
			$field = (array)$field;
			$select = "SELECT ".implode(',',$field)." ";
		}else{
			$select = "SELECT * ";
		}
		$sql = " FROM `$this->_tableName`";
		if ($where){
			$sql .= ' WHERE ' . $this->where($where);
		}
		if($groupby){
			$total = $this->fetchOne('SELECT COUNT(DISTINCT '.$groupby.') '.$sql);
			$sql .= " GROUP BY ".$groupby;
		}else{
			$total = $this->fetchOne('SELECT COUNT(*)'.$sql);
		}
		//$total = $this->fetchOne('SELECT COUNT(*)'.$sql);
		$sql .= $this->order($order);

		if($count < 1){
			throw new APP_Exception('pageAll count must > 0.');
		}

		$pagesize = @ceil($total/$count);
		$page = max(1,min($pagesize,(int) $page));
		$sql .= " LIMIT " . (($page > 1) ? ($page-1)*$count . ', ' . $count : $count);
		if(is_array($url)){
			$type = $url['t'];
			$url = $url['url'];
		}else{
			$url .= strpos($url, '?') ? '&amp;' : '?';
			$type = 0;
		}
		$rows = $this->_db->fetchAll($select.$sql);
		Template::getInstance()->assign('page_arr',array('total'=>$total, 'page'=>$page, 'count'=>$count, 'pagesize'=>$pagesize, 'url'=>$url, 't'=>$type));
		return $rows;
	}

	public function fetchUnionAll($rtable,$on,$where = null, $order = null,$field=null,$limit=null,$groupby = null){
		if($field){
			$field = (array)$field;
			$select = "SELECT ".implode(',',$field)." ";
		}else{
			$select = "SELECT a.*,b.* ";
		}
		$sql = " FROM `$this->_tableName` a LEFT JOIN `".$this->_prefix.$rtable."` b ON {$on}";
		if ($where){
			$sql .= ' WHERE ' . $this->where($where);
		}
		if($groupby){
			$sql .= " GROUP BY ".$groupby;
		}
		$sql .= $this->order($order);
		if($limit){
			$sql .= " LIMIT ".$limit;
		}
		return $this->_db->fetchAll($select.$sql);
	}

	/**
	 * Fetches all rows.
	 *
	 * @param string|array  $where  OPTIONAL An SQL WHERE clause 
	 * @param string|array  $order  OPTIONAL An SQL ORDER clause.
	 * @param int          $count   OPTIONAL An SQL LIMIT count. 
	 * @return             APP_Db_Table_Rowset_Abstract object
	 */	
	public function fetchAll($where = null, $order = null, $fields = null, $limit=null,$groupby = null){
		if(!$fields) $fields = '*';
		$sql = "SELECT {$fields} FROM `$this->_tableName`";
		if ($where){
			$sql .= ' WHERE ' . $this->where($where);
		}
		if($groupby){
			$sql .= " GROUP BY ".$groupby;
		}
		$sql .= $this->order($order);
		if($limit){
			$sql .= " LIMIT ".$limit;
		}
		return $this->_db->fetchAll($sql);
	}

	public function fetchRowReArray($sql){
		return $this->_db->fetchRow($sql);
	}
	public function fetchAllReArray($sql){
		return $this->_db->fetchAll($sql);
	}
	/**
	 *  Fetches one row
	 *
	 * @param string|array  $where    OPTIONAL An SQL WHERE clause. 
	 * @param string|array  $order    OPTIONAL An SQL ORDER clause.
	 * @return            返回APP_Db_Table_Row_Abstract对象
	 */
	public function fetchRow($where = null, $order = null, $select = '*'){
		if(!$select) $select = '*';
		$sql = "SELECT {$select} FROM `$this->_tableName`";

		if ($where){
			$sql .= ' WHERE ' . $this->where($where);
		}

		$sql .= $this->order($order);

		$sql .= ' LIMIT 1';

		return $this->_db->fetchRow($sql);
	}

	public function fetchRows($where = null, $order = null, $limit = 10, $select = '*'){
		/**
		 * 拼装sql语句
		 */
		if(!$select)$select="*";
		$sql = "SELECT {$select} FROM `$this->_tableName`";

		if ($where){
			$sql .= ' WHERE ' . $this->where($where);
		}

		$sql .= $this->order($order);

		$sql .= ' LIMIT '.$limit;

		return $this->_db->fetchAll($sql);
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
	public function count($where = null,$groupby=null){
		/**
		 * 拼装sql语句
		 */
		if($groupby){
			$sql = "SELECT COUNT(DISTINCT ".$groupby.") FROM `$this->_tableName`";
		}else{
			$sql = "SELECT count(*) FROM `$this->_tableName`";
		}

		if ($where){
			$sql .= ' WHERE ' . $this->where($where);
		}

		/**
		 * 调用PDO查询, 获取数组.
		 */
		return $this->fetchOne($sql);

	}

	public function countUnionAll($rtable,$on,$where = null,$groupby = null){
		$sql = " FROM `$this->_tableName` a LEFT JOIN `".$this->_prefix.$rtable."` b ON {$on}";
		if ($where){
			$sql .= ' WHERE ' . $this->where($where);
		}
		
		if($groupby){
			$total = $this->fetchOne('SELECT COUNT(DISTINCT '.$groupby.') '.$sql);
		}else{
			$total = $this->fetchOne('SELECT COUNT(*)'.$sql);
		}

		return $total;
	}

	public function insert($data){
		return $this->_insert($data);
	}

	public function update($data, $where = null){
		return $this->_update($data, $where);
	}

	protected function _isExist($data){
		$pkDate = array_intersect_key($data, array_flip($this->_primary));
		if(empty($pkDate)){
			return false;
		}
		foreach($pkDate as $key){
			if(!$key){
				return false;
			}
		}
		$where = $this->whereby($pkDate);
		if(!$that = $this->fetchRow($where)){
			if($this->_identity){
				if($this->_name=='et_cps')return false;
				//不允许自增主键的table插入指定的主键值
				throw new APP_Exception("data not exist in table.");
			}
			return false;
		}
		return true;
	}

	public function save($data){
		if($this->_isExist($data) === false){
			return $this->_insert($data);
		}
		return $this->_update($data);
	}

	public function remove($data, $by = null){
		return $this->_delete($data, $by);
	}

	public function delete($data, $by = null){
		return $this->_delete($data, $by);
	}

	public function removeBy($where){
		return $this->_db->delete($this->_tableName, $where);
	}

	public function updateBy($data, $where){
		return $this->_db->update($this->_tableName, $data, $where);
	}

	/**
	 * Inserts a new row.
	 *
	 * @param  array        $data  Column-value pairs.
	 * @return int|array    The primary key of the row inserted.
	 */
	public function _insert(array $data){
		$data = $this->_filter($data);
		$pkIdentity = $this->_primary[(int)$this->_identity];
		if (!$pkData = $data[$pkIdentity]){
			unset($data[$pkIdentity]);
		}
		$this->_db->insert($this->_tableName, $data);
		if ($this->_identity){
			$pkData = $this->_db->lastInsertId();
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
	public function _update(array $data, $where = null){
		$data = $this->_filter($data);
		$pkData = array_intersect_key($data, array_flip($this->_primary));
		
		if(!$pkData){
			if(!$where){
				throw new APP_Exception("do update primary and where is empty");
			}
		}else{
			if($where){
				throw new APP_Exception("do update primary exist and where exist");
			}
			$where = $this->whereby(array($pkData));
		}
		return $this->_db->update($this->_tableName, $data, $where);
	}

	/**
	 * Deletes existing rows.
	 *
	 * @param  array|string $where SQL WHERE clause(s).
	 * @return int        The number of rows deleted.
	 */
	public function _delete($data, $by = null){
		return $this->_db->delete($this->_tableName, $this->whereby(array($data), $by));
	}

	public function where($where)
	{
		if(is_array($where)){
			$where = '(' . implode(' AND ', $where) . ')';
		}
		return $where;
	}

	/**
	 * form the sub where sql
	 *
	 * @param array
	 * @return string
	 */
	public function whereby($where, $by = null)
	{
		if(is_array($where)){
			if($by){
				$by = (array) $by;
				if(array_diff_key(array_flip($by), $this->_cols)){
					throw new APP_Exception("primary key not in cols");
				}
			}else{
				$by = $this->_primary;
			}
			
			$whereOrTerms = array();
			foreach($where as $val){
				$val = (array) $val;
				if (count($val) != count($by)){
					throw new APP_Exception("cols not eq the num of primary key");
				}
				$val = array_combine($by, $val);
				$whereAndTerms = array();
				foreach ($val as $col => $v){
					$whereAndTerms[] = "`$col` = '$v'";
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
		return " ORDER BY $order";
	}

	protected function _filter($info){
		return array_intersect_key($info, $this->_cols);
	}
}

