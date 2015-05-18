<?php global $config;?>
<?php
	$boss_manager = array(
		'option' => array(
			'bt_scroll_top' => true,
			'animation' 	=> true,			
		),
		'layout' => array(
			'mode_css'   => 'wide',
			'box_width' 	=> 1200,
			'h_mode_css'   => 'inherit',
			'h_box_width' 	=> 1200,
			'f_mode_css'   => 'inherit',
			'f_box_width' 	=> 1200
		),
		'status' => 1
	);
?>
<?php $footer_about = $config->get('boss_manager_footer_about'); ?>
<?php $footer_social = $config->get('boss_manager_footer_social'); ?>
<?php $footer_powered = $config->get('boss_manager_footer_powered'); ?>
<?php if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = $boss_manager;
	} ?>
<?php 
	if(!empty($boss_manager)){
		$layout = isset($boss_manager['layout'])?$boss_manager['layout']:''; 
		$footer_link = isset($boss_manager['footer_link'])?$boss_manager['footer_link']:'';
	}
	$f_style = '';
	if($layout['f_mode_css']=='fboxed'){
		$f_mode_css = 'bt-fboxed';
		$f_style = (!empty($layout['f_box_width']))?'style="max-width:'.$layout['f_box_width'].'px"':'';
	}else{
		$f_mode_css = '';
	}
?>
<div id="bt_footer_container" class="<?php echo $f_mode_css;?>" <?php echo $f_style;?>>

<footer id="bt_footer">
  <div class="container">
    <div class="row">
		<div class="footer_column">
		<div class="row">
		<div class="col-sm-4 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="200">
		<?php if(isset($footer_about['status']) && $footer_about['status']){ ?> 
		<div class="footer-about">
			<?php if($footer_about['about_title'][$config->get('config_language_id')]){ ?>
			<h3><?php echo html_entity_decode($footer_about['about_title'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>
			<?php } ?>
			<?php if($footer_about['image_status']){ ?><a href="#" title="logo"><img alt="logo" src="image/<?php echo $footer_about['image_link']; ?>"></a> <?php } ?>
			<?php echo html_entity_decode($footer_about['about_content'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?>
		</div>
		<?php } ?>
		
		</div>	
		<?php if((isset($footer_link['information']) && $footer_link['information']) || (isset($footer_link['contact_us']) && $footer_link['contact_us']) || (isset($footer_link['site_map']) && $footer_link['site_map']) || (isset($footer_link['brands']) && $footer_link['brands'])) { ?>
		<div class="column col-sm-4 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="300">
		<h3><?php echo $text_information; ?></h3>
		<ul>
		  <?php if ($informations) { ?>
		  <?php foreach ($informations as $information) { ?>
		  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
		  <?php } ?>
		  <?php } ?>
		  
		  <?php if(isset($footer_link['site_map']) && $footer_link['site_map']){ ?>
		  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		  <?php } if(isset($footer_link['brands']) && $footer_link['brands']){ ?>
		  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
		 
		  <?php } ?>
		</ul>
	  </div>
	  <?php } ?>
	 
	  <div class="col-sm-4 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="400">
		 <?php echo isset($btfooter)?$btfooter:''; ?>
		 <?php if(isset($footer_social['status']) && $footer_social['status']){ ?>
			<div class="footer-social">
			<h3><?php echo html_entity_decode(isset($footer_social['title'][$config->get('config_language_id')])?$footer_social['title'][$config->get('config_language_id')]:'',ENT_QUOTES, 'UTF-8'); ?></h3>
			<ul>
				<li><a href="<?php echo isset($footer_social['face_url'])?$footer_social['face_url']:'#'; ?>" title="Facebook"><i class="fa fa-facebook"></i></a></li>
				<li><a href="<?php echo isset($footer_social['twitter_url'])?$footer_social['twitter_url']:'#'; ?>" title="Twitter"><i class="fa fa-twitter"></i></a></li>
				<li><a href="<?php echo isset($footer_social['googleplus_url'])?$footer_social['googleplus_url']:'#'; ?>" title="Googleplus"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="<?php echo isset($footer_social['pinterest_url'])?$footer_social['pinterest_url']:'#'; ?>" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
				<li><a href="<?php echo isset($footer_social['rss_url'])?$footer_social['rss_url']:'#'; ?>" title="RSS"><i class="fa fa-rss"></i></a></li>
				<li><a href="<?php echo isset($footer_social['youtube_url'])?$footer_social['youtube_url']:'#'; ?>" title="Youtube"><i class="fa fa-youtube-play"></i></a></li>
			</ul>
			</div>
		<?php } ?>
	  </div>
		
	  </div>
	  </div>
  <div class="powered-payment">
    <div class="container">
	<div class="row">	
		<div class="powered">
			<?php echo html_entity_decode(isset($footer_powered[$config->get('config_language_id')])?$footer_powered[$config->get('config_language_id')]:'',ENT_QUOTES, 'UTF-8'); ?>
		</div>
	</div>
    </div>
  </div>
  </div>
  </div>
</footer>
</div>
<?php if(isset($boss_manager['option']['bt_scroll_top'])&&($boss_manager['option']['bt_scroll_top'])){ ?>
<div id="back_top" class="back_top" title="Back To Top"><span><i class="fa fa-caret-up"></i></span></div>
 <script type="text/javascript">
        $(function(){
			$(window).scroll(function(){
				if($(this).scrollTop()>600){
				  $('#back_top').fadeIn();
				}
				else{
				  $('#back_top').fadeOut();
				}
			});
			$("#back_top").click(function (e) {
				e.preventDefault();
				$('body,html').animate({scrollTop:0},800,'swing');
			});
        });
</script> 
<?php } ?>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
</div> <!-- End #bt_container -->
</body></html>