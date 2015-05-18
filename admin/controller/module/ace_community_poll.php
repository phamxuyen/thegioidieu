<?php    
class ControllerModuleAceCommunityPoll extends Controller {   
	private $error = array(); 
	public function index() {
	
		$this->load->model('ace/poll');		
			
		$language_data = $this->load->language('ace/global_lang');
		
		foreach($language_data as $key=>$value){
			$data[$key] = $value;
		}
		
		$this->document->setTitle($this->language->get('heading_community_poll'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ace_community_poll', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}		
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['dimension'])) {
			$data['error_dimension'] = $this->error['dimension'];
		} else {
			$data['error_dimension'] = array();
		}
				
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_community_poll'),
			'href'      => $this->url->link('module/ace_community_poll', 'token=' . $this->session->data['token'], 'SSL')
   		);
		$data['insert'] = $this->url->link('ace/poll/insert', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['action'] = $this->url->link('module/ace_community_poll', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('ace/dashboard', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['ace_community_poll_status'])) {
			$data['community_poll_status'] = $this->request->post['ace_community_poll_status'];
		} else {
			$data['community_poll_status'] = $this->config->get('ace_community_poll_status');
		}
		
		if (isset($this->request->post['ace_community_poll_module'])) {
			$modules = $this->request->post['ace_community_poll_module'];
		} else {
			$modules = $this->config->get('ace_community_poll_module');
		}
		
		$data['poll_id'] = $modules['poll_id'];

		$data['polls'] = $this->model_ace_poll->getPolls();
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('ace/module/community_poll.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/ace_community_poll')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>