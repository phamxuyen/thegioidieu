<div class="bt-box block boss_block-tag-cloud">
		<div class="box-heading block-title">
			<span><?php echo $heading_title; ?></span>
		</div>		
		<div class="box-content block-content" style="text-align:left;"> 
			<?php if($blogtagcloud) { ?>
				<?php echo $blogtagcloud; ?>
			<?php } else { ?>
				<?php echo $text_notags; ?>
			<?php } ?>
		</div>
</div>