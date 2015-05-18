<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			 <button type="submit" form="form-community" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button></div>
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
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
	  </div>
	  <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-community" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-3 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-9">
              <select name="ace_community_poll_status" id="input-status" class="form-control">
                <?php if ($community_poll_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-3 control-label" for="input-status"><?php echo 'Lựa chọn câu hỏi khảo sát'; ?></label>
            <div class="col-sm-9">
              <select name="ace_community_poll_module[poll_id]" id="input-status" class="form-control">
				<?php foreach($polls as $poll){ ?>
                <?php if ($poll['poll_id'] == $poll_id) { ?>
                <option value="<?php echo $poll['poll_id']; ?>" selected="selected"><?php echo $poll['question']; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="<?php echo $poll['poll_id']; ?>"><?php echo $poll['question']; ?></option>
                <?php } ?>
				<?php } ?>
              </select>
            </div>
          </div>
        </form>
    </div>
  </div>
</div>

<?php echo $footer; ?>