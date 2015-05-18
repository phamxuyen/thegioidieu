<?php
class ControllerModuleContact extends Controller {
	public function index() {
		$this->load->language('module/contact');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_enquiry'] = $this->language->get('entry_enquiry');
		
		$data['button_submit'] = $this->language->get('button_submit');
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['enquiry'])) {
			$data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$data['error_enquiry'] = '';
		}
		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} else {
			$data['title'] = '';
		}
		
		if (isset($this->request->post['enquiry'])) {
			$data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$data['enquiry'] = '';
		}
		
		$data['action'] = $this->url->link('module/contact');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/contact.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/contact.tpl', $data);
		} else {
			return $this->load->view('default/template/module/contact.tpl', $data);
		}
	}
	
	public function subscribe(){
	
		$this->load->language('module/contact');
		
		$json = array();
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
		
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
				$json['error']['name'] = $this->language->get('error_name');
			}

			if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
				$json['error']['email'] = $this->language->get('error_email');
			}
			
			if ((utf8_strlen($this->request->post['title']) < 3) || (utf8_strlen($this->request->post['title']) > 64)) {
				$json['error']['title'] = $this->language->get('error_title');
			}

			if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
				$json['error']['enquiry'] = $this->language->get('error_enquiry');
			}
			
			if (!$json) {

				$mail = new Mail($this->config->get('config_mail'));
				$mail->setTo($this->config->get('config_email'));
				$mail->setFrom($this->request->post['email']);
				$mail->setSender($this->request->post['name']);
				$mail->setSubject($this->request->post['title']);
				$mail->setText(strip_tags($this->request->post['enquiry']));
				$mail->send();
			
				$json['success'] = $this->language->get('text_success');
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
}