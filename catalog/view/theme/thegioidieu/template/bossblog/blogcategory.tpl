<?php echo $header; ?>  
<?php global $config; ?>
<?php 
	$view='both_grid';
	if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = '';
	}
	if(!empty($boss_manager)){				
		$view = $boss_manager['other']['view_pro']; 		
	}
?>
<div class="container">
<div class="row">
	<div class="bt-breadcrumb">
	  <ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	  </ul>
	</div>  
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
	<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      
	  <?php if ($thumb || $description) { ?>
      <div class="">
        <?php if ($thumb) { ?>
        <div class="image" style="margin-bottom:20px;"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
		<h1 class="category_title"><?php echo $heading_title; ?></h1>
      </div>

      <?php } ?>
      <?php if ($blogcategories) { ?>
      <h3><?php echo $text_sub_category; ?></h3>
      <?php if (count($blogcategories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($blogcategories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($blogcategories, ceil(count($blogcategories) / 4)) as $blogcategories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($blogcategories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
	  <?php if ($articles) { ?>      
      <div class="product-filter">
		<div class="filter-view">
			
			<div class="bt_pagination">
				<?php if(!empty($pagination)){?><div class="links"><?php echo $pagination; ?></div> <?php } ?>
			</div>
		</div>
		<div class="limit_sort">
        <div class="limit">	
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
		  <label class="boss_select">
          <select id="input-limit" class="form-control selectpicker" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
		  </label>
		</div>
		<div class="sort">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
		  <label class="boss_select">
          <select id="input-sort" class="form-control selectpicker" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
		  </label>
		</div>
		</div>
        
      </div>
      <br />
	  <div class="row layout-thumb">
        <?php foreach ($articles as $article) { ?>
        <div class="product-layout article-list col-xs-12">
          <div class="product-thumb product-thumb-block">
		   <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
		   <div class="caption">
			<div class="article-name">
				<a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>                   
			</div>
			<div class="time-stamp">
						<?php $date = new DateTime($article['date_modified']);?>
						<small><?php echo $date->format('l, M j, Y');?></small>
			</div>
			<div class="article-content"><?php echo $article['title']; ?></div>   	
			<div class="article-footer">
					<span class="post-by"> <?php echo $text_postby;?> <span><?php echo $article['author']; ?></span></span>
					<span>&nbsp;|&nbsp;</span>
					<span class="comment-count"><span><?php echo $article['comment']; ?> </span><a href="<?php echo $article['href']; ?>"><?php echo $text_comments;?></a></span>                 
			</div>   
			</div>
          </div>
        </div>
        <?php } ?>
      </div>
       <div class="boss-panigation">
        <div class="box-results pull-right"><?php echo $results; ?></div>
      </div>
      <?php }else{ ?>
	  <p><?php echo $text_empty; ?></p>
	  <?php } ?>
	<?php echo $content_bottom; ?></div>	
    <?php echo $column_right; ?>
</div>
</div>          

<?php echo $footer; ?>