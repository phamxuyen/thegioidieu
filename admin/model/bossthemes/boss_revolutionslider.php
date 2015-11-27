<?php
class ModelBossthemesBossRevolutionSlider extends Model { 

	public function createdb(){
	
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."btslider'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="DELETE FROM `".DB_PREFIX."btslider`";
			$query = $this->db->query( $sql );
		}
		
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."btslider_slide'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="DELETE FROM `".DB_PREFIX."btslider_slide`";
			$query = $this->db->query( $sql );
		}
		
		$sql = array();
		$sql[]  = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."btslider` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `setting` text COLLATE utf8_unicode_ci,
		  PRIMARY KEY (`id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;";
		
		$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."btslider_slide` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`slider_id` int(11) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '0',
			`sort_order` int(3) NOT NULL DEFAULT '0',
			`slideset` text COLLATE utf8_unicode_ci,
			`caption` text COLLATE utf8_unicode_ci,
			PRIMARY KEY (`id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;";
		
		$setting =  $this->db->escape('{"slider_type":"custom","slider_width":"1920","slider_height":"600","delay":"5000","startWithSlide":"0","stopslider":"off","stopafterloops":"-1","stopatslide":"-1","touchenabled":"off","onhoverstop":"off","timeline":"on","timerlineposition":"top","shadow":"0","navigationtype":"bullet","navigationarrow":"solo","navigationstyle":"preview2","navigationhalign":"center","navigationvalign":"bottom","navigationhoffset":"0","navigationvoffset":"30","soloarrowlefthalign":"left","soloarrowleftvalign":"center","soloarrowlefthoffset":"0","soloarrowleftvoffset":"0","soloarrowrighthalign":"right","soloarrowrightvalign":"center","soloarrowrighthoffset":"0","soloarrowrightvoffset":"0","timehidethumbnail":"200","thumbnailwidth":"100","thumbnailheight":"50","thumbamount":"2","hidecapptionatlimit":"2","hideallcapptionatlimit":"767","hideslideratlimit":"2"}');
		$setting2 =  $this->db->escape('{"slider_type":"custom","slider_width":"830","slider_height":"480","delay":"5000","startWithSlide":"0","stopslider":"on","stopafterloops":"-1","stopatslide":"-1","touchenabled":"on","onhoverstop":"on","timeline":"on","timerlineposition":"top","shadow":"0","navigationtype":"bullet","navigationarrow":"solo","navigationstyle":"preview2","navigationhalign":"center","navigationvalign":"bottom","navigationhoffset":"0","navigationvoffset":"20","soloarrowlefthalign":"left","soloarrowleftvalign":"center","soloarrowlefthoffset":"0","soloarrowleftvoffset":"0","soloarrowrighthalign":"right","soloarrowrightvalign":"center","soloarrowrighthoffset":"0","soloarrowrightvoffset":"0","timehidethumbnail":"0","thumbnailwidth":"0","thumbnailheight":"0","thumbamount":"0","hidecapptionatlimit":"0","hideallcapptionatlimit":"767","hideslideratlimit":"0"}');
		$setting3 =  $this->db->escape('{"slider_type":"custom","slider_width":"1920","slider_height":"1000","delay":"5000","startWithSlide":"0","stopslider":"on","stopafterloops":"-1","stopatslide":"-1","touchenabled":"off","onhoverstop":"off","timeline":"on","timerlineposition":"top","shadow":"0","navigationtype":"bullet","navigationarrow":"solo","navigationstyle":"preview2","navigationhalign":"center","navigationvalign":"bottom","navigationhoffset":"0","navigationvoffset":"30","soloarrowlefthalign":"left","soloarrowleftvalign":"center","soloarrowlefthoffset":"0","soloarrowleftvoffset":"0","soloarrowrighthalign":"right","soloarrowrightvalign":"center","soloarrowrighthoffset":"0","soloarrowrightvoffset":"0","timehidethumbnail":"200","thumbnailwidth":"100","thumbnailheight":"50","thumbamount":"2","hidecapptionatlimit":"2","hideallcapptionatlimit":"767","hideslideratlimit":"2"}');
		$slideset1 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_leather/slideshow1.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_blank","kenburns":"off","enablefullvideo":"1"}');
		$caption1 =  $this->db->escape('[{"text_caption":{"1":"&lt;span class=&quot;btn&quot;&gt;shop women&lt;/span&gt;","2":"&lt;span class=&quot;btn&quot;&gt;shop women&lt;/span&gt;"},"datax":"1046","type_caption":"text","datay":"426","class_css":"medium_text","dataspeed":"500","datastart":"2400","dataend":"5000","dataafterspeed":"300","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"image_caption":"catalog/bt_leather/slideshow-img1-1.jpg","datax":"205","type_caption":"image","datay":"16","class_css":"big_white","dataspeed":"100","datastart":"800","dataend":"5000","dataafterspeed":"100","incom_animation":"sfl","outgo_animation":"str","easing":"easeOutBack","endeasing":"easeOutBack"},{"image_caption":"catalog/bt_leather/slideshow-img1-2.jpg","datax":"513","type_caption":"image","datay":"92","class_css":"big_white","dataspeed":"100","datastart":"1000","dataend":"5000","dataafterspeed":"100","incom_animation":"sfr","outgo_animation":"stl","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"SEPTEMBER LOOKBOOK","2":"SEPTEMBER LOOKBOOK"},"datax":"1168","type_caption":"text","datay":"91","class_css":"medium_white","dataspeed":"100","datastart":"1200","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stb","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"PROIN SED LIBERO VEHICULA AUGUE VENENATIS HENDRERIT.","2":"PROIN SED LIBERO VEHICULA AUGUE VENENATIS HENDRERIT."},"datax":"1065","type_caption":"text","datay":"343","class_css":"small_text","dataspeed":"100","datastart":"2000","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"FALL / WINTER\\r\\n","2":"FALL / WINTER\\r\\n"},"datax":"1046","type_caption":"text","datay":"164","class_css":"very_large_text","dataspeed":"100","datastart":"1600","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stb","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"2014","2":"2014"},"datax":"1213","type_caption":"text","datay":"238","class_css":"very_large_text","dataspeed":"100","datastart":"1800","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":" INTEGER FAUCIBUS AC SEM EU ALIQUAM","2":" INTEGER FAUCIBUS AC SEM EU ALIQUAM"},"datax":"1130","type_caption":"text","datay":"367","class_css":"small_text","dataspeed":"100","datastart":"2200","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"___","2":"___"},"datax":"1225","type_caption":"text","datay":"100","class_css":"line_white","dataspeed":"100","datastart":"1400","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$slideset2 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_leather/slideshow2.jpg","transitions":"fade","slotamount":"7","masterspeed":"500","delay":"5000","target":"_blank","kenburns":"off","enablefullvideo":"1"}');
		$caption2 =  $this->db->escape('[{"text_caption":{"1":"&lt;span class=&quot;btn&quot;&gt;shop men&lt;/span&gt;","2":"&lt;span class=&quot;btn&quot;&gt;shop men&lt;/span&gt;"},"datax":"410","type_caption":"text","datay":"728","class_css":"medium_text","dataspeed":"500","datastart":"2000","dataend":"5000","dataafterspeed":"300","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"image_caption":"catalog/bt_leather/slideshow-img2-1.png","datax":"255","type_caption":"image","datay":"72","class_css":"big_white","dataspeed":"100","datastart":"800","dataend":"5000","dataafterspeed":"100","incom_animation":"sfl","outgo_animation":"str","easing":"easeOutBack","endeasing":"easeOutBack"},{"image_caption":"catalog/bt_leather/slideshow-img2-2.png","datax":"504","type_caption":"image","datay":"26","class_css":"big_white","dataspeed":"100","datastart":"1000","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"LOREM ENIM ODIO","2":"LOREM ENIM ODIO"},"datax":"340","type_caption":"text","datay":"402","class_css":"large_text","dataspeed":"100","datastart":"1200","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"EGET VELIT SED METUS PRETIUM LOBORTIS UT ELEMENTUM ODIO","2":"EGET VELIT SED METUS PRETIUM LOBORTIS UT ELEMENTUM ODIO"},"datax":"282","type_caption":"text","datay":"668","class_css":"small_text","dataspeed":"100","datastart":"1800","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"&lt;span class=&quot;btn&quot;&gt;shop men&lt;/span&gt;","2":"&lt;span class=&quot;btn&quot;&gt;shop men&lt;/span&gt;"},"datax":"365","type_caption":"text","datay":"517","class_css":"medium_text","dataspeed":"100","datastart":"1600","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"eget velit sed metus pretium lobortis ut elementum odio","2":"eget velit sed metus pretium lobortis ut elementum odio"},"datax":"355","type_caption":"text","datay":"481","class_css":"small_text","dataspeed":"100","datastart":"1400","dataend":"5000","dataafterspeed":"100","incom_animation":"sft","outgo_animation":"stt","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$slideset21 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_leather/deals/slider-deal1.jpg","transitions":"fade","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption21 =  $this->db->escape('null');
		$slideset22 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_leather/deals/slider-deal2.jpg","transitions":"fade","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption22 =  $this->db->escape('null');
		$slideset31 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/promotional/slide1.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption31 =  $this->db->escape('[{"text_caption":{"1":"It&amp;rsquo;s Time To Think&lt;br \\/&gt;\\r\\n About...","2":"It&amp;rsquo;s Time To Think&lt;br \\/&gt;\\r\\n About..."},"datax":"950","type_caption":"text","datay":"120","class_css":"big_white","dataspeed":"500","datastart":"500","dataend":"4000","dataafterspeed":"500","incom_animation":"lft","outgo_animation":"ltr","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Duis a mollis velit. Mauris aliquet risus felis, mattis finibus nam&lt;br\\/&gt;\\r\\nviverra hendrerit sed sed odio","2":"Duis a mollis velit. Mauris aliquet risus felis, mattis finibus nam&lt;br\\/&gt;\\r\\nviverra hendrerit sed sed odio"},"datax":"935","type_caption":"text","datay":"256","class_css":"medium_white_16","dataspeed":"500","datastart":"1500","dataend":"4500","dataafterspeed":"500","incom_animation":"lft","outgo_animation":"ltr","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"&lt;a class=&quot;btn&quot;&gt;Shop Now&lt;\\/a&gt;","2":"&lt;a class=&quot;btn&quot;&gt;Shop Now&lt;\\/a&gt;"},"datax":"975","type_caption":"text","datay":"316","class_css":"white_regular_18","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"500","incom_animation":"sft","outgo_animation":"ltr","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$slideset32 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/promotional/slide2.jpg","transitions":"slidedown","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption32 =  $this->db->escape('[{"text_caption":{"1":"It&amp;rsquo;s Time To Think&lt;br \\/&gt;\\r\\nAbout...","2":"It&amp;rsquo;s Time To Think&lt;br \\/&gt;\\r\\nAbout..."},"datax":"385","type_caption":"text","datay":"370","class_css":"big_black","dataspeed":"500","datastart":"500","dataend":"4500","dataafterspeed":"500","incom_animation":"skewfromleftshort","outgo_animation":"skewtoright","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Duis a mollis velit. Mauris aliquet risus felis, mattis finibus nam&lt;br \\/&gt;\\r\\nviverra hendrerit sed sed odio","2":"Duis a mollis velit. Mauris aliquet risus felis, mattis finibus nam&lt;br \\/&gt;\\r\\nviverra hendrerit sed sed odio"},"datax":"360","type_caption":"text","datay":"510","class_css":"medium_black","dataspeed":"500","datastart":"1000","dataend":"4500","dataafterspeed":"500","incom_animation":"skewfromrightshort","outgo_animation":"skewtoleft","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"&lt;a class=&quot;btn&quot;&gt;Shop Now&lt;\\/a&gt;","2":"&lt;a class=&quot;btn&quot;&gt;Shop Now&lt;\\/a&gt;"},"datax":"400","type_caption":"text","datay":"570","class_css":"white_regular_18","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"500","incom_animation":"skewfromleftshort","outgo_animation":"skewtoright","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$slideset33 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/promotional/slide3.jpg","transitions":"boxslide","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption33 =  $this->db->escape('[{"text_caption":{"1":"It&amp;rsquo;s Time To Think About...","2":"It&amp;rsquo;s Time To Think About..."},"datax":"670","type_caption":"text","datay":"100","class_css":"big_white","dataspeed":"500","datastart":"500","dataend":"4000","dataafterspeed":"500","incom_animation":"lft","outgo_animation":"customout","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Duis a mollis velit. Mauris aliquet risus felis, mattis finibus nam&lt;br/&gt;\\r\\nviverra hendrerit sed sed odio","2":"Duis a mollis velit. Mauris aliquet risus felis, mattis finibus nam&lt;br/&gt;\\r\\nviverra hendrerit sed sed odio"},"datax":"720","type_caption":"text","datay":"180","class_css":"medium_white_16","dataspeed":"500","datastart":"1000","dataend":"4500","dataafterspeed":"500","incom_animation":"lft","outgo_animation":"randomrotateout","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"&lt;a class=&quot;btn&quot;&gt;Shop Now&lt;/a&gt;","2":"&lt;a class=&quot;btn&quot;&gt;Shop Now&lt;/a&gt;"},"datax":"760","type_caption":"text","datay":"240","class_css":"white_regular_18","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"500","incom_animation":"lft","outgo_animation":"customout","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$slideset34 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/promotional/slide4.jpg","transitions":"slidehorizontal","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption34 =  $this->db->escape('[{"text_caption":{"1":"It&amp;rsquo;s Time To Think&lt;br \\/&gt;\\r\\nAbout...","2":"It&amp;rsquo;s Time To Think&lt;br \\/&gt;\\r\\nAbout..."},"datax":"290","type_caption":"text","datay":"370","class_css":"big_black","dataspeed":"500","datastart":"500","dataend":"4000","dataafterspeed":"500","incom_animation":"skewfromleftshort","outgo_animation":"skewtorightshort","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Duis a mollis velit. Mauris aliquet risus felis, mattis finibus nam&lt;br \\/&gt;\\r\\nviverra hendrerit sed sed odio","2":"Duis a mollis velit. Mauris aliquet risus felis, mattis finibus nam&lt;br \\/&gt;\\r\\nviverra hendrerit sed sed odio"},"datax":"268","type_caption":"text","datay":"500","class_css":"medium_black","dataspeed":"500","datastart":"1000","dataend":"4500","dataafterspeed":"500","incom_animation":"skewfromrightshort","outgo_animation":"skewtoleft","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"&lt;a class=&quot;btn&quot;&gt;Shop Now&lt;\\/a&gt;","2":"&lt;a class=&quot;btn&quot;&gt;Shop Now&lt;\\/a&gt;"},"datax":"310","type_caption":"text","datay":"570","class_css":"white_regular_18","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"500","incom_animation":"skewfromleftshort","outgo_animation":"skewtoright","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$sql[] = "INSERT INTO `".DB_PREFIX."btslider` (`id`, `setting`) VALUES
(24, '".$setting."'),(25, '".$setting2."'),(26, '".$setting3."');";
		$sql[] = "INSERT INTO `".DB_PREFIX."btslider_slide` (`id`, `slider_id`, `status`, `sort_order`, `slideset`, `caption`) VALUES
(17, 24, 1, 1, '".$slideset1."', '".$caption1."'),
(18, 24, 1, 2, '".$slideset2."', '".$caption2."'),
(19, 25, 1, 1, '".$slideset21."', '".$caption21."'),
(20, 25, 1, 2, '".$slideset22."', '".$caption22."'),
(21, 26, 1, 1, '".$slideset31."', '".$caption31."'),
(22, 26, 1, 2, '".$slideset32."', '".$caption32."'),
(23, 26, 1, 3, '".$slideset33."', '".$caption33."'),
(24, 26, 1, 4, '".$slideset34."', '".$caption34."');";
		foreach( $sql as $q ){
			$query = $this->db->query( $q );
		}
	}

	public function addSlide($data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "btslider_slide SET slider_id = '" . (int)$data['slider_id'] . "', status = '" . (int)$data['status'] . "',slideset = '" . $data['slideset'] . "',caption = '" . $data['caption'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
	}
	
	public function addSlide_New($slider_id,$data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "btslider_slide SET slider_id = '" . (int)$slider_id . "', status = '" . (int)$data['status'] . "',slideset = '" . json_encode($data['slideset']) . "',caption = '" . $this->db->escape(json_encode($data['caption'])) . "', sort_order = '" . (int)$data['sort_order'] . "'");
	}
	
	public function editSlide($slide_id,$slider_id,$data){
		$this->db->query("UPDATE " . DB_PREFIX . "btslider_slide SET slider_id = '" . (int)$slider_id . "', slideset = '" . json_encode($data['slideset']) . "',caption = '" . $this->db->escape(json_encode($data['caption'])) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE id = '" . (int)$slide_id . "'");
	}
	
	public function addSlider($data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "btslider SET setting = '" . json_encode($data['setting']) . "'");
		
		$slider_id = $this->db->getLastId();
		
		return $slider_id;
	}
	
	public function getLastId(){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider s";
		
		$query = $this->db->query($sql);
		
		$slider_id = $this->db->getLastId();
		
		return $slider_id;
	}
	
	public function editSlider($slider_id,$data){
		
		$this->db->query("UPDATE " . DB_PREFIX . "btslider SET setting = '" . json_encode($data['setting']) . "' WHERE id = '" . (int)$slider_id . "'");
	}
	
	public function getModules($group, $store_id = 0){
		$data = array(); 
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}

		return $data;
	}
	
	public function getSliders(){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider s";
		
		$sql .= " GROUP BY s.id";
		
		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getSlider($slider_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider s WHERE s.id = '" . (int)$slider_id . "'";
		
		$sql .= " GROUP BY s.id";
		
		$query = $this->db->query($sql);

		return $query->row;
	}
	
	public function getSlide($slide_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider_slide ss WHERE ss.id = '" . (int)$slide_id . "'";
		
		$query = $this->db->query($sql);

		return $query->row;
	}
	
	public function getSlides($slider_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider_slide ss WHERE ss.slider_id = '" . (int)$slider_id . "'";
		
		$sql .= " GROUP BY ss.id";
		
		$sql .= " ORDER BY ss.sort_order";
		
		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function copySlide($slide_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "btslider_slide WHERE id = '" . (int)$slide_id . "'");

		if ($query->num_rows) {
			$data = array();

			$data = $query->row;
			$this->addSlide($data);
		}
	}
	
	public function deleteSlider($slider_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "btslider WHERE id = '" . (int)$slider_id . "'");
	}
	
	public function deleteSlide($slide_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "btslider_slide WHERE id = '" . (int)$slide_id . "'");
	}
	
	public function updateSortSlide($data){
		$count = 1;
		foreach ($data as $slide_id) {
			$query = "UPDATE " . DB_PREFIX . "btslider_slide SET sort_order = " . $count . " WHERE id = " . $slide_id;
			$this->db->query($query);
			$count ++;	
		}
	}
	
	public function getTotalslidesBySliderId($slider_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "btslider_slide WHERE slider_id = '" . (int)$slider_id . "'");

		return $query->row['total'];
	}
}
?>