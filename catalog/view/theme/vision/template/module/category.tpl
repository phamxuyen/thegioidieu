<div class="bt-box bt-category">
<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
<div class="box-content">
    <div class="box-category" id="boss-category">
	<ul class="box-category">
	<?php foreach ($categories as $category) { ?>
	<?php if ($category['category_id'] == $category_id) { ?>   
	<li class="<?php if ($category['children']) { echo "child"; }?> active">
		<a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
		<span class="plus"><i class="fa fa-caret-right"></i></span><span class="minus"><i class="fa fa-caret-down"></i></span>
			<ul class="item_child">
			  <?php foreach ($category['children'] as $child) { ?>
			  <?php if ($child['category_id'] == $child_id) { ?>
			  <li><a href="<?php echo $child['href']; ?>" class="list-group-item active"><?php echo $child['name']; ?></a></li>
			  <?php } else { ?>
			  <li><a href="<?php echo $child['href']; ?>" class="list-group-item"><?php echo $child['name']; ?></a></li>
			  <?php } ?>
			  <?php } ?>
			</ul>		
	</li>
	<?php } else { ?>
	<li <?php if ($category['children']) { echo "class='child'"; }?>>
		<a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
		<span class="plus"><i class="fa fa-caret-right"></i></span><span class="minus"><i class="fa fa-caret-down"></i></span>
		<?php if ($category['children']) { ?>
		<ul class="item_child">
		  <?php foreach ($category['children'] as $child) { ?>
		  <?php if ($child['category_id'] == $child_id) { ?>
		  <li><a href="<?php echo $child['href']; ?>" class="list-group-item active"><?php echo $child['name']; ?></a></li>
		  <?php } else { ?>
		  <li><a href="<?php echo $child['href']; ?>" class="list-group-item"><?php echo $child['name']; ?></a></li>
		  <?php } ?>
		  <?php } ?>
		</ul>
		<?php } ?>
	</li>
	<?php } ?>
	<?php } ?>
	</ul>
	</div>
</div>
</div>
<script type="text/javascript">
	$(".child").click(function(){
	  $(this).toggleClass('opencate');
	});
</script>