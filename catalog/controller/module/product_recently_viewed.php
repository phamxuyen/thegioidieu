<?php
class ControllerModuleProductRecentlyViewed extends Controller {
	public function index($setting) {
		$this->load->language('module/product_recently_viewed');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		
		$data['item_per_row'] = $setting['item_per_row'];
		$limit = $setting['limit'];
		$image_width = $setting['width'];
		$image_height = $setting['height'];
		$description_limit = $this->config->get('config_product_description_length');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();
		
		if (!isset($this->session->data['recently_viewed'])) {
			$this->session->data['recently_viewed'] = array();
		}
		
		$recently_viewed = $this->session->data['recently_viewed'];	
		
		if (isset($this->request->get['product_id'])) {
			$session_recently_viewed[]= (int)$this->request->get['product_id'];
		} 
		
		$custom_limit = array_slice($recently_viewed, 0, (int)$setting['limit']);
		
		$products = $this->getProductsGroup(array('id_group'=>$custom_limit));
		
		/*product type*/ 
		foreach ($products as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $image_width, $image_height);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', $image_width, $image_height);
			}
			
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}	
			

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
							
			$data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,	
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'tax'         => $tax,
				'rating'     => $rating,
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $description_limit) . '..',
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}

		//if ($data['products']) {
			 $this_template = 'product_recently_viewed.tpl';
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/'.$this_template)) {
				return $this->load->view($this->config->get('config_template') . '/template/module/'.$this_template, $data);
			} else {
				return $this->load->view('default/template/module/'.$this_template, $data);
			}
		//}
	}
	private function getProductsGroup($data) {	
		$products_data=array();	
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}	
		
			$sql = "SELECT DISTINCT *, pd.name AS name, p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND customer_group_id = '" . (int)$customer_group_id . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id)";
		
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		
		if (isset($data['id_group'])) {
				if (!empty($data['id_group'])) {
						$id_group=implode(',',$data['id_group']);					
						$sql .= " AND p.product_id IN (".$id_group.")";
					
		} 
		$query = $this->db->query($sql);
			if ($query->num_rows) {		
				foreach ($query->rows as $result) {
				$queries[$result['product_id']]=array(
					'product_id'       => $result['product_id'],
					'name'             => $result['name'],
					'description'      => $result['description'],
					'meta_description' => $result['meta_description'],
					'meta_keyword'     => $result['meta_keyword'],
					'tag'              => $result['tag'],
					'model'            => $result['model'],
					'sku'              => $result['sku'],
					'upc'              => $result['upc'],
					'ean'              => $result['ean'],
					'jan'              => $result['jan'],
					'isbn'             => $result['isbn'],
					'mpn'              => $result['mpn'],
					'location'         => $result['location'],
					'quantity'         => $result['quantity'],
					'stock_status'     => $result['stock_status'],
					'image'            => $result['image'],
					'manufacturer_id'  => $result['manufacturer_id'],
					'manufacturer'     => $result['manufacturer'],
					'price'            => ($result['discount'] ? $result['discount'] : $result['price']),
					'special'          => $result['special'],
					'reward'           => $result['reward'],
					'points'           => $result['points'],
					'tax_class_id'     => $result['tax_class_id'],
					'date_available'   => $result['date_available'],
					'weight'           => $result['weight'],
					'weight_class_id'  => $result['weight_class_id'],
					'length'           => $result['length'],
					'width'            => $result['width'],
					'height'           => $result['height'],
					'length_class_id'  => $result['length_class_id'],
					'subtract'         => $result['subtract'],
					'rating'           => round($result['rating']),
					'reviews'          => $result['reviews'] ? $result['reviews'] : 0,
					'minimum'          => $result['minimum'],
					'sort_order'       => $result['sort_order'],
					'status'           => $result['status'],
					'date_added'       => $result['date_added'],
					'date_modified'    => $result['date_modified'],
					'viewed'           => $result['viewed']
				);
				}
				foreach ($data['id_group'] as $id) {
					$products_data[$id] = $queries[$id];
				}
			} 
		
		} 
		return $products_data;	
	}
}