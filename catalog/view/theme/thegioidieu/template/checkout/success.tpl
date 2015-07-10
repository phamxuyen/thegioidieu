<?php echo $header; ?>
<div class="container">
  <div class="row">
	<div class="bt-breadcrumb">
	  <ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	  </ul>
	</div><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-7'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	
	<div class="content_bg">
		<div class="success-cart">
			<div class="detail">
				<h3><?php echo $heading_title; ?></h3>
				<h4><?php echo $text_thanks; ?></h4>
				<p><?php echo $text_confirm; ?></p>
				<?php echo $text_message; ?>
			</div>
		</div>
		<div class="success-email">
			<div class="detail">
				<?php echo $text_email_note; ?>
			</div>
		</div>
      
      <div class="buttons">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
    </div>
    <?php echo $content_bottom; ?></div>
	<div class="col-sm-5 success-right"><?php echo $column_right; ?></div>
	</div>
</div>
<style>
#column-right{width:auto;}
</style>
<?php echo $footer; ?>