<div class="oc-contact-module">
	<div class="title"><?php echo $heading_title; ?></div>
	<div class="">
		<form id="form-contact-us" method="post" enctype="multipart/form-data" class="form-horizontal">
			<fieldset>
			  
			  <div class="required">
				<div>
				  <input type="text" name="name" placeholder="<?php echo $entry_name; ?>" value="<?php echo $name; ?>" id="input-name" class="form-control" />
				</div>
			  </div>
			  
			  <div class="required">
				<div>
				  <input type="text" name="email" placeholder="<?php echo $entry_email; ?>" value="<?php echo $email; ?>" id="input-email" class="form-control" />
				</div>
			  </div>
			  
			  <div class="required">
				<div>
				 
				  <input type="text" name="title" placeholder="<?php echo $entry_title; ?>" value="<?php echo $title; ?>" id="input-title" class="form-control" />
				</div>
			  </div>
			  
			  <div class="required">
				<div>
					 <textarea name="enquiry" placeholder="<?php echo $entry_enquiry; ?>" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
				</div>
			  </div>
			
			</fieldset>
			<div class="buttons">
			  <div class="pull-left">
				<button class="btn" id="button-subscribe" type="button"/><?php echo $button_submit; ?><i class="fa fa-angle-right"></i></button>
			  </div>
			</div>
			<div id="vs_success"></div>
		</form>
	</div>
<script type="text/javascript"><!--
$('#button-subscribe').on('click', function() {
	$.ajax({
			url: 'index.php?route=module/contact/subscribe',
			type: 'post',
			data: $('#form-contact-us input[type=\'text\'], #form-contact-us textarea'),
			dataType: 'json',
			success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');

				if (json['error']) {
					
					if (json['error']['name']) {
						$('input[name=\'name\']').before('<div class="text-danger">' + json['error']['name'] + '</div>');
					}
					
					if (json['error']['email']) {
						$('input[name=\'email\']').before('<div class="text-danger">' + json['error']['email'] + '</div>');
					}
					
					if (json['error']['title']) {
						$('input[name=\'title\']').before('<div class="text-danger">' + json['error']['title'] + '</div>');
					}
					
					if (json['error']['enquiry']) {
						$('textarea[name=\'enquiry\']').before('<div class="text-danger">' + json['error']['enquiry'] + '</div>');
					}
					
					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
				}
				
				if (json['success']) {
					$('#vs_success').append('<i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button>');
					$('#form-contact-us input[type=\'text\'], #form-contact-us textarea').val('');
					
				}
			}
	}); 
});
//--></script>
</div>