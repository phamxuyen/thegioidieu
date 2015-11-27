<?php function showSubcate($category) {
	if (count($category['children']) > 0) {	
		echo '<span class="plus">+</span><span class="minus">-</span>';
		echo '<ul class="item_child_child">';
	
		foreach ($category['children'] as $cat) {
			echo(count($cat['children']) >0 ? '<li class="cate-list-item submenu">':'<li class="cate-list-item">');
				echo '<a href="'.$cat['href'].'">'.$cat['name'].'</a>';				
				showSubcate($cat);
			echo '</li>';
		}		
	
		echo '</ul>';
	}
} ?>


<div class="bt-box bt-category">
	<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
	<div class="box-category" id="boss-category">
	<ul class="box-category">
			<?php foreach ($categories as $category) { ?>
				<li class="<?php if ($category['children']) { echo "child"; }?> <?php if ($category['category_id'] == $category_id) echo 'active opencate'; ?>">
					<a href="<?php echo $category['href']; ?>">
						<?php echo $category['name']; ?>
					</a>
					<?php if (count($category['children']) > 0) { ?>	
					<span class="plus">+</span><span class="minus">-</span>
					<ul class="item_child">
					
						<?php foreach($category['children'] as $cate_child) { ?>
							<li class="<?php if ($cate_child['children']) { echo "child"; }?> <?php if ($cate_child['category_id'] == $child_id) echo 'active opencate'; ?>">
								<a href="<?php echo $cate_child['href']; ?>">
									<?php echo $cate_child['name']; ?>
								</a>
								
								<?php showSubcate($cate_child);?>
							</li>
						<?php } ?>
					</ul>
					<?php } ?>
				</li>
			<?php } ?>
		</ul>
	</div>
</div>
<script type="text/javascript">
	$(".child").click(function(){
	  $(this).toggleClass('opencate');
	});
</script>
<!--module boss-category-->