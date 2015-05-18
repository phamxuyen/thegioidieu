<?php echo $header; ?>
<?php global $config; ?>
<?php 
	$refine_search=0; $category_info=0; $view='both_grid'; $boss_class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12';
	if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = '';
	}
	if(!empty($boss_manager)){
		$refine_search = isset($boss_manager['other']['refine_search'])?$boss_manager['other']['refine_search']:0; 		
		$category_info = isset($boss_manager['other']['category_info'])?$boss_manager['other']['category_info']:0; 		
		$view = isset($boss_manager['other']['view_pro'])?$boss_manager['other']['view_pro']:'both_grid'; 
		$perrrow = isset($boss_manager['other']['perrow'])?$boss_manager['other']['perrow']:3;
	}
	
	if(isset($perrrow) && $perrrow==1){
		$boss_class = 'col-lg-12 col-md-12 col-sm-12 col-xs-12';
	}else if(isset($perrrow) && $perrrow==2){
		$boss_class = 'col-lg-6 col-md-6 col-sm-6 col-xs-12';
	}else if(isset($perrrow) && $perrrow==3){
		$boss_class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12';
	}else if(isset($perrrow) && $perrrow==4){
		$boss_class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12';
	}else if(isset($perrrow) && $perrrow==5){
		$boss_class = 'boss-col-5column col-md-3 col-sm-6 col-xs-12';
	}else if(isset($perrrow) && $perrrow==6){
		$boss_class = 'col-lg-2 col-md-3 col-sm-6 col-xs-12';
	}
?>
<div class="container">
  <div class="row">
	<div class="bt-breadcrumb">
	  <ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	  </ul>
	</div>
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">  
	<?php echo $content_top; ?>  
      <?php if ($products) { ?>	  
	  <h1 class="category_title"><?php echo $heading_title; ?></h1>
	  <div class="product-filter">	
		<div class="filter-view">
			<div class="btn-group" <?php if($view == 'grid' || $view =='list')echo 'style="display:none"'; ?>>
				<button type="button" id="grid-view" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
				<button type="button" id="list-view" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
			</div>
			<div class="bt_pagination">
				<?php if(!empty($pagination)){?><div class="links"><?php echo $pagination; ?></div> <?php } ?>
				<div class="results"><?php echo $results; ?></div>
			</div>
		</div>
	  <div class="limit_sort">
		<div class="limit">	
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
		  <label class="boss_select">
          <select id="input-limit" class="form-control selectpicker" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
		  </label>
		</div>
		<div class="sort">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
		  <label class="boss_select">
          <select id="input-sort" class="form-control selectpicker" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
		  </label>
		</div>
      </div>
      </div>
      <div class="row layout-thumb">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-sm-3 col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
			</div>
			<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<p class="description"><?php echo $product['description']; ?></p>
			<?php if ($product['price']) { ?>
			<p class="price">
			  <?php if (!$product['special']) { ?>
			  <?php echo $product['price']; ?>
			  <?php } else { ?>
			  <span class="price-old"><?php echo $product['price']; ?></span><span class="price-new"><?php echo $product['special']; ?></span> 
			  <?php } ?>
			  <?php if ($product['tax']) { ?>
			  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
			  <?php } ?>
			</p>
			<?php } ?>
			<?php if ($product['rating']) { ?>
			<div class="rating">
			  <?php for ($i = 1; $i <= 5; $i++) { ?>
			  <?php if ($product['rating'] < $i) { ?>
			  <span class="fa fa-stack fa-hidden"><i class="fa fa-heart"></i></span>
			  <?php } else { ?>
			  <span class="fa fa-stack"><i class="fa fa-heart"></i></span>
			  <?php } ?>
			  <?php } ?>
			</div>
			<?php } ?>
            <button type="button" class="btn-cart-1" onclick="btadd.cart('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></button>
            <button type="button" class="btn-cart-2" onclick="btadd.cart('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></button>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
		<div class="content_bg">
			<p><?php echo $text_empty; ?></p>
			<div class="buttons">
				<div class="pull-left"><a href="<?php echo $continue; ?>" class="btn"><?php echo $button_continue; ?></a></div>
			</div>
		</div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>	
</div>
<script type="text/javascript"><!--
// Product List
	$('#list-view').click(function() {
		$('#content .product-layout > .clearfix').remove();

		$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		$('#content .product-layout').attr('class', 'product-layout product-grid <?php echo $boss_class; ?>');	
		 localStorage.setItem('display', 'grid');
	});
	
	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else if (localStorage.getItem('display') == 'grid'){
		$('#grid-view').trigger('click');
	}else {
		<?php if($view == 'grid' || $view == 'both_grid') { ?>
			$('#grid-view').trigger('click');
		<?php } ?>
		<?php if($view == 'list' || $view == 'both_list') { ?>
			$('#list-view').trigger('click');
		<?php } ?>
	}
//--></script>
<?php echo $footer; ?>