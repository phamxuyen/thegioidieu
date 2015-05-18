<?php
class ModelAcePoll extends Model {
	public function getPolls(){
		$query=$this->db->query("SELECT * FROM ".DB_PREFIX."ace_poll p 
		LEFT JOIN ".DB_PREFIX."ace_poll_description pd ON (p.poll_id = pd.poll_id) 
		LEFT JOIN ".DB_PREFIX."ace_poll_to_store p2s ON (p.poll_id = p2s.poll_id) 
		WHERE pd.language_id='".(int)$this->config->get('config_language_id')."' 
		AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
		ORDER BY p.date_added");
		return $query->rows;
	}
	public function getPollData($poll_id) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."ace_poll p 
		LEFT JOIN ".DB_PREFIX."ace_poll_description pd ON (p.poll_id = pd.poll_id) 
		LEFT JOIN ".DB_PREFIX."ace_poll_to_store p2s ON (p.poll_id = p2s.poll_id) 		
		WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
		AND p.poll_id = '" . (int)$poll_id . "' 
		AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		
		return $query->row;
	}

	public function getPollResults($poll_id) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."ace_poll_reactions WHERE poll_id = '" . (int)$poll_id . "'");
		return $query->rows;
	}

	public function getTotalResults($poll_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM ".DB_PREFIX."ace_poll_reactions WHERE poll_id = '" . (int)$poll_id . "'");
		return $query->row['total'];
	}

	public function addReaction($data) {
		$this->db->query("INSERT INTO ".DB_PREFIX."ace_poll_reactions SET poll_id = '" . (int)$this->request->post['poll_id'] . "', answer = '" . (int)$this->request->post['poll_answer'] . "'");
	}
}
?>
