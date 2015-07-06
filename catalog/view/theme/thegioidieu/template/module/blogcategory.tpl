<div class="bt-box bt-category">
  <div class="box-heading block-title">
    <?php echo $heading_title; ?>
  </div>
  <div class="box-content">
    <div class="box-category" id="boss-blog-category">
        <?php if($categories){?>
      <ul class="box-category">
        <?php foreach ($categories as $category) { ?>
		<?php $icon=0; ?>
        <li class="<?php if ($category['children']) {echo 'child '; $icon=1; } 
				if ($category['blog_category_id'] == $blog_category_id){echo 'active'; if($icon==1){$icon=2;} }
				else { foreach ($category['children'] as $child) {
					if ($child['blog_category_id'] == $child_id) { echo 'active';if($icon==1){$icon=2;}  break;}}} ?>" >
          
		  <?php if ($category['blog_category_id'] == $blog_category_id) { ?>
		  
          <a href="<?php echo $category['href']; ?>" class="active list-group-item"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
          <?php } ?>
          <?php if ($category['children']) { ?>
          <ul class="item_child">
            <?php foreach ($category['children'] as $child) { ?>
              <?php if ($child['blog_category_id'] == $child_id) { ?>
              <li class="active"><a href="<?php echo $child['href']; ?>"  class="list-group-item"> <?php echo $child['name']; ?></a> </li>
              <?php } else { ?>
              <li><a href="<?php echo $child['href']; ?>" class="list-group-item"> <?php echo $child['name']; ?></a> </li>
              <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
      <?php } else {?>
        <?php echo 'There are no Category.'; ?>
        <?php } ?>
    </div>
  </div>
</div>
<script type="text/javascript">
	$('document').ready(function(){			
		$('#boss-blog-category li.child').prepend('');
		$('#boss-blog-category li.child > p').click(function(){			
			if ($(this).text() == '+'){
				$(this).parent('li').children('ul.item_child').slideDown(300);
				$(this).text('-');
			}else{
				$(this).parent('li').children('ul.blog_child').slideUp(300);
				$(this).text('+');
			}  
			
		});				
	});
</script>
