<?php if (count($currencies) > 0) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
  <div class="btn-group">
	<span><?php echo $text_currency; ?></span>
	<?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['code'] == $code) { ?>
			<?php if ($currency['symbol_left']) { ?>
			<a class="active" title="<?php echo $currency['title']; ?>"><?php echo $currency['symbol_left']; ?></a>
			<?php } else { ?>
			<a class="active" title="<?php echo $currency['title']; ?>"><?php echo $currency['symbol_right']; ?></a>
			<?php } ?>
		<?php } else { ?>
			<?php if ($currency['symbol_left']) { ?>
			<a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();"><?php echo $currency['symbol_left']; ?></a>
			<?php } else { ?>
			<a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency').submit();"><?php echo $currency['symbol_right']; ?></a>
			<?php } ?>
		<?php } ?>
    <?php } ?>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
