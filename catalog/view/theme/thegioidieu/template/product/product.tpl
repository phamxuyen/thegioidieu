<?php echo $header; ?>
<?php global $config; ?>
<?php 
	$pro_des ='use_tab';
	if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = '';
	}
	if(!empty($boss_manager)){			
		$pro_des = isset($boss_manager['other']['pro_tab'])?$boss_manager['other']['pro_tab']:'use_tab'; 		
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
	</div><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="product-info">
	  <h1 class="category_title"><?php echo $heading_title; ?></h1>
      <div class="row">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> left">
		  <div class="bt-product-zoom">
          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
		  </ul>
		  <ul class="thumbnails" id="boss-image-additional">
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
			<a id="prev_image_additional" class="prev nav_thumb" href="javascript:void(0)" style="display:block;" title="prev"><i title="Previous" class="fa fa-chevron-left">&nbsp;</i></a>
			<a id="next_image_additional" class="next nav_thumb" href="javascript:void(0)" style="display:block;" title="next"><i title="Next" class="fa fa-chevron-right">&nbsp;</i></a>
          <?php } ?>
		  </div>
        </div>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="right <?php echo $class; ?>">
          <div class="qty">			
			  <h1><?php echo $heading_title; ?></h1>
			  <?php if ($review_status) { ?>
				<div class="rating">
					<p>
					  <?php for ($i = 1; $i <= 5; $i++) { ?>
					  <?php if ($rating < $i) { ?>
					  <span class="fa fa-stack fa-hidden"><i class="fa fa-star fa-stack-2x"></i></span>
					  <?php } else { ?>
					  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
					  <?php } ?>
					  <?php } ?>
					</p>
					
				</div>
				<?php } ?>
			  <ul class="list-unstyled description">
				<li><?php echo $text_model; ?> <?php echo $model; ?></li>
				<?php if ($reward) { ?>
				<li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
				<?php } ?>
				<li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
			  </ul>
			  
				<span class="oc-length">Kích thước (Rộng x Cao + Đuôi ): <?php echo $length.' x '.$width.' + '.$height; ?> <?php echo $length_class; ?></span>
			  <?php if ($price) { ?>
			  <div class="price_info">
				<?php if (!$special) { ?>
				<span class="default"><?php echo $price; ?></span>
				<?php } else { ?>
				<div><span class="price-old"><?php echo $price; ?></span><span class="oc-discount"><i class="fa fa-caret-down"></i><?php echo $btdiscount; ?>%</span></div>
				<span class="price-new"><?php echo $special; ?></span>
				<?php } ?>
				<?php if ($tax) { ?>
				<span class="price-tax"><?php echo $text_tax; ?></span>
				<?php } ?>
				<?php if ($points) { ?>
				<p><?php echo $text_points; ?> <?php echo $points; ?></p>
				<?php } ?>
				<?php if ($discounts) { ?>
				<?php foreach ($discounts as $discount) { ?>
				<p><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></p>
				<?php } ?>
				<?php } ?>
				</div>
				<?php } ?>
				<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
				<div class="select_number">                
					<button onclick="changeQty(1); return false;" class="increase">+</button>
					<input type="text" class="text form-control" name="quantity" size="2" id="input-quantity" value="<?php echo $minimum; ?>" />
                    <button onclick="changeQty(0); return false;" class="decrease">-</button>  
				</div>
				
				<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
				<?php if ($minimum > 1) { ?>
					<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
				<?php } ?>
		  </div>
		  
		  
		  <div id="product" <?php if($options){ echo 'class="have_option"'; } ?>>
            <?php if ($options) { ?>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="oc-radio form-group<?php echo ($option['required'] ? ' required' : ''); ?> form-select-option">
              <label class="oc-bg control-label"><?php echo $option['name']; ?></label>
              <div class="oc-select-input" id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $item => $option_value) { ?>
                <div class="radio">
                  <label>
                    <input <?php  echo ($item==0)?'checked':''; ?> type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
					<?php if(!empty($option_value['image'])){ ?>
					 <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>" />
					 <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
			
            <?php if ($option['type'] == 'image') { ?>
            <div class="oc-image form-group<?php echo ($option['required'] ? ' required' : ''); ?> form-color">
              <label class="text-color control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $key => $option_value) { ?>
                <div class="radio select-color bt-image-option">
                  <label>
                    <input <?php  echo ($key==0)?'checked':''; ?> type="radio" style="display:none;" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail <?php  echo ($key==0)?'active':''; ?>" /> <?php //echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
			
            <?php } ?>
            <?php } ?>
			
			<div class="cart_button">	
				<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart-2"><?php echo $button_cart; ?></button>
			</div> 
			
          </div>
		  
		  
		  <div class="oc-phone-icon">
			  <div class="form-group icon"> 				
					<!-- AddThis Button BEGIN -->
					<div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
					<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script> 
					<!-- AddThis Button END --> 
			  </div>
			  <div class="oc-phone">
				<i class="fa fa-phone"></i>
				<span>Đặt hàng qua điện thoại</span>
				<span class="oc-phone"><?php echo $telephone; ?></div>
			  </div>
		  </div>
		  
		 </div>
		 
		  <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
			<li><a href="#tab-video" data-toggle="tab"><?php echo $tab_video; ?></a></li>
			<li><a href="#tab-userguide" data-toggle="tab"><?php echo $tab_assembly; ?></a></li>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
			
            <div class="tab-pane" id="tab-video"><?php echo $video; ?></div>
			
            <div class="tab-pane" id="tab-userguide"><?php echo $assembly; ?></div>
            
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                    <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha" /> </div>
                </div>
                <div class="buttons">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
		 
      </div>	  
      </div>
      <?php if ($products) { ?>
	  <div class="product-related">
		<h1 class="category_title"><?php echo $text_related; ?></h1>
		<div class="list_carousel responsive product-grid" >
		<div class="carousel-button">
			<a id="prev_related" class="prev nav_thumb" href="javascript:void(0)" style="display:block;" title="prev"><i title="Previous" class="fa fa-angle-left">&nbsp;</i></a>
			<a id="next_related" class="next nav_thumb" href="javascript:void(0)" style="display:block;" title="next"><i title="Next" class="fa fa-angle-right">&nbsp;</i></a>
		</div>
			<ul id="product_related" class="content-products"><?php foreach ($products as $product) { ?><li>				
			<div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>	
			 <?php if ($product['special']) { ?>
			 <span class="oc-discount"><i class="fa fa-caret-down"></i><?php echo $product['btdiscount']; ?>%</span>
			  <?php } ?>
			</div>
			<div class="caption">
            <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<div class="price-all">
              <?php if ($product['price']) { ?>
            <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
				<span class="price-new"><?php echo $product['special']; ?></span>
                <div><span class="price-old"><?php echo $product['price']; ?></span></div>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
            </p>
              <?php } ?>
			</div>  
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
			  </div>
            <button type="button" class="btn-cart-1" onclick="btadd.cart('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><?php echo $button_cart; ?></button>
          </div>
        </li><?php } ?></ul>    
      </div>
      </div>
      <?php } ?>
	  
	  <div class="tab-content" style="display:none">
	  <h1 class="category_title"><?php echo $tab_review; ?></h1>
		<?php if($pro_des!='use_tab'){?><h2><?php echo $text_write; ?></h2><?php } ?>
		<div id="tab-review">
		  <form class="form-horizontal">
			<div id="review"></div>			
			<?php if ($review_guest) { ?>
			<h1 class="category_title"><?php echo $text_write; ?></h1>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
				<input type="text" name="name" value="" id="input-name" class="form-control" />
			  </div>
			</div>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
				<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
				<div class="help-block"><?php echo $text_note; ?></div>
			  </div>
			</div>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label"><?php echo $entry_rating; ?></label>
				&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
				<input type="radio" name="rating" value="1" />
				&nbsp;
				<input type="radio" name="rating" value="2" />
				&nbsp;
				<input type="radio" name="rating" value="3" />
				&nbsp;
				<input type="radio" name="rating" value="4" />
				&nbsp;
				<input type="radio" name="rating" value="5" />
				&nbsp;<?php echo $entry_good; ?></div>
			</div>
			<div class="form-group required">
			  <div class="col-sm-12">
				<label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
				<input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
			  </div>
			</div>
			<div class="form-group">
			  <div class="col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha" /> </div>
			</div>
			<div class="buttons">
			  <div class="pull-left">
				<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
			  </div>
			</div>
			<?php } else { ?>
			<?php echo $text_login; ?>
			<?php } ?>
		  </form>
		</div>
	  </div>
	  
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/carouFredSel-6.2.1.js"></script>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.bt-image-option').click(function(){
	$('.bt-image-option').each(function(){
		$(this).removeClass('active');
	});
	$(this).addClass('active');
});
function changeQty(increase) {
    var qty = parseInt($('.select_number').find("input").val());
    if ( !isNaN(qty) ) {
        qty = increase ? qty+1 : (qty > <?php echo $minimum; ?> ? qty-1 : <?php echo $minimum; ?>);
        $('.select_number').find("input").val(qty);
    }else{
		$('.select_number').find("input").val(1);
	}
}
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=bossthemes/boss_add/cart',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		beforeSend: function() {
			//$('#button-cart').button('loading');
		},
		complete: function() {
			//$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				
				$('#cart-total').html(json['total']);
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=tool/upload',
			type: 'post',
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,
			beforeSend: function() {
				$(node).button('loading');
			},
			complete: function() {
				$(node).button('reset');
			},
			success: function(json) {
				$('.text-danger').remove();
				
				if (json['error']) {
					$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
				}
				
				if (json['success']) {
					alert(json['success']);
					
					$(node).parent().find('input').attr('value', json['code']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('input[name=\'captcha\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
$(window).load(function(){
	$('#boss-image-additional').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#prev_image_additional',
        next: '#next_image_additional',
        swipe: {
        onTouch : true
        },
        items: {
            width: 80,
            height: 'auto',
            visible: {
            min: 1,
            max: 5
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
    });
});  
function goToByScroll(id){
    $('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
   
}
//--></script> 
<?php echo $footer; ?>