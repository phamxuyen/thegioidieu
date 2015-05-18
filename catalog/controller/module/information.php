<?php
class ControllerModuleInformation extends Controller {
	public function index($setting) {

		$data['heading_title'] = isset($setting['title'][$this->config->get('config_language_id')]) ? $setting['title'][$this->config->get('config_language_id')] : '';

		$this->load->model('catalog/information');

		$data['informations'] = array();
		
		$informations = $setting['information'];
		
		$sort_order = array(); 

		foreach ($informations as $information_id) {
			$information_info = $this->model_catalog_information->getInformation($information_id);
			
			if ($information_info) {
				$data['informations'][] = array(
					'title' => $information_info['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $information_info['information_id'])
				);
				$sort_order[] = $information_info['sort_order'];
			}
		}
		
		
		array_multisort($sort_order, SORT_ASC, $data['informations']);
			

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/information.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/information.tpl', $data);
		} else {
			return $this->load->view('default/template/module/information.tpl', $data);
		}
	}
}