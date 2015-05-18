<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="ace_area">
	<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<a onclick="$('form').submit();" href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></a></div>
		  <h1><?php echo $heading_title; ?></h1>
		  <ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		  </ul>
		</div>
	</div>
	<div class="container-fluid">
	<?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	<?php if ($success) { ?>
		<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i><?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
	 <div class="panel panel-default">
      <div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
	  </div>
	  <div class="panel-body">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'question') { ?>
                <a href="<?php echo $sort_question; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_question; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_question; ?>"><?php echo $column_question; ?></a>
                <?php } ?></td>
              
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($polls) { ?>
            <?php foreach ($polls as $poll) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($poll['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $poll['poll_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $poll['poll_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $poll['question']; ?></td>              
            <td class="right">
            <div class="buttons">
            <?php foreach ($poll['action'] as $action) { ?>
              <a class="btn btn-primary btn-xs" href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a>
              <?php } ?></div></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="3"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
</div>

<?php echo $footer; ?>