<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
    <div class="container-fluid">
      
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_boss_catalog; ?></h3>
		</div> 		 
		<div class="panel-body">
			<div class="row">
				<div class="col-sm-12">
					<div class="tab-content">						
							<ul class="nav nav-tabs">
							<li><a href="<?php echo $boss_category; ?>"> <?php echo $text_boss_category; ?></a></li>
							<li><a href="<?php echo $boss_articles; ?>"> <?php echo $text_boss_articles; ?></a></li>
							<li><a href="<?php echo $boss_settings; ?>"> <?php echo $text_boss_settings; ?></a></li>
							</ul>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="tab-content">
						<div class="content">
							<div class="feature">
							<h3>Các danh mục</h3>
								<ul>
									<li><a href="<?php echo $boss_category; ?>" style="display: inline;"><?php echo $text_boss_category ; ?></a></li>
									<li><a href="<?php echo $boss_articles; ?>" style="display: inline;"><?php echo $text_boss_articles; ?></a></li>
									<li><a href="<?php echo $boss_settings; ?>" style="display: inline;"><?php echo $text_boss_settings; ?></a></li>
								</ul>
							
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
        
</div>
</div>
</div>
<?php echo $footer; ?>