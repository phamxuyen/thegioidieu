<?php
class ControllerModuleBossTagCloud extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$this->load->language('module/boss_tagcloud');

		if (isset($setting['boss_tagcloud_module'][$this->config->get('config_language_id')])) {
			$data['heading_title'] = html_entity_decode($setting['boss_tagcloud_module'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
		
			$data['text_notags'] = $this->language->get('text_notags');
			
			$this->load->model('bossthemes/boss_tagcloud');
			
			$data['boss_tagcloud'] = $this->model_bossthemes_boss_tagcloud->getRandomTags(
				$setting['boss_tagcloud_module_limit'],
				(int)$setting['boss_tagcloud_module_min_size'],
				(int)$setting['boss_tagcloud_module_max_size'],
				$setting['boss_tagcloud_module_font_weight']
			);
			
			$data['module'] = $module++;

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_tagcloud.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/boss_tagcloud.tpl', $data);
			} else {
				return $this->load->view('default/template/module/boss_tagcloud.tpl', $data);
			}
		}
	}
}
?>
