<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		  <div class="pull-right">
			<a href="<?php echo $poll_setting; ?>" data-toggle="tooltip" title="<?php echo $button_module; ?>" class="btn btn-primary"><i class="fa fa-cog"></i></a>
			<a onclick="$('#form').submit();" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-success"><i class="fa fa-save"></i></a>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
	 <div class="panel panel-default">
      <div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
	  </div>
	  <div class="panel-body">
      <form action="<?php echo $action;?>" method="post" enctype="multipart/form-data" id="form" name="form">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#tab_general"><?php echo $tab_general;?></a></li>
			<li><a data-toggle="tab" href="#tab_data"><?php echo $tab_data; ?></a></li>
			<li><a data-toggle="tab" href="#tab_results"><?php echo $tab_results; ?></a></li>					
		</ul>
		<div class="tab-content">			
			<div id="tab_general" class="tab-pane active">
				<table class="table table-striped table-bordered table-hover">
					<tr>
					  <td><label class="control-label"><?php echo $entry_color; ?></label></td>
					  <td><select class="form-control" name="color" data-selected="green"> 
			                  <option value="green">Green</option>	  
			                </select>
					  
					  <!--<select class="form-control" name="color" data-selected="<?php echo $color;?>">
					 <?php foreach ($setcolors as $value => $label) {	?>
						  <option value="<?php echo $value;?>"  <?php if ($color==$value) { ?> selected="selected" <?php } ?>><?php echo $label;?></option>	 
					<?php	 }   ?>
						</select>-->
					</td>
					</tr>
					</table>
					
					<ul id="general_language" class="nav nav-tabs">
						<?php foreach ($languages as $language) { ?>
						<li><a data-toggle="tab" href="#tab-general-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
						<?php } ?>
					</ul>
					
					<div class="tab-content">
					<?php foreach ($languages as $language) { ?>
					<div id="tab-general-<?php echo $language['language_id']; ?>" class="tab-pane">
						<table class="table table-striped table-bordered table-hover">
						  <tr>
							<td><span class="required">*</span> <?php echo $entry_question;?></td>
							<td><input class="form-control" name="poll_description[<?php echo $language['language_id'];?>][question]" value="<?php echo isset($poll_description[$language['language_id']]) ? $poll_description[$language['language_id']]['question'] : '';?>" size="60"/>
							  <?php if(isset($error_question[$language['language_id']])){?>
							  <span class="error"><?php echo $error_question[$language['language_id']];?></span>
							  <?php }?></td>
						  </tr>
						   <?php for($i = 1;$i <= 6;$i++){?>
						  <tr>
							<td><?php echo $entry_answer.'&nbsp;'.$i;?></td>
							<td><input class="form-control" name="poll_description[<?php echo $language['language_id'];?>][answer_<?php echo $i;?>]" value="<?php echo isset($poll_description[$language['language_id']]) ? $poll_description[$language['language_id']]['answer_'.$i] : '';?>" size="60"/>
							  <?php if(isset($errors_answer[$i][$language['language_id']])){?>
							  <span class="error"><?php echo $errors_answer[$i][$language['language_id']];?></span>
							  <?php }?></td>
						  </tr>
						<?php }?>
						</table>
				  </div>
				  <?php }?>
				</div>
			</div>
			<div id="tab_data" class="tab-pane">
				<table class="table table-striped table-bordered table-hover">
					<tr>
					  <td><?php echo $entry_store;?></td>
					  <td><div class="scrollbox">
						  <?php $class='even';?>
						  <div class="<?php echo $class;?>">
							<?php if(in_array(0,$poll_store)){?>
							<input class="form-control" type="checkbox" name="poll_store[]" value="0" checked="checked"/>
							<?php echo $text_default;?>
							<?php }else{?>
							<input class="form-control" type="checkbox" name="poll_store[]" value="0" checked="checked"/>
							<?php echo $text_default;?>
							<?php }?>
						  </div>
						  <?php foreach($stores as $store){?>
						  <?php $class = ($class=='even' ? 'odd' : 'even');?>
						  <div class="<?php echo $class;?>">
							<?php if(in_array($store['store_id'],$poll_store)){?>
							<input class="form-control" type="checkbox" name="poll_store[]" value="<?php echo $store['store_id'];?>" checked="checked"/>
							<?php echo $store['name'];?>
							<?php }else{?>
							<input class="form-control" type="checkbox" name="poll_store[]" value="<?php echo $store['store_id'];?>" checked="checked"/>
							<?php echo $store['name'];?>
							<?php }?>
						  </div>
						  <?php }?>
						</div></td>
					</tr>
				  </table>
			</div>
			<div id="tab_results" class="tab-pane">
				<?php if(isset($reactions)){?>
					<?php $labels=array();
				$values=array();?>
					<h2><?php echo $text_poll_results;?></h2>
					<h3><?php echo $poll_data['question'];?></h3>
					<table class="table table-striped table-bordered table-hover">
					  <thead>
						<tr>
						  <td width="10%"><?php echo $text_percent;?></td>
						  <td><?php echo $text_answer;?></td>
						</tr>
					  </thead>
					  <tbody>
						<?php $class='odd';?>
						<?php for($i = 0;
				$i < 15;
				$i++){?>
						  <?php if(!empty($poll_data['answer_' . ($i + 1)])){?>
							<?php $class =$class=='even' ? 'odd' : 'even';?>
							<?php array_push($labels,$poll_data['answer_' . ($i + 1)]);?>
							<?php array_push($values,$percent[$i]);?>
							<tr class="<?php echo $class;?>">
							  <td><strong><?php echo $percent[$i];?>%</strong></td>
							  <td><?php echo $poll_data['answer_' . ($i + 1)];?>  (<?php echo $vote[$i]?> )</td>
							</tr>
						  <?php }?>
						<?php }?>
					  </tbody>
					</table>
					<div style="text-align: center; margin-top: 10px;">
					  <?php $labels = implode('|',$labels);
				$values = implode(',',$values);?>
					  <img src="http://chart.apis.google.com/chart?cht=p3&chco=303F4A,E4EEF7,849721&chd=t:<?php echo $values;?>&chs=770x200&chl=<?php echo $labels;?>" width="770" height="200" alt="chart"/>
					</div>
				  <?php }else{?>
					<div style="text-align: center; margin-top: 10px;"><?php echo $text_no_votes;?></div>
				  <?php }?>
			</div>
		</div>
	   </form>
	   </div>
	 </div> 
	</div>

<script type="text/javascript"><!--
$('#general_language a:first').tab('show');
//--></script>
 


<?php echo $footer; ?></body></html>
