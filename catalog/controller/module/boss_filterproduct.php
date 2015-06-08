<?php
class ControllerModuleBossFilterProduct extends Controller {
	public function index($setting) {
		if(empty($setting))	return;
		static $module = 0;
		
		$this->load->language('module/boss_filterproduct');
		$data['heading_title'] = isset($setting['boss_filterproduct_module']['title'][$this->config->get('config_language_id')])?$setting['boss_filterproduct_module']['title'][$this->config->get('config_language_id')]:'';
		$this->document->addScript('catalog/view/javascript/bossthemes/carouFredSel-6.2.1.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/boss_filterproduct/boss_filterproduct.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/boss_filterproduct.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/boss_filterproduct.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/boss_filterproduct.css');
		}
		
		//get config
		$data['use_scrolling_panel'] = $setting['boss_filterproduct_module']['use_scrolling_panel'];
		$data['use_tab'] = $setting['boss_filterproduct_module']['use_tab'];
		$data['prod_item'] = $setting['boss_filterproduct_module']['scroll'];
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['template'] = $this->config->get('config_template');
		$data['image_width'] = $setting['boss_filterproduct_module']['image_width']; 
		$data['image_height'] = $setting['boss_filterproduct_module']['image_height'];
		
		$this->load->model('catalog/product');
		$this->load->model('catalog/category');
		
		$this->load->model('tool/image');
		
		$results = array();
		
		if(isset($setting['boss_filterproduct_module']['tabs'])){
		foreach ($setting['boss_filterproduct_module']['tabs'] as $tab) {

		if ($tab['type_product'] == "category") {
			
			if (isset($tab['filter_type_category'])) {
				
				$data['tabs'] = array();
				
				$categories = array();
				
				$catagory_name = $this->model_catalog_category->getCategory($tab['filter_type_category']);
				
				$results_category = $this->model_catalog_category->getCategories($tab['filter_type_category']);
				
				foreach ($results_category as $category) {
					$data_sort = array(
						'sort'  => 'pd.name',
						'order' => 'ASC',
						'start' => 0,
						'limit' => $setting['boss_filterproduct_module']['limit']
					);
					
					$results = $this->model_catalog_product->getProducts($data_sort);
					
					$products = array();
					
					foreach($results as $result){
					
						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $setting['boss_filterproduct_module']['image_width'], $setting['boss_filterproduct_module']['image_height']);
						} else {
							$image = false;
						}

						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$price = false;
						}
								
						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
							
							$btdiscount = (($result['price']-$result['special'])/$result['price'])*100;
						} else {
							$special = false;
							$btdiscount = 0;
						}
						
						$btdiscountend = number_format($btdiscount, 0);
						
						if ($this->config->get('config_review_status')) {
							$rating = $result['rating'];
						} else {
							$rating = false;
						}

						$products[] = array(
							'product_id' => $result['product_id'],
							'thumb'   	 => $image,
							'name'    	 => $result['name'],
							'description'=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
							'price'   	 => $price,
							'btdiscount'       => $btdiscountend,
							'special' 	 => $special,
							'rating'     => $rating,
							'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
							'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
						);
					}
					
					if ($category['image']) {
						$image_cate = $this->model_tool_image->resize($category['image'], 448, 608);
					} else {
						$image_cate = $this->model_tool_image->resize('catalog/thegioidieu/default.jpg', 448, 608);;
					}

					$categories[] = array(
						'name' => $category['name'],
						'image' => $image_cate,
						'products' => $products
					);				
				}
				
				
				
				
				$data['tabs'] = array(
						'name'	 		 	=> $catagory_name['name'],
						'href'  			=> $this->url->link('product/category', 'path=' . $tab['filter_type_category']),
						'categories'       	=> $categories
				);
				
			}
		}
		
		$data['module'] = $module++;
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_filterproduct.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_filterproduct.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_filterproduct.tpl', $data);
		}
	}
	}}
}
?>