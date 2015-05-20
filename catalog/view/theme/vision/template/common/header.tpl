<?php global $config; global $request; ?>
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
<?php if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = $boss_manager;
	} 
	$header_link = isset($boss_manager['header_link'])?$boss_manager['header_link']:''; 
	$option = isset($boss_manager['option'])?$boss_manager['option']:''; 
?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bossthemes/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bossthemes/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.smoothscroll.js"></script>
<script src="catalog/view/javascript/bossthemes/jquery.jgrowl.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bossthemes/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css">
<link href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/stylesheet.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/bt_stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/responsive.css" />
<?php if(isset($boss_manager['option']['animation'])&&($boss_manager['option']['animation'])){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/cs.animate.css" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/jquery.jgrowl.css" />

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/cs.bossthemes.js"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.appear.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/getwidthbrowser.js"></script>
<?php// echo $google_analytics; ?>
<?php if(isset($this->request->get['route'])){$route1 = $this->request->get['route'];}else{$route1 ="";}
	if(isset($route1) && ($route1== "common/home" || $route1=="")){ ?>
		<script type="text/javascript"><!--
			window.onload = function() {
				$(".bt-loading").fadeOut("1500", function () {
					$('#bt_loading').css("display", "none");
				});
			};
		//--></script>
	<?php }else{ ?>
		<script type="text/javascript"><!--
		$(document).ready(function() {
		$('#bt_loading').css("display", "none");
		});
		//--></script>
	<?php } ?>

<style>
	#bt_loading{position:fixed; width:100%; height:100%; z-index:999; background:none repeat scroll 0 0 #fff;}
	.bt-loading{
		height: 128px;
		left: 50%;
		margin-left: -64px;
		margin-top: -64px;
		position: absolute;
		top: 50%;
		width: 128px;
		z-index: 9999;
	}
</style>
<?php 	
	if (isset($option['sticky_menu']) && $option['sticky_menu']) { ?>
	
	<script type="text/javascript"><!--
	$(window).scroll(function() {
			var height_header = $('#bt_header').height();  			
			if($(window).scrollTop() > height_header) {
				
				$('.boss_menu').addClass('boss_scroll');
			} else {
				$('.boss_menu').removeClass('boss_scroll');
			}
		});
	//--></script>
	<!--[if IE 8]> 
	<script type="text/javascript">
	$(window).scroll(function() {
			var height_header = $('#bt_header').height();  			
			if($('html').scrollTop() > height_header) {				
				$('.boss_menu').addClass('boss_scroll');
			} else {
				$('.boss_menu').removeClass('boss_scroll');
			}
		});
	</script>
	<![endif]-->
<?php } ?>
<?php 
	$b_style = '';$h_style = ''; $status=0; $h_mode_css = ''; $h_mode_css = '';
	
	if(isset($boss_manager) && !empty($boss_manager)){
		$layout = $boss_manager['layout'];
		$status = $boss_manager['status']; 
	
		if(isset($layout['mode_css']) && $layout['mode_css']=='wide'){
			$mode_css = 'bt-wide';
		}else{
			$mode_css = 'bt-boxed';
			$b_style = (!empty($layout['box_width']))?'style="max-width:'.$layout['box_width'].'px"':'';
		}
		if(isset($layout['h_mode_css']) && $layout['h_mode_css']=='boxed'){
			$h_mode_css = 'bt-hboxed';
			$h_style = (!empty($layout['h_box_width']))?'style="max-width:'.$layout['h_box_width'].'px"':'';
		}else{
			$h_mode_css = '';
		}
	
	}
?>
<?php
if($status){
	include "catalog/view/theme/".$config->get('config_template')."/template/bossthemes/boss_color_font_setting.php";
} ?>
</head>

<?php 
	if(isset($request->get['route'])){
		$route = $request->get['route'];
	}else{
		$route ="";
	}
	if(isset($route) && ($route== "common/home" || $route=="")){
		$home_page='bt-home-page';
	}else{
		$home_page="bt-other-page";
	}
?>
<body class="<?php echo $home_page; ?>">
<div id="bt_loading"><div class="bt-loading">
	<div id="circularG">
	<div id="circularG_1" class="circularG"></div>
	<div id="circularG_2" class="circularG"></div>
	<div id="circularG_3" class="circularG"></div>
	<div id="circularG_4" class="circularG"></div>
	<div id="circularG_5" class="circularG"></div>
	<div id="circularG_6" class="circularG"></div>
	<div id="circularG_7" class="circularG"></div>
	<div id="circularG_8" class="circularG"></div>
	</div>
</div></div>
<div id="bt_container" class="<?php  echo $mode_css;?>" <?php echo $b_style;?>>
<div id="bt_header" class="<?php echo $h_mode_css;?>" <?php echo $h_style;?>>
<header>
	<?php if(isset($header_link['logo']) && $header_link['logo']){ ?>
	<div id="logo">
	  <?php if ($logo) { ?>
	  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
	  <?php } else { ?>
	  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
	  <?php } ?>
	</div>
	<?php } ?>	
	<?php 
		if(isset($header_link['search']) && $header_link['search']){
			echo $search; 
		} 
	?>	
	<div id="top-links">
	  <ul class="list-inline">			
		<?php if(isset($header_link['my_account']) && $header_link['my_account']){ ?><li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_account; ?><i class="fa fa-angle-down"></i></a>
		  <ul class="dropdown-menu dropdown-menu-right">
			<?php if ($logged) { ?>
			<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
			<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
			<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
			<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
			<?php } else { ?>
			<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
			<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
			<?php } ?>
		  </ul>
		</li>
		<?php } ?> 
	  </ul>
	</div>	
	<?php if(isset($header_link['cart_mini']) && $header_link['cart_mini']){ echo $cart;} ?>	
	<div class="language_currency">
		<?php if(isset($header_link['currency']) && $header_link['currency']){ echo $currency;} ?>	
		<?php if(isset($header_link['language']) && $header_link['language']){ echo $language;} ?>		
	</div>
</header>
<div class="boss_menu">
	<?php 
		if(isset($option['use_menu']) && $option['use_menu'] == 'megamenu'){
			echo isset($btmainmenu)?$btmainmenu:''; 
		}else{
		?>	
		<?php if ($categories) { ?>	
		  <nav id="menu" class="navbar">
			<div class="navbar-header">
			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			  <span id="category" class="visible-xs"><?php echo $text_category; ?></span>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
			  <ul class="nav navbar-nav">
				<?php foreach ($categories as $category) { ?>
				<?php if ($category['children']) { ?>
				<li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
				  <div class="dropdown-menu">
					<div class="dropdown-inner">
					  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
					  <ul class="list-unstyled">
						<?php foreach ($children as $child) { ?>
						<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
						<?php } ?>
					  </ul>
					  <?php } ?>
					</div>
					<a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
				</li>
				<?php } else { ?>
				<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
				<?php } ?>
				<?php } ?>
			  </ul>
			</div>
		  </nav>
	
	<?php } } ?>
</div>	
<div class="boss-new-position">
	<?php echo isset($btslideshow)?$btslideshow:''; ?>
</div> <!-- End #bt_header -->
</div> <!-- End #bt_header -->
