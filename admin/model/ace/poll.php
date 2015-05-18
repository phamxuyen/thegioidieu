<?php
class ModelAcePoll extends Model {
	public function addPoll($data){
		$this->db->query("INSERT INTO ".DB_PREFIX."ace_poll SET `color` = '".$this->db->escape($data['color'])."',date_added = now()");
		$poll_id=$this->db->getLastId();
		foreach($data['poll_description'] as $language_id =>$value){
			$this->db->query("INSERT INTO ".DB_PREFIX."ace_poll_description SET 
			poll_id='".(int)$poll_id."', 
			language_id='".(int)$language_id."',
			question='".$this->db->escape($value['question'])."', 
			answer_1='".$this->db->escape($value['answer_1'])."',
			answer_2='".$this->db->escape($value['answer_2'])."', 
			answer_3='".$this->db->escape($value['answer_3'])."',
			answer_4='".$this->db->escape($value['answer_4'])."',
			answer_5='".$this->db->escape($value['answer_5'])."',
			answer_6='".$this->db->escape($value['answer_6'])."'			
			");
		}
			if(isset($data['poll_store'])){
			foreach($data['poll_store'] as $store_id){
				$this->db->query("INSERT INTO ".DB_PREFIX."ace_poll_to_store SET poll_id='".(int)$poll_id."', store_id='".(int)$store_id."'");
			}
		}
			$this->cache->delete('poll');
	}

	public function editPoll($poll_id,$data){
		$this->db->query("UPDATE ".DB_PREFIX."ace_poll SET `color` = '".$this->db->escape($data['color'])."' WHERE poll_id='".(int)$poll_id."'");
		$this->db->query("DELETE FROM ".DB_PREFIX."ace_poll_description WHERE poll_id='".(int)$poll_id."'");
		foreach($data['poll_description'] as $language_id =>$value){
			$this->db->query("INSERT INTO ".DB_PREFIX."ace_poll_description SET poll_id='".(int)$poll_id."',
			language_id='".(int)$language_id."', 
			question='".$this->db->escape($value['question'])."',
			answer_1='".$this->db->escape($value['answer_1'])."',
			answer_2='".$this->db->escape($value['answer_2'])."',
			answer_3='".$this->db->escape($value['answer_3'])."',
			answer_4='".$this->db->escape($value['answer_4'])."',
			answer_5='".$this->db->escape($value['answer_5'])."',
			answer_6='".$this->db->escape($value['answer_6'])."'	
			");
		}
			$this->db->query("DELETE FROM ".DB_PREFIX."ace_poll_to_store WHERE poll_id='".(int)$poll_id."'");
    	if(isset($data['poll_store'])){
			foreach($data['poll_store'] as $store_id){
				$this->db->query("INSERT INTO ".DB_PREFIX."ace_poll_to_store SET poll_id='".(int)$poll_id."', store_id='".(int)$store_id."'");
			}
		}
			$this->cache->delete('poll');
	}

	public function deletePoll($poll_id){
		$this->db->query("DELETE FROM ".DB_PREFIX."ace_poll WHERE poll_id='".(int)$poll_id."'");
		$this->db->query("DELETE FROM ".DB_PREFIX."ace_poll_description WHERE poll_id='".(int)$poll_id."'");
		$this->db->query("DELETE FROM ".DB_PREFIX."ace_poll_to_store WHERE poll_id='".(int)$poll_id."'");
		$this->cache->delete('poll');
	}	

	public function getPoll($poll_id){
		$query=$this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX."ace_poll WHERE poll_id='".(int)$poll_id."'");
		return $query->row;
	}

	public function getPollDescriptions($poll_id){
		$poll_description_data=array();
		$query=$this->db->query("SELECT * FROM ".DB_PREFIX."ace_poll_description WHERE poll_id='".(int)$poll_id."'");
		foreach($query->rows as $result){
			$poll_description_data[$result['language_id']]=array(
				'question' =>$result['question'],
				'answer_1' =>$result['answer_1'],
				'answer_2' =>$result['answer_2'],
				'answer_3' =>$result['answer_3'],
				'answer_4' =>$result['answer_4'],
				'answer_5' =>$result['answer_5'],
				'answer_6' =>$result['answer_6']
			);
		}
		return $poll_description_data;
	}

	public function getPolls(){
		$query=$this->db->query("SELECT * FROM ".DB_PREFIX."ace_poll p LEFT JOIN ".DB_PREFIX."ace_poll_description pd ON (p.poll_id = pd.poll_id) WHERE pd.language_id='".(int)$this->config->get('config_language_id')."' ORDER BY p.date_added");
		return $query->rows;
	}

	public function getTotalPolls(){
     	$query=$this->db->query("SELECT COUNT(*) AS total FROM ".DB_PREFIX."ace_poll");
		return $query->row['total'];
	}

	public function getPollData($poll_id){
		$query=$this->db->query("SELECT * FROM ".DB_PREFIX."ace_poll p 
		LEFT JOIN ".DB_PREFIX."ace_poll_description pd ON (p.poll_id = pd.poll_id) 
		WHERE pd.language_id='".(int)$this->config->get('config_language_id')."' 
		AND p.poll_id='".(int)$poll_id."'");
		return $query->row;
	}

	public function getPollResults($poll_id){
		$query=$this->db->query("SELECT * FROM ".DB_PREFIX."ace_poll_reactions WHERE poll_id='".(int)$poll_id."'");
		return $query->rows;
	}

	public function getTotalResults($poll_id){
		$query=$this->db->query("SELECT COUNT(*) AS total FROM ".DB_PREFIX."ace_poll_reactions WHERE poll_id='".(int)$poll_id."'");
		return $query->row['total'];
	}

	public function getPollStores($poll_id){
		$poll_store_data=array();
		$query=$this->db->query("SELECT * FROM ".DB_PREFIX."ace_poll_to_store WHERE poll_id='".(int)$poll_id."'");
		foreach($query->rows as $result){
			$poll_store_data[]=$result['store_id'];
		}
		return $poll_store_data;
	}
}
?>
