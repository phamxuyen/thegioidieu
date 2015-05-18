<?php echo $header; ?>
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
  <?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
<div id="content" class="<?php echo $class; ?> <?php echo $class_css; ?>"><?php echo $content_top; ?>	
	<div class="boss_article-item boss_article-detail">
		<div class="content_bg">
		<div class="article-title">
			<?php echo $heading_title;?>
		</div> 
		<div class="date-article">	
			<div class="date-post">
			<small class="time-stamp time-article">
				<?php $date = new DateTime($date_modified);?>
				<?php echo $date->format('l, M j, Y');?>
			</small>				
			</div>					
		</div>	
		<div class="article-image">
			<img alt="" src="<?php echo $image;?>" title="<?php echo $title;?>">      
		</div> 
		<div class="article-content">
			<?php echo $content;?>		
		</div>
		<div class="article-share"><!-- AddThis Button BEGIN -->
		  <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share;?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
		  <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
		  <!-- AddThis Button END --> 
		</div>	
		<div class="apply">
			<a href="index.php?route=information/contact" class="btn">Nộp đơn</a>
		</div>
		</div>	
<?php if ($allow_comment!=0) {?>
		<?php if ($comment_status==1||$allow_comment==1) {?>
	<div class="comments">                
		<div id="article-comments"></div> 
		<div class="form-comment-container">
			<span id="new">
				<h3 class="title_heading"><?php echo $text_comment; ?> </h3>
			</span>       
			<div id="0_comment_box" class="form-comment content_bg">
				<div class="row">
				<div class="col-sm-6 col-xs-12">
				  <?php if(!$login){?>
					  <div class="field" id="username">
						  <label class="" for="name"><?php echo $text_username; ?><em>*</em></label>
						  <div class="input-box">
							  <input type="text" class="form-control required-entry" value="" title="Name" id="name" name="username">
						  </div>
					  </div>                    
					  <div class="field" id="email">
						  <label class="" for="email"><?php echo $text_email; ?><em>*</em></label>
						  <div class="input-box">
							  <input type="text" class="form-control required-entry validate-email" value="" title="Email" id="email" name="email_blog">
						  </div>
					  </div>
				  <?php } else{?>
						<input type="hidden" class="form-control required-entry" value="<?php echo $username; ?>" title="Name" id="name" name="username">
						<input type="hidden" class="form-control required-entry validate-email" value="<?php echo $email; ?>" title="Email" id="email" name="email_blog">
				  <?php } ?>
				</div>
				<div class="col-sm-6 col-xs-12">	
				  <div class="input-box-comment">
					  <label class="tt_input" for="comment"><?php echo $entry_comment; ?><em>*</em></label>
					  <textarea rows="2" cols="10" class="required-entry form-control" style="height:122px" title="Comment" id="comment" name="comment_content"></textarea>
				  </div>
				</div>  
				</div>  
				  <?php if($capcha){?>
				  <div class="captcha">
				   <img src="index.php?route=tool/captcha" alt="" id="captcha" /> <br/>
				   <input class="form-control" type="text" name="captcha" value="" /> 
				   <label class="required-1 " for="recaptcha"><?php echo $text_required?><em>*</em></label>
				  </div>
				  <?php }?>
				  <div class="submit-button">
					<div class="left"><br/><a id="button-comment" class="btn"><?php echo $button_continue; ?></a></div>
				  </div>
			</div>
		</div>                   
	 </div>
	 <?php } } ?>   		
    </div>	
  <?php echo $content_bottom; ?></div>
  </div>
 </div>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/carouFredSel-6.2.0.js"></script> 
<script type="text/javascript"><!--
$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');
$('#button-comment').bind('click', function() { 
	$.ajax({
		url: 'index.php?route=bossblog/article/write&blog_article_id=<?php echo $blog_article_id; ?>&need_approval=<?php echo $need_approval; ?>&approval_status=<?php echo $approval_status; ?>',
		type: 'post',
		dataType: 'json',
		data: 'username=' + encodeURIComponent($('input[name=\'username\']').val()) + '&comment_content=' + encodeURIComponent($('textarea[name=\'comment_content\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email_blog\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),		
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-comment').attr('disabled', true);
			$('#new').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() { 
			$('#button-comment').attr('disabled', false);
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('.attention').remove();
			$('input[name=\'captcha\']').val('');
		},		
		success: function(json) { 
			if (json['error']) {
				$('#new').after('<div class="alert alert-danger">' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#new').after('<div class="success">' + json['success'] + '</div>');
				$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');				
				$('input[name=\'username\']').val('');
				$('textarea[name=\'comment_content\']').val('');
				$('input[name=\'email_blog\']').val('');
                $('input[name=\'captcha\']').val('');
			}
		}
	});
});
$(window).load(function(){
$('#product_related').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
        prev: '#prev_related',
        next: '#next_related',
        swipe: {
        onTouch : true
        },
        items: {
            width: 280,
			height: 'auto',
            visible: {
            min: 1,
            max: 3
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        }
	});
});  
//--></script> 
<?php echo $footer; ?>