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
      <h1><?php echo $heading_title; ?></h1>
	<?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	  <?php if ($error_warning) { ?>
	  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	  </div>
	  <?php } ?>
		<div class="checkout">
			
			<ul class="nav nav-tabs" id="bttabs">
				<li class="disabled active"><a data-toggle="tab" id="tab-checkout" href="#checkout-option"><?php echo $text_checkout_option; ?> </a></li>
				<li class="disabled"><a data-toggle="tab" id="tab-payment-address" href="#payment-address"><?php echo $text_checkout_account; ?> </a></li>
				<?php if ($shipping_required) { ?>
				<li class="disabled"><a data-toggle="tab" id="tab-shipping-address" href="#shipping-address"><?php echo $text_checkout_shipping_address; ?> </a></li>
				<li class="disabled"><a data-toggle="tab" id="tab-shipping-method" href="#shipping-method"><?php echo $text_checkout_shipping_method; ?> </a></li>
				<?php } ?>
				<li class="disabled"><a data-toggle="tab" id="tab-payment-method" href="#payment-method"><?php echo $text_checkout_payment_method; ?> </a></li>
				<li class="disabled last"><a data-toggle="tab" id="tab-confirm" href="#checkout-confirm"><?php echo $text_checkout_confirm; ?> </a></li>
			</ul>
			<div class="tab-content">
				<div id="checkout-option" class="tab-pane active">
					<div class="panel-body"></div>
				</div>
		
				<?php if (!$logged && $account != 'guest') { ?>
				<div id="payment-address" class="tab-pane">
					<div class="panel-body"></div>
					<div class="col-sm-6 text-left">
					  <button type="button" onclick="$('a[href=\'#checkout-option\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
					</div>
				</div>
				<?php } else { ?>
				<div id="payment-address" class="tab-pane">
					<h4 class="panel-title"><?php echo $text_checkout_payment_address; ?></h4>
					<div class="panel-body"></div>
				</div>
				<?php } ?>
				
				<?php if ($shipping_required) { ?>
				<div id="shipping-address" class="tab-pane">
					<h4 class="panel-title"><?php echo $text_checkout_shipping_address; ?></h4>
				  	<div class="panel-body"></div>
					<div class="col-sm-6 text-left">
					  <button type="button" onclick="$('a[href=\'#payment-address\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
					</div>
				</div>
				
				<div id="shipping-method" class="tab-pane">
					<h4 class="panel-title"><?php echo $text_checkout_shipping_method; ?></h4>
					<div class="panel-body"></div>
					<div class="col-sm-6 text-left">
					  <button type="button" onclick="$('a[href=\'#shipping-address\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
					</div>
				</div>
				<?php } ?>
				
				<div id="payment-method" class="tab-pane">
					<h4 class="panel-title"><?php echo $text_checkout_payment_method; ?></h4>
					<div class="panel-body"></div>
					<?php if ($shipping_required) { ?>
					<div class="col-sm-6 text-left">
					  <button type="button" onclick="$('a[href=\'#shipping-method\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
					</div>
					<?php }else{ ?>
					<div class="col-sm-6 text-left">
					  <button type="button" onclick="$('a[href=\'#payment-address\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
					</div>
					<?php } ?>
				</div>
				
				<div id="checkout-confirm" class="tab-pane">
					<h4 class="panel-title"><?php echo $text_checkout_confirm; ?></h4>
					<div class="panel-body"></div>
					<div class="col-sm-6 text-left">
					  <button type="button" onclick="$('a[href=\'#payment-method\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
					</div>
				</div>
			</div>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>

<script type="text/javascript"><!--

// Disable the tabs
$('#bttabs a[data-toggle=\'tab\']').on('click', function(e) {
	return false;
});

$(document).on('change', 'input[name=\'account\']', function() {
	if ($('#payment-address').find('.panel-title > *').is('a')) {	
		if (this.value == 'register') {
			$('#payment-address').find('.panel-title').html('<a href="#payment-address"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
		} else {
			$('#payment-address').find('.panel-title').html('<a href="#payment-address"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
		}
	} else {
		if (this.value == 'register') {
			$('#payment-address').find('.panel-title').html('<?php echo $text_checkout_account; ?>');
		} else {
			$('#payment-address').find('.panel-title').html('<?php echo $text_checkout_payment_address; ?>');
		}	
	}
});

<?php if (!$logged) { ?> 
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/login',
        dataType: 'html',
        success: function(html) {
			$('#checkout-option .panel-body').html(html);
		   
			$('a[href=\'#checkout-option\']').tab('show');
			
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});     
<?php } else { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address',
        dataType: 'html',
        success: function(html) {
            $('#payment-address .panel-body').html(html);
			
			$('a[href=\'#payment-address\']').tab('show');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
<?php } ?>

// Checkout
$(document).delegate('#button-account', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').val(),
        dataType: 'html',
        beforeSend: function() {
        	$('#button-account').button('loading');
		},      
        complete: function() {
			$('#button-account').button('reset');
        },          
        success: function(html) {
            $('.alert, .text-danger').remove();
            
            $('#payment-address .panel-body').html(html);
			
			$('a[href=\'#payment-address\']').tab('show');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/login/save',
        type: 'post',
        data: $('#checkout-option :input'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-login').button('loading');
		},  
        complete: function() {
            $('#button-login').button('reset');
        },              
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
			
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#checkout-option .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('a[href=\'#checkout-option\']').tab('show');
				
				// Highlight any found errors
				$('input[name=\'email\']').parent().addClass('has-error');	
				$('input[name=\'password\']').parent().addClass('has-error');	   
		   }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Register
$(document).delegate('#button-register', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/register/save',
        type: 'post',
        data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'date\'], #payment-address input[type=\'datetime-local\'], #payment-address input[type=\'time\'], #payment-address input[type=\'password\'], #payment-address input[type=\'hidden\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address textarea, #payment-address select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},  
        complete: function() {
            $('#button-register').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
			            
            if (json['redirect']) {
                location = json['redirect'];                
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#payment-address .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                
				for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');					
            } else {
                <?php if ($shipping_required) { ?>              
                var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').prop('value');
                
                if (shipping_address) {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function(html) {
							// Add the shipping address
                            $.ajax({
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
                                success: function(html) {
                                    $('#shipping-address .panel-body').html(html);
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            }); 
							
							$('#shipping-method .panel-body').html(html);
							
							$('a[href=\'#shipping-method\']').tab('show');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    }); 
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_address',
                        dataType: 'html',
                        success: function(html) {
                            $('#shipping-address .panel-body').html(html);
                            
							$('a[href=\'#shipping-address\']').tab('show');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });         
                }
                <?php } else { ?>
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#payment-method .panel-body').html(html);
						
						$('a[href=\'#payment-method\']').tab('show');				
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });                 
                <?php } ?>

                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#payment-address .panel-body').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Payment Address  
$(document).delegate('#button-payment-address', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address/save',
        type: 'post',
        data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'date\'], #payment-address input[type=\'datetime-local\'], #payment-address input[type=\'time\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address textarea, #payment-address select'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-payment-address').button('loading');
		},  
        complete: function() {
			$('#button-payment-address').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                				
				for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
								
				// Highlight any found errors
				$('.text-danger').parent().parent().addClass('has-error');				
            } else {
                <?php if ($shipping_required) { ?>
                $.ajax({
                    url: 'index.php?route=checkout/shipping_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#shipping-address .panel-body').html(html);
                        
						$('a[href=\'#shipping-address\']').tab('show');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
                <?php } else { ?>
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#payment-method .panel-body').html(html);
						
						$('a[href=\'#payment-method\']').tab('show');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
                <?php } ?>
                
                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#payment-address .panel-body').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });             
            }     
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Shipping Address         
$(document).delegate('#button-shipping-address', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/save',
        type: 'post',
        data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'date\'], #shipping-address input[type=\'datetime-local\'], #shipping-address input[type=\'time\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address textarea, #shipping-address select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-shipping-address').button('loading');
	    },  
        complete: function() {
			$('#button-shipping-address').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
  								
				for (i in json['error']) {
					var element = $('#input-shipping-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
								
				// Highlight any found errors
				$('.text-danger').parent().parent().addClass('has-error');				
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/shipping_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#shipping-method .panel-body').html(html);
						
						$('a[href=\'#shipping-method\']').tab('show');
						
                        $.ajax({
                            url: 'index.php?route=checkout/shipping_address',
                            dataType: 'html',
                            success: function(html) {
                                $('#shipping-address .panel-body').html(html);
                            },
                            error: function(xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
                
                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#payment-address .panel-body').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });                 
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Guest
$(document).delegate('#button-guest', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/guest/save',
        type: 'post',
        data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'date\'], #payment-address input[type=\'datetime-local\'], #payment-address input[type=\'time\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address textarea, #payment-address select'),
        dataType: 'json',
        beforeSend: function() {
       		$('#button-guest').button('loading');
	    },  
        complete: function() {
			$('#button-guest').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                                
				for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
								
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');					
            } else {
                <?php if ($shipping_required) { ?>  
                var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').prop('value');
                
                if (shipping_address) {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function(html) {
							// Add the shipping address
                            $.ajax({
                                url: 'index.php?route=checkout/guest_shipping',
                                dataType: 'html',
                                success: function(html) {
                                    $('#shipping-address .panel-body').html(html);
									
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });
                           
						    $('#shipping-method .panel-body').html(html);
							
							$('a[href=\'#shipping-method\']').tab('show');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });                 
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/guest_shipping',
                        dataType: 'html',
                        success: function(html) {
                            $('#shipping-address .panel-body').html(html);
							
							$('a[href=\'#shipping-address\']').tab('show');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
                <?php } else { ?>               
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#payment-method .panel-body').html(html);
						
						$('a[href=\'#payment-method\']').tab('show');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });             
                <?php } ?>
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Guest Shipping
$(document).delegate('#button-guest-shipping', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/guest_shipping/save',
        type: 'post',
        data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'date\'], #shipping-address input[type=\'datetime-local\'], #shipping-address input[type=\'time\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address textarea, #shipping-address select'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-guest-shipping').button('loading');
		},  
        complete: function() {
			$('#button-guest-shipping').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

				for (i in json['error']) {
					var element = $('#input-shipping-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');				
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/shipping_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#shipping-method .panel-body').html(html);
						
						$('a[href=\'#shipping-method\']').tab('show');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });             
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

$(document).delegate('#button-shipping-method', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-shipping-method').button('loading');
		},  
        complete: function() {
			$('#button-shipping-method').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#shipping-method .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }           
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#payment-method .panel-body').html(html);
						
						$('a[href=\'#payment-method\']').tab('show');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });                 
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

$(document).delegate('#button-payment-method', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_method/save', 
        type: 'post',
        data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
        dataType: 'json',
        beforeSend: function() {
         	$('#button-payment-method').button('loading');
		},  
        complete: function() {
            $('#button-payment-method').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#payment-method .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }           
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/confirm',
                    dataType: 'html',
                    success: function(html) {
                        $('#checkout-confirm .panel-body').html(html);
						
						$('a[href=\'#checkout-confirm\']').tab('show');
					},
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});
//--></script> 
<?php echo $footer; ?>