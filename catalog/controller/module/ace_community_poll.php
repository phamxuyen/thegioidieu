<?php
class ControllerModuleAceCommunityPoll extends Controller {
	public function index(){	

		$setting = $this->config->get('ace_community_poll_module');
		static $module = 0;
		
		$language_data = $this->load->language('ace/poll');
		
		foreach($language_data as $key => $value){
			$data[$key] = $value;
		}
		
		$this->load->model('ace/poll');
		
		$data['display_title'] = true;
		
		if(isset($setting['display-title'])){ 
			$data['display_title'] = false;		
		}
		
		$poll_id = 0;
		
		if (isset($setting['poll_id'])){ 
			$poll_id = $setting['poll_id'];				
		}
		
		$data['poll_id'] = $poll_id;
			

		if(isset($this->request->cookie['poll_answered'.$poll_id])){
			if($this->request->cookie['poll_answered'.$poll_id] == $poll_id){ 
				$data['answered']=TRUE;
			}
		}
		
		$data['poll_id'] = $poll_id;
		$data['poll_data'] = $this->model_ace_poll->getPollData($poll_id);
		$data['text_poll_results'] = $this->language->get('text_poll_results');
		$data['poll_results'] = $this->url->link('module/ace_community_poll/full_result&poll_id='.$poll_id);
		$data['action'] = $this->url->link('content/poll');
		$reactions = $this->model_ace_poll->getPollResults($poll_id);
		$total_votes = $this->model_ace_poll->getTotalResults($poll_id);
		$percent = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		$totals = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		$vote = array();
			
		if($reactions){ 
			$data['reactions']=TRUE;
			foreach($reactions as $reaction){ 
				$totals[$reaction['answer'] - 1]++;
			}

			for($i=0;$i < 6;$i++){ 
				$percent[$i]=round(100 * ($totals[$i]/$total_votes));
				$vote[$i]=$totals[$i];
			}
		}
		
		$data['percent']=$percent;
		$data['vote']=$vote;
		$data['total_votes']=$total_votes;
		
		$data['id'] = 'module'.$module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/ace/community_poll/poll.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/ace/community_poll/poll.tpl', $data);
		} else {
			return $this->load->view('default/template/ace/community_poll/poll.tpl', $data);
		}
	}
	public function answer(){ 	
		$json = array();
		$poll_id = 0;
		$this->load->language('ace/poll');
			$this->load->model('ace/poll');
				if($this->request->server['REQUEST_METHOD']=='POST'&&isset($this->request->post['poll_answer'])){ 
		$this->model_ace_poll->addReaction($this->request->post);

			//$json['error'] = serialize($this->request->post);
			//Set a cookie:
			setcookie('poll_answered'.$this->request->post['poll_id'],$this->request->post['poll_id'], time()+60*60*24*7);
			//Can only vote once a week

			if(isset($this->request->post['poll_id'])){ 
				$poll_id=$this->request->post['poll_id'];
				$json['success'] = 'text_success';
			}else{				
				$json['error'] = 'Error';
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
	public function result(){ 
		$this->load->model('ace/poll');
			
		$language_data = $this->load->language('ace/poll');
		
		foreach($language_data as $key => $value){
			$data[$key] = $value;
		}				
			
		$poll_id = 0;
		
		if(isset($this->request->get['poll_id'])){ 
			$poll_id = $this->request->get['poll_id'];
		}
			
		$data['poll_id'] = $poll_id;
		

		if(isset($this->request->cookie['poll_answered'.$poll_id])){
			if($this->request->cookie['poll_answered'.$poll_id] == $poll_id){ 
				$data['answered'] = TRUE;
			}
		}
		$data['poll_id'] = $poll_id;
		$data['poll_data'] = $this->model_ace_poll->getPollData($poll_id);
		
		$data['poll_results']=$this->url->link('module/ace_community_poll/full_result&poll_id='.$poll_id);
		$data['action']=$this->url->link('content/poll');
		$reactions = $this->model_ace_poll->getPollResults($poll_id);
		$total_votes = $this->model_ace_poll->getTotalResults($poll_id);
		$percent = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		$totals = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		$vote = array();
			
		if($reactions){ 
			$data['reactions']=TRUE;
			foreach($reactions as $reaction){ 
				$totals[$reaction['answer'] - 1]++;
			}

			for($i=0;$i < 6;$i++){ 
				$percent[$i] = round(100 * ($totals[$i]/$total_votes));
				$vote[$i] = $totals[$i];
			}
		}
		
		$data['percent'] = $percent;
		$data['vote'] = $vote;
		$data['total_votes'] = $total_votes;			
			
		$data['id'] = 'module'.$poll_id;
		
		$json = array();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/ace/community_poll/poll_ajax.tpl')) {
			$json = $this->load->view($this->config->get('config_template') . '/template/ace/community_poll/poll_ajax.tpl', $data);
		} else {
			$json = $this->load->view('default/template/ace/community_poll/poll_ajax.tpl', $data);
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput($json);
	}
	
	public function full_result(){ 
		
		$language_data = $this->load->language('ace/poll');
		
		foreach($language_data as $key=>$value){
			$data[$key] = $value;
		}
		
		$this->load->model('ace/poll');
		$poll_id = 0;
		
		if(isset($this->request->get['poll_id'])){ 
			$poll_id = $this->request->get['poll_id'];
		}
			
		$reactions = $this->model_ace_poll->getPollResults($poll_id);
		
		$total_votes = $this->model_ace_poll->getTotalResults($poll_id);
		
		$percent = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		
		$totals = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		
		$vote = array();
			
		if($reactions){ 
			$data['reactions'] = TRUE;
			foreach($reactions as $reaction){ 
				$totals[$reaction['answer'] - 1]++;
			}

			for($i=0;$i < 6;$i++){ 
				$percent[$i] = round(100 * ($totals[$i]/$total_votes));	
				$vote[$i] = $totals[$i];
			}
		}
		
		$data['percent'] = $percent;
		$data['vote'] = $vote;
		$data['total_votes'] = $total_votes;
		$data['poll_data'] = $this->model_ace_poll->getPollData($poll_id);
		
///print_r($data);
		$json = array();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/ace/community_poll/poll_result.tpl')) {
			$json['html'] =  $this->load->view($this->config->get('config_template') . '/template/ace/community_poll/poll_result.tpl', $data);
		} else {
			$json['html'] = $this->load->view('default/template/ace/community_poll/poll_result.tpl', $data);
		}		

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
	
	public function chart(){ 
		$this->load->model('ace/poll');
				if(isset($this->request->get['poll_id'])){ 
		$poll_id=$this->request->get['poll_id'];}
		else{ 
		$poll_id = 0;
		}
		$poll_data=$this->model_ace_poll->getPollData($poll_id);
			$reactions=$this->model_ace_poll->getPollResults($poll_id);
			$total_votes=$this->model_ace_poll->getTotalResults($poll_id);
		
			$percent=array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			$totals=array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			if($reactions){ 
				
				$data['reactions']=TRUE;
			
					foreach($reactions as $reaction){ 
						$totals[$reaction['answer'] - 1]++;
					}

					for($i=0;$i < 15;$i++){ 
						$percent[$i]=round(100 * ($totals[$i]/$total_votes));	
					}
			}
		$labels=array();
		$values=array();

		for($i=0;$i < 6;$i++){ 
			if(!empty($poll_data['answer_'.($i + 1)])){
				array_push($labels,$poll_data['answer_'.($i + 1)]);
				array_push($values,$percent[$i]);
			}
		}
		$values=implode(',',$values);
		$labels=implode('|',$labels);
			$output='<div class="text-center">';
	$output.='<img src="http://chart.apis.google.com/chart?cht=p3&chco=303F4A,E4EEF7,849721&chd=t:'.$values . '&chs=750x350&chl='.$labels . '" class="img-responsive" alt="chart"/>';
			$output.='</div>';
		
		$this->response->setOutput($output);
	}
	
}
?>
