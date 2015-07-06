<?php require_once(DIR_SYSTEM . 'library/btform.php');?>
<?php 
$btform = new Btform();
?>
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
		  <h1><?php echo $heading_title; ?></h1>
		  <ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		  </ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i><?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-manufacturer" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
						  <select name="boss_manager[status]" id="input-status" class="form-control">
							<?php if (isset($status) && $status) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
					
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#optionsetting"><?php echo 'Option Setting'; ?></a></li>
						<li><a data-toggle="tab" href="#layoutsetting"><?php echo 'Layout Setting'; ?></a></li>
						<li><a data-toggle="tab" href="#headersetting"><?php echo 'Header Setting'; ?></a></li>
						<li><a data-toggle="tab" href="#footersetting"><?php echo 'Footer Setting'; ?></a></li>
						<li><a data-toggle="tab" href="#othersetting"><?php echo 'Other Setting'; ?></a></li>						
					</ul>
					
					<div class="tab-content">						
						<!-- #option setting-->
						<div id="optionsetting" class="tab-pane active">
							<table class="table table-striped table-bordered table-hover">
								<tr><td><label class="control-label"><span data-toggle="tooltip" title="" data-original-title="Disable/Enable button scroll to top" class="help"><?php echo 'Display button scroll top:'; ?></span></label></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrstatus, 'boss_manager[option][bt_scroll_top]','',isset($option['bt_scroll_top']) ? $option['bt_scroll_top'] : false); ?></td></tr>
								<tr><td><label class="control-label"><span data-toggle="tooltip" title="" data-original-title="Disable/Enable navigation menu sticky on the page top when the header goes out of display area" class="help"><?php echo 'Display sitcky menu:'; ?></span></label></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrstatus, 'boss_manager[option][sticky_menu]','',isset($option['sticky_menu']) ? $option['sticky_menu'] : false); ?></td></tr>
								<tr><td><label class="control-label"><span data-toggle="tooltip" title="" data-original-title="User Default menu of opencart or the menu of Bossthemes" class="help"><?php echo 'Show Menu:'; ?></span></label></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrusemenu, 'boss_manager[option][use_menu]','',isset($option['use_menu']) ? $option['use_menu'] : false); ?></td></tr>
								
								<tr><td><label class="control-label"><span data-toggle="tooltip" title="" data-original-title="Disable/Enable all the animations when load page" class="help"><?php echo 'Animation:'; ?></span></label></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrstatus, 'boss_manager[option][animation]','',isset($option['animation']) ? $option['animation'] : false); ?></td></tr>
								
							</table>
						</div>
						<!-- End #option setting-->
						
						<!-- #option setting-->
						<div id="layoutsetting" class="tab-pane">
							<table class="table table-striped table-bordered table-hover">
							<tr><td><?php echo 'Mode css:'; ?></td>
							<td class="left"><table class="table table-striped table-bordered table-hover">
								<tr><td colspan="4"><?php echo $btform -> radioField('boss_manager[layout][mode_css]','wide',isset($layout['mode_css'])?$layout['mode_css']:'','Wide'); ?></td></tr>
								<tr><td>
								<?php echo $btform -> radioField('boss_manager[layout][mode_css]','boxed',isset($layout['mode_css'])?$layout['mode_css']:'','Boxed'); ?></td><td> - Box Width: </td><td><?php echo $btform -> textField('boss_manager[layout][box_width]',isset($layout['box_width']) ? $layout['box_width'] : '1200',10); ?></td><td>px</td></tr></table>
							</td>
							</tr>
							</table>
						</div>
						<!-- End #option setting-->
						
						<!-- #option setting-->
						<div id="headersetting" class="tab-pane">
							<div class="col-sm-2">
							<ul class="nav nav-pills nav-stacked" id="btfooter">
								<li class="active"><a href="#tab_header_layout" data-toggle="tab" ><?php echo 'Header Layout'; ?></a></li>
								<li><a href="#tab_header_block" data-toggle="tab" ><?php echo 'Welcome'; ?></a></li>
								<li><a href="#tab_header_link" data-toggle="tab" ><?php echo 'Link Default'; ?></a></li>								
							</ul>
							</div>
							<div class="col-sm-10">
							 <div class="tab-content">
								<div id="tab_header_layout" class="tab-pane active">
									<table class="table table-striped table-bordered table-hover">
									<tr><td><?php echo 'Header Mode css:'; ?></td>
									<td class="left"><table class="table table-striped table-bordered table-hover">
										<tr><td colspan="4"><?php echo $btform -> radioField('boss_manager[layout][h_mode_css]','inherit',isset($layout['h_mode_css'])?$layout['h_mode_css']:'','Inherit'); ?></td></tr>
										<tr><td>
										<?php echo $btform -> radioField('boss_manager[layout][h_mode_css]','boxed',isset($layout['h_mode_css'])?$layout['h_mode_css']:'','Boxed'); ?></td><td> - Box Width: </td><td><?php echo $btform -> textField('boss_manager[layout][h_box_width]',isset($layout['h_box_width']) ? $layout['h_box_width'] : '1200',10); ?></td><td>px</td></tr></table>
									</td>
									</tr>
									</table>
								</div>
								<div id="tab_header_block" class="tab-pane">
									<table class="table table-striped table-bordered table-hover">
										<tr>
											<td><?php echo 'Status:'; ?></td>
											<td><select class="form-control" name="boss_manager_header_block[status]">
												<?php if (isset($header_block['status']) && $header_block['status']) { ?>
													<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select></td>
										</tr>										
									</table>
									<ul id="header_block_language" class="nav nav-tabs">
										<?php foreach ($languages as $language) { ?>
										<li><a data-toggle="tab" href="#header-block-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
									</ul>
									
									<div class="tab-content">
									<?php foreach ($languages as $language) { ?>
									<div id="header-block-<?php echo $language['language_id']; ?>" class="tab-pane">
										<table class="table table-striped table-bordered table-hover">
										<tbody>
											<tr>
												<td><?php echo 'Content:'; ?></td>
												<td><textarea name="boss_manager_header_block[content][<?php echo $language['language_id']; ?>]" id="bt_header_content<?php echo $language['language_id']; ?>" rows="10" cols="50" ><?php echo isset($header_block['content'][$language['language_id']])?$header_block['content'][$language['language_id']]:''; ?></textarea></td>
											</tr>
										</tbody>
										</table>
									</div>
									<?php } ?></div>
								</div>
								<div id="tab_header_link" class="tab-pane">
									<div class="form-group">
										<label class="col-sm-2 control-label">Language</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['language']) && $boss_manager['header_link']['language'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][language]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][language]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][language]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][language]" value="0"> No </label>
											
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Currency</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['currency']) && $boss_manager['header_link']['currency'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][currency]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][currency]" value="0" checked="checked"> No </label>
											
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][currency]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][currency]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Phone</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['phone']) && $boss_manager['header_link']['phone'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][phone]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][phone]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][phone]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][phone]" value="0"> No </label>
											
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">My Account</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['my_account']) && $boss_manager['header_link']['my_account'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][my_account]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][my_account]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][my_account]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][my_account]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Wishlist</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['wishlist']) && $boss_manager['header_link']['wishlist'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][wishlist]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][wishlist]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][wishlist]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][wishlist]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Shopping Cart</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['shopping_cart']) && $boss_manager['header_link']['shopping_cart'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][shopping_cart]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][shopping_cart]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][shopping_cart]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][shopping_cart]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Checkout</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['checkout']) && $boss_manager['header_link']['checkout'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][checkout]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][checkout]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][checkout]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][checkout]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Logo</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['logo']) && $boss_manager['header_link']['logo'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][logo]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][logo]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][logo]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][logo]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Search</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['search']) && $boss_manager['header_link']['search'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][search]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][search]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][search]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][search]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Cart Mini</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['header_link']['cart_mini']) && $boss_manager['header_link']['cart_mini'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][cart_mini]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][cart_mini]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][cart_mini]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[header_link][cart_mini]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
								</div>
							 </div>
							</div>
							
						</div>
						<!-- End #option setting-->
						
						<!-- #option setting-->
						<div id="footersetting" class="tab-pane">
							<div class="col-sm-2">
							<ul class="nav nav-pills nav-stacked" id="btfooter">
								<li class="active"><a href="#tab_footer_mode" data-toggle="tab" ><?php echo 'Layout'; ?></a></li>
								<li><a href="#tab_footer_1" data-toggle="tab" ><?php echo 'About us'; ?></a></li>
								<li><a href="#tab_footer_7" data-toggle="tab"><?php echo 'Follow us'; ?></a></li>
								<li><a href="#tab_footer_5" data-toggle="tab"><?php echo 'Payment link'; ?></a></li>
								<li><a href="#tab_footer_6" data-toggle="tab"><?php echo 'Powered by'; ?></a></li>
								<!--<li><a href="#tab_footer_link" data-toggle="tab"><?php echo 'Link Default'; ?></a></li>-->
							</ul>
							</div>
							<div class="col-sm-10">
							 <div class="tab-content">
								<div id="tab_footer_mode" class="tab-pane active">
									<table class="table table-striped table-bordered table-hover">
									<tr><td><?php echo 'Footer Mode css:'; ?></td>
									<td class="left"><table class="table table-striped table-bordered table-hover">
										<tr><td colspan="4"><?php echo $btform -> radioField('boss_manager[layout][f_mode_css]','inherit',isset($layout['f_mode_css'])?$layout['f_mode_css']:'','Inherit'); ?></td></tr>
										<tr><td>
										<?php echo $btform -> radioField('boss_manager[layout][f_mode_css]','fboxed',isset($layout['f_mode_css'])?$layout['f_mode_css']:'','Boxed'); ?></td><td> - Box Width: </td><td><?php echo $btform -> textField('boss_manager[layout][f_box_width]',isset($layout['f_box_width']) ? $layout['f_box_width'] : '1200',10); ?></td><td>px</td></tr></table>
									</td>
									</tr>
									</table>
								</div>
								
								<div id="tab_footer_1" class="tab-pane">
									<table class="table table-striped table-bordered table-hover">
										<tr>
											<td><?php echo 'Status:'; ?></td>
											<td><select class="form-control" name="boss_manager_footer_about[status]">
												<?php if (isset($footer_about['status']) && $footer_about['status']) { ?>
													<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select></td>
										</tr>
										<tr>
											<td><?php echo 'Image'; ?></td>
											<td><select class="form-control" name="boss_manager_footer_about[image_status]">
												<?php if (isset($footer_about['image_status']) && $footer_about['image_status']) { ?>
													<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select><br /><br />
											<a href="" id="thumb-aboutimage" data-toggle="image" class="img-thumbnail"><img src="<?php echo isset($about_image)?$about_image:$placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
											<input type="hidden" name="boss_manager_footer_about[image_link]" value="<?php echo isset($footer_about['image_link'])?$footer_about['image_link']:''; ?>" id="input-aboutimage" />
											</td>	
										</tr>
										<tr>
											<td><?php echo 'Image Link'; ?></td>
											<td>
												<input class="form-control" type="text" name="boss_manager_footer_about[image_url]" value="<?php echo isset($footer_about['image_url'])?$footer_about['image_url']:'#'; ?>" />
											</td>
										</tr>
									</table>
									<ul id="about_language" class="nav nav-tabs">
										<?php foreach ($languages as $language) { ?>
										<li><a data-toggle="tab" href="#tab-aboutus-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
									</ul>
									
									<div class="tab-content">
									<?php foreach ($languages as $language) { ?>
									<div id="tab-aboutus-<?php echo $language['language_id']; ?>" class="tab-pane">
										<table class="table table-striped table-bordered table-hover">
										<tbody>
											<tr style="display:none;">
												<td><?php echo 'About Store Title:'; ?></td>
												<td>
													<input type="text" name="boss_manager_footer_about[about_title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($footer_about['about_title'][$language['language_id']])?$footer_about['about_title'][$language['language_id']]:''; ?>" placeholder="About Us Title" class="form-control">
												</td>
											</tr>
											<tr>
												<td><?php echo 'About Store Content:'; ?></td>
												<td><textarea name="boss_manager_footer_about[about_content][<?php echo $language['language_id']; ?>]" id="bt_about_content<?php echo $language['language_id']; ?>" rows="10" cols="50" ><?php echo isset($footer_about['about_content'][$language['language_id']])?$footer_about['about_content'][$language['language_id']]:''; ?></textarea></td>
											</tr>
										</tbody>
										</table>
									</div>
									<?php } ?></div>
								</div>
								
														
								<div id="tab_footer_7" class="tab-pane">
									<table class="table table-striped table-bordered table-hover">
										<tbody>
										<tr>
											<td><?php echo 'Social Status:'; ?></td>
											<td><select class="form-control" name="boss_manager_footer_social[status]">
												<?php if (isset($footer_social['status']) && $footer_social['status']) { ?>
													<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select></td>
										</tr>
										<tr>
											<td><?php echo 'Title:'; ?></td>
											<td><table class="table table-striped table-bordered table-hover">
											<?php foreach ($languages as $language) { ?><tr><td>
											<input class="form-control" size=50 type="text" name="boss_manager_footer_social[title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($footer_social['title'][$language['language_id']])?$footer_social['title'][$language['language_id']]:''; ?>" placeholder="Follow Us"/></td><td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td></tr>
											<?php } ?>
											</table></td>
										</tr>
										<tr>
											<td><?php echo 'Facebook'; ?></td>
											<td>
											<input class="form-control" type="text" name="boss_manager_footer_social[face_url]" value="<?php echo isset($footer_social['face_url'])?$footer_social['face_url']:''; ?>" placeholder="https://"/></td>
										</tr>
										
										<tr>
											<td><?php echo 'Pinterest'; ?></td>
											<td>
											<input class="form-control" type="text" name="boss_manager_footer_social[pinterest_url]" value="<?php echo isset($footer_social['pinterest_url'])?$footer_social['pinterest_url']:''; ?>" placeholder="https://" /></td>
										</tr>
										<tr>
											<td><?php echo 'Twitter'; ?></td>
											<td>
											<input class="form-control" type="text" name="boss_manager_footer_social[twitter_url]" value="<?php echo isset($footer_social['twitter_url'])?$footer_social['twitter_url']:''; ?>" placeholder="https://" /></td>
										</tr>
										<tr>
											<td><?php echo 'Googleplus'; ?></td>
											<td>
											<input class="form-control" type="text" name="boss_manager_footer_social[googleplus_url]" value="<?php echo isset($footer_social['googleplus_url'])?$footer_social['googleplus_url']:''; ?>" placeholder="https://" /></td>
										</tr>
										<tr>
											<td><?php echo 'Rss Feed'; ?></td>
											<td> 
											<input class="form-control" type="text" name="boss_manager_footer_social[rss_url]" value="<?php echo isset($footer_social['rss_url'])?$footer_social['rss_url']:''; ?>" placeholder="http://" /></td>
										</tr>
										<tr>
											<td><?php echo 'Youtube'; ?></td>
											<td>
											<input class="form-control" type="text" name="boss_manager_footer_social[youtube_url]" value="<?php echo isset($footer_social['youtube_url'])?$footer_social['youtube_url']:''; ?>" placeholder="https://" /></td>
										</tr>
										
										</tbody>
									</table>
								</div>
								
								<div id="tab_footer_5" class="tab-pane">
									<?php $text_url = 'Url:'; ?>
									<table class="table table-striped table-bordered table-hover">
										<tr>
											<td><?php echo 'Payment Status:'; ?></td>
											<td><select class="form-control" name="boss_manager_footer_payment[status]">
												<?php if (isset($footer_payment['status']) && $footer_payment['status']) { ?>
													<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
													<option value="0"><?php echo $text_disabled; ?></option>
												<?php } else { ?>
													<option value="1"><?php echo $text_enabled; ?></option>
													<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
												<?php } ?>
											</select></td>
										</tr>
										<tr>
											<td><?php echo 'Visa'; ?></td>
											<td><table class="table table-striped table-bordered table-hover"><tr><td>Show<input class="form-control" type="checkbox" name="boss_manager_footer_payment[visa_status]" <?php echo (isset($footer_payment['visa_status'])&&$footer_payment['visa_status'])?'checked="checked"':'';?> /></td><td>
											
											<?php echo $text_url; ?><input class="form-control" type="text" name="boss_manager_footer_payment[visa_link]" value="<?php echo isset($footer_payment['visa_link'])?$footer_payment['visa_link']:''; ?>" /></td></tr></table></td>
										</tr>
										<tr>
											<td><?php echo 'Master Card'; ?></td>
											<td><table class="table table-striped table-bordered table-hover"><tr><td>Show<input class="form-control" type="checkbox" name="boss_manager_footer_payment[master_status]" <?php echo (isset($footer_payment['master_status'])&&$footer_payment['master_status'])?'checked="checked"':'';?> />
											
											</td><td><?php echo $text_url; ?><input class="form-control" type="text" name="boss_manager_footer_payment[master_link]" value="<?php echo isset($footer_payment['master_link'])?$footer_payment['master_link']:''; ?>" /></td></tr></table></td>
										</tr>
										<tr>
											<td><?php echo 'American Express'; ?></td>
											<td><table class="table table-striped table-bordered table-hover"><tr><td>Show<input class="form-control" type="checkbox" name="boss_manager_footer_payment[merican_status]" <?php echo (isset($footer_payment['merican_status'])&&$footer_payment['merican_status'])?'checked="checked"':'';?> /></td><td>
											
											<?php echo $text_url; ?><input class="form-control" type="text" name="boss_manager_footer_payment[merican_link]" value="<?php echo isset($footer_payment['merican_link'])?$footer_payment['merican_link']:''; ?>" /></td></tr></table></td>
										</tr>
										<tr>
											<td><?php echo 'Paypal'; ?></td>
											<td><table class="table table-striped table-bordered table-hover"><tr><td>Show<input class="form-control" type="checkbox" name="boss_manager_footer_payment[paypal_status]" <?php echo (isset($footer_payment['paypal_status'])&&$footer_payment['visa_status'])?'checked="checked"':'';?> /></td><td>
											
											<?php echo $text_url; ?><input class="form-control" type="text" name="boss_manager_footer_payment[paypal_link]" value="<?php echo isset($footer_payment['paypal_link'])?$footer_payment['paypal_link']:''; ?>" /></td></tr></table></td>
										</tr>
										
										<tr>
											<td><?php echo 'Skrill'; ?></td>
											<td><table class="table table-striped table-bordered table-hover"><tr><td>Show<input class="form-control" type="checkbox" name="boss_manager_footer_payment[skrill_status]" <?php echo (isset($footer_payment['skrill_status'])&&$footer_payment['skrill_status'])?'checked="checked"':'';?> /></td><td>
											
											<?php echo $text_url; ?><input class="form-control" type="text" name="boss_manager_footer_payment[skrill_link]" value="<?php echo isset($footer_payment['skrill_link'])?$footer_payment['skrill_link']:''; ?>" /></td></tr></table></td>
										</tr>
									</table>
								</div>
								
								<div id="tab_footer_6" class="tab-pane">
									<ul id="powered_language" class="nav nav-tabs">
										<?php foreach ($languages as $language) { ?>
										<li><a data-toggle="tab" href="#tab-powered-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
										<?php } ?>
									</ul>
									<div class="tab-content">
									<?php foreach ($languages as $language) { ?>
									<div id="tab-powered-<?php echo $language['language_id']; ?>" class="tab-pane">
										<table class="table table-striped table-bordered table-hover">
										<tbody>
											<tr>
												<td><?php echo 'Powered Content:'; ?></td>
												<td><textarea name="boss_manager_footer_powered[<?php echo $language['language_id']; ?>]" id="bt_powered<?php echo $language['language_id']; ?>" rows="10" cols="50" ><?php echo isset($footer_powered[$language['language_id']])?$footer_powered[$language['language_id']]:''; ?></textarea></td>
											</tr>
										</tbody>
										</table>
									</div>
									<?php } ?></div>
								</div>
								
								<div id="tab_footer_link" class="tab-pane" style="display:none;">
									<div class="form-group">
										<label class="col-sm-2 control-label">Information</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['information']) && $boss_manager['footer_link']['information'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][information]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][information]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][information]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][information]" value="0"> No </label>
											
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Contact Us</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['contact_us']) && $boss_manager['footer_link']['contact_us'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][contact_us]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][contact_us]" value="0" checked="checked"> No </label>
											
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][contact_us]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][contact_us]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Returns</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['return']) && $boss_manager['footer_link']['return'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][return]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][return]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][return]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][return]" value="0"> No </label>
											
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Site Map</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['site_map']) && $boss_manager['footer_link']['site_map'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][site_map]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][site_map]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][site_map]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][site_map]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Brands</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['brands']) && $boss_manager['footer_link']['brands'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][brands]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][brands]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][brands]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][brands]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Gift Vouchers</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['gift_vouchers']) && $boss_manager['footer_link']['gift_vouchers'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][gift_vouchers]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][gift_vouchers]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][gift_vouchers]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][gift_vouchers]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Affiliates</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['affiliates']) && $boss_manager['footer_link']['affiliates'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][affiliates]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][affiliates]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][affiliates]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][affiliates]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Specials</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['specials']) && $boss_manager['footer_link']['specials'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][specials]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][specials]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][specials]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][specials]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">My Account</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['my_account']) && $boss_manager['footer_link']['my_account'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][my_account]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][my_account]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][my_account]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][my_account]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Order History</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['order_history']) && $boss_manager['footer_link']['order_history'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][order_history]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][order_history]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][order_history]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][order_history]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Wish List</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['wishlist']) && $boss_manager['footer_link']['wishlist'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][wishlist]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][wishlist]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][wishlist]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][wishlist]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">Newsletter</label>
										<div class="col-sm-10">
											<?php if(isset($boss_manager['footer_link']['newsletter']) && $boss_manager['footer_link']['newsletter'] ==0){ ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][newsletter]" value="1"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][newsletter]" value="0" checked="checked"> No </label>
											<?php } else { ?>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][newsletter]" value="1" checked="checked"> Yes </label>
											<label class="radio-inline"><input type="radio" name="boss_manager[footer_link][newsletter]" value="0"> No </label>
											<?php } ?>
									  </div>
									</div>
								</div>
								
							 </div>
							</div>
						</div>
						<!-- End #option setting-->
						
						<!-- #option setting-->
						<div id="othersetting" class="tab-pane">
							<table class="table table-striped table-bordered table-hover">
								<tr><td><?php echo 'Product Description:'; ?></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrshow, 'boss_manager[other][pro_tab]','',isset($other['pro_tab']) ? $other['pro_tab'] : false); ?></td></tr>
								
								<tr><td><?php echo 'Show Category Info:'; ?></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrstatus, 'boss_manager[other][category_info]','',isset($other['category_info']) ? $other['category_info'] : false); ?></td></tr>
								<tr><td><?php echo 'Show Refine Search:'; ?></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrstatus, 'boss_manager[other][refine_search]','',isset($other['refine_search']) ? $other['refine_search'] : false); ?></td></tr>								
							
								<tr><td><?php echo 'View Product:'; ?></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrview, 'boss_manager[other][view_pro]','',isset($other['view_pro']) ? $other['view_pro'] : false); ?></td></tr>
								<tr><td><?php echo 'Products/Row:'; ?> <label class="control-label"><span data-toggle="tooltip" title="" data-original-title="Only: Category, Manufacture, Special, Search. NOT show Homepage" class="help"></span></label></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrperrow, 'boss_manager[other][perrow]','',isset($other['perrow']) ? $other['perrow'] : false); ?></td></tr>
								<tr><td><?php echo 'Display Language'; ?></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrdropdown, 'boss_manager[other][language]','',isset($other['language']) ? $other['language'] : false); ?></td></tr>
								<tr><td><?php echo 'Display Currency'; ?></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrdropdown, 'boss_manager[other][currency]','',isset($other['currency']) ? $other['currency'] : false); ?></td></tr>
								<tr><td><?php echo 'Choose Css(stylesheet):'; ?> <label class="control-label"><span data-toggle="tooltip" title="" data-original-title="Each homepage will have the different css file. You need choose it to match" class="help"></span></label></td><td class="left">
								<?php echo $btform -> makeSelectHTML($arrstyle, 'boss_manager[other][stylesheet]','',isset($other['stylesheet']) ? $other['stylesheet'] : false); ?></td></tr>
								<tr><td><?php echo 'Class Home page:'; ?></td><td class="left">
								<?php echo $btform -> textField('boss_manager[other][class_home]',isset($other['class_home']) ? $other['class_home'] : '',10); ?></td></tr>
							</table>
						</div>
						<!-- End #option setting-->

						
					</div>
					
				</form>
			</div>
		</div>
	  
	</div>	
</div>


<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#bt_header_content<?php echo $language['language_id']; ?>,#bt_about_content<?php echo $language['language_id']; ?>,#bt_powered<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
$('#header_block_language a:first').tab('show');
$('#about_language a:first').tab('show');
$('#powered_language a:first').tab('show');
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function(){ 
$('fieldset legend').click(function(){
		$(this).parent().toggleClass('open');
	});
});
//--></script> 
<?php echo $footer; ?>