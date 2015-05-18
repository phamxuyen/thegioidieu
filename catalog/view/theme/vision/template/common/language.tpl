<?php if (count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
  <div class="btn-group">
	<?php foreach ($languages as $language) { ?>
		<?php if($language['code']==$code){?>
			<a title="<?php echo $language['name']; ?>"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>"></a>
		<?php }else{ ?>
			<a title="<?php echo $language['name']; ?>" onclick="$('input[name=\'code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language').submit();"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>"></a>
		<?php } ?>
    <?php } ?>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
