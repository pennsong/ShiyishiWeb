<?php
class membercard_Model extends Model{
	function init(){
		$this->membercard = Load::table('membercard');
	}

	function find($id){
		return $this->membercard->find($id);
	}

	function fetchRow($where,$order=null,$field='*'){
		return $this->membercard->fetchRow($where,$order,$field);
	}

	function checkcard($cardnum=null){
		if(!$cardnum)return 0;
		$cardinfo = $this->fetchRow("cardnum='".$cardnum."' AND isactive = 1");
		if(!$cardinfo){
			return 0;
		}
		if($cardinfo['isuse']==1){
			return -1;
		}
		if($cardinfo['startdatetime']>time()){
			return -2;
		}
		if($cardinfo['enddatetime']<time()){
			return -3;
		}
		return 1;
	}
}
?>