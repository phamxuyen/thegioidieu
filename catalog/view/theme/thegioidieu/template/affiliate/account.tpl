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
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	<div class="content_bg">
      <h2 class="title_border"><?php echo $text_my_account; ?></h2>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
      <ul class="list-unstyled myaccount">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
      </ul>
      <h2 class="title_border"><?php echo $text_my_tracking; ?></h2>
      <ul class="list-unstyled myaccount">
        <li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
      </ul>
      <h2 class="title_border"><?php echo $text_my_transactions; ?></h2>
      <ul class="list-unstyled myaccount">
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      </ul>
      <?php echo $content_bottom; ?></div></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>