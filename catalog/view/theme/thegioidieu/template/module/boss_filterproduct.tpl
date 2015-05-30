<!--module boss - fillter product-->
<?php if(!empty($tabs)){ ?>
<script type="text/javascript">
$(window).load(function(){
  
	$('#tabs_content_container<?php echo $module; ?> div.one-product').css("height",getMaxHeight('#tabs_content_container<?php echo $module; ?> div.one-product'));
	
	initCarousel(<?php echo $use_tab; ?>,<?php echo $module; ?>,<?php echo $use_scrolling_panel; ?>,<?php echo $prod_item; ?>,<?php echo $image_width; ?>);
	

	$("a.head_tabs<?php echo $module;?>").click(function() {
		
		if(!$(this).parent().hasClass('active')) {
		
			$(".head_tabs<?php echo $module;?>").parent().removeClass("active");
			var $src_tab = $(this).attr("data-src");
			$($src_tab).parent().addClass("active");
			$(".content_tabs<?php echo $module;?>").hide();
			var $selected_tab = $(this).attr("href");
			$($selected_tab).fadeIn();
			
			<?php if ($use_scrolling_panel) { ?>
				var $selected_carousel = $(this).attr("data-crs");
				if($selected_carousel != ""){
					//execCarousel($selected_carousel);
					execCarousel(<?php echo $module;?>,$selected_carousel,<?php echo $prod_item; ?>,<?php echo $image_width; ?>);
				}
			<?php } ?>
		}
		return false;
	});

});
</script>
<div class="container"><div class="row">
<div id="boss_homefilter_tabs<?php echo $module; ?>" class="boss_homefilter_tabs">
<div class="boss_homefilter_tabs_inner">
	<div class="box-heading" id="boss-category-heading-<?php echo $module; ?>">
		<span class="cate-num"><?php echo $module+1; ?></span> <?php echo $data['heading_title']; ?>
	</div>
  
	<div id="tabs_container<?php echo $module; ?>" class="tabs_container col-sm-2">
		<ul id="tabs<?php echo $module;?>" class="tabs-headings tabs hide-on-mobile">
			<li class="cate-parent"><?php echo $tabs['name']; ?></li>	
		<?php foreach ($tabs['categories'] as $numTab => $tab) { ?>
			 <li <?php if($numTab == 0) echo 'class="active"'; ?>><a class="head_tab<?php echo $numTab.$module; ?> head_tabs<?php echo $module;?>" href="#content_tab<?php echo $numTab.$module; ?>" data-src=".head_tab<?php echo $numTab.$module; ?>" data-crs="#carousel_tab<?php echo $numTab.$module; ?>"><?php echo $tab['name']; ?><span><i class="fa fa-caret-left"></i></span></a></li>
		<?php } ?>
		</ul>
	</div>
  
	<div id="tabs_content_container<?php echo $module; ?>" class="home_filter_content tabs_content_container col-sm-10">
	  <div class="box-content">
		<?php foreach ($tabs['categories'] as $numTab => $category) { ?>
		<h3  class="<?php if($numTab == 0) echo 'active'; ?> <?php if($use_tab){ echo 'hide-on-desktop';} ?>"><a class="head_tab<?php echo $numTab.$module; ?> head_tabs<?php echo $module;?>" href="#content_tab<?php echo $numTab.$module; ?>" data-src=".head_tab<?php echo $numTab.$module; ?>" data-crs="#carousel_tab<?php echo $numTab.$module; ?>"><?php echo $category['name']; ?></a></h3>
		
		<div id="content_tab<?php echo $numTab.$module; ?>" class="content_tabs<?php echo $module; ?> list_carousel responsive" style="display:<?php if($numTab == 0) echo 'block'; else echo 'none'; ?>">
			<div class="image-cate col-sm-6 col-xs-12">
				<?php if($category['image']){ ?>
					<img alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" src="<?php echo $category['image']; ?>" />
				<?php } ?>
			</div>
			<div class="list-product-cate col-sm-6 col-xs-12">
			<?php if(!empty($category['products'])){ ?>
			<ul id="carousel_tab<?php echo $numTab.$module; ?>" data-prev="#prev_tab<?php echo $numTab.$module; ?>" data-next="#next_tab<?php echo $numTab.$module; ?>" class="box-product">
				<?php $i = 0; ?>
				<?php foreach ($category['products'] as $key => $product) { ?>			
				<?php if(($i%3)==0){ ?> <li> <?php } ?>
				<?php $i++; ?>
				<div class="one-product">
					<?php if ($product['thumb']) { ?>
					<div class="image"><a data-id="<?php echo $product['product_id']; ?>" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a></div>
					<?php } ?>
					<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
					<div class="description"><?php echo $product['description']; ?></div>							
					<?php if ($product['price']) { ?>
					<div class="price">
						<?php if (!$product['special']) { ?>
						<?php echo $product['price']; ?>
						<?php } else { ?>
						<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
						<?php } ?>
					</div>
					<?php } ?>
					<?php if ($product['rating']) { ?>
					<div class="rating"><img src="catalog/view/theme/<?php echo $template; ?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
					<?php } ?>
					<div class="cart"><span class="button button-red"><input type="button" value="<?php echo $button_cart; ?>" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="button" /></span></div>
					</div>
				  <?php if((($i%3)==0)||($i==count($category['products']))){ ?> </li> <?php } ?>
				<?php } ?></ul>
			</div>	
			<div class="clearfix"></div>
			<?php } ?>
			<div class="btn-quick-link">
				<div class="tab-btn">
					<a id="prev_tab<?php echo $numTab.$module; ?>" class="prev" href="javascript:void(0)"><i class="fa fa-angle-left"></i></a>
					<a id="next_tab<?php echo $numTab.$module; ?>" class="next" href="javascript:void(0)"><i class="fa fa-angle-right"></i></a>
				</div>
				<div class="tab-viewall"><a title="Xem tất cả" href="<?php echo $tabs['href']; ?>">Xem tất cả</a></div>
			</div>
		</div>
		<?php } ?>
	  </div>
  
	</div>
	</div>
</div></div></div>
<?php } ?>
<!--module boss - fillter product-->