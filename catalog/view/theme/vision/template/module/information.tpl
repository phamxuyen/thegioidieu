<div class="bt-box bt-information">
	<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
	<div class="box-content">
		<ul class="box-information">
			<?php foreach ($informations as $information) { ?>
				<li>
					<a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
				</li>
			<?php } ?>
		</ul>
	</div>
</div>