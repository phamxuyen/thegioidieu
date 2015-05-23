<!--Poll module start--> 
<div class="bt-box bt-poll">
  <?php if($display_title){?><div class="box-heading"><?php echo $heading_title; ?></div><?php } ?>
 <div class="box-content" id="ace-poll<?php echo $id;?>">
 <div class="page-item">
 <?php if($poll_data){?>
  <h4 class="block"><?php echo $poll_data['question'];?></h4>
  <?php if(isset($answered)||isset($disabled)){?>
  
  <?php if(isset($reactions)){?>
 <div class="front-skills">
   <?php for ($i=0;$i < 6; $i++){?>
    <?php if(!empty($poll_data['answer_'.($i + 1)])){?>
   
     <span>  <?php echo $percent[$i];?>% - <?php echo $poll_data['answer_'.($i + 1)];?>   (<?php echo $vote[$i]?> )</span>
     <div class="progress">
         <div role="progressbar" class="progress-bar <?php echo $poll_data['color'];?>-bg" style="width:<?php echo $percent[$i];?>%;"></div>
     </div>
    <?php }?>
   <?php }?>
   
   <div class="clearfix">
   <?php echo $text_total_votes;?> <strong class="badge green-bg"><?php echo $total_votes;?></strong>
   </div>
  <?php if($total_votes>0){?> 
   <div class="buttons">
       <div class="right">
       <a href="<?php echo $poll_results;?>"  class="vsmodalbox btn btn-xs" data-type="html" data-title="<?php echo $poll_data['question'];?>"><?php echo $text_poll_results;?></a>
       </div>
   </div>
   <?php }?>
   
   </div>
  <?php }
		else{?>
   <div class="text-center"><?php echo $text_no_votes;?></div>
  <?php }?>
  <?php }
		else{?>        
        <!--else !isset($answered --> 
 <div class="radio-list" id="vote-poll<?php echo $id;?>">
   <?php for ($i=0;$i < 15; $i++){?>
    <?php if(!empty($poll_data['answer_'.($i + 1)])){?>
    <label for="answer<?php echo $i + 1;?>">
        <input type="radio" name="poll_answer" value="<?php echo $i + 1;?>" id="answer<?php echo $i + 1;?>"> <?php echo $poll_data['answer_'.($i + 1)];?>
     </label>
    <?php }?>
   <?php }?>
   <input type="hidden" name="poll_id" value="<?php echo $poll_id;?>"/>
</div><!--vote-poll --> 
   
   <div class="buttons">
       <div class="left">
		<a id="button-vote<?php echo $id;?>" class="btn btn-xs"><span><?php echo $text_vote;?></span></a>
		</div>
  <?php if($total_votes>0){?> 
       <div class="right"><a href="<?php echo $poll_results;?>"  class="vsmodalbox btn btn-xs" data-type="html" data-title="<?php echo $poll_data['question'];?>"><?php echo $text_poll_results;?></a>
      </div>
   <?php }?>
	</div>

<div style="display:none">
  <script type="text/javascript"><!--
$('#button-vote<?php echo $id;?>').bind('click', function() {
			$('.alert.alert-warning').remove();
if($('input[name=\'poll_answer\']').is(':checked')!==false){
	$.ajax({
		url: 'index.php?route=module/ace_community_poll/answer',
		type: 'post',
		dataType: 'json',
			data: $('#vote-poll<?php echo $id;?> input[type=\'text\'], #vote-poll<?php echo $id;?> input[type=\'radio\']:checked, #vote-poll<?php echo $id;?> input[type=\'hidden\']'),
		beforeSend: function() {
			$('#button-vote<?php echo $id;?>').attr('disabled', true);
		},
		complete: function() {
			$('#button-vote<?php echo $id;?>').attr('disabled', false);
		},
		success: function(data) {
			$('#ace-poll<?php echo $id;?>').load('index.php?route=module/ace_community_poll/result&poll_id=<?php echo $poll_id;?>');
		}
	});
	}else{
		$('#vote-poll<?php echo $id;?>').after('<div class="alert alert-warning"><?php echo $text_please_select_poll;?></div>');
	}
});
//--></script> 
</div>
  <?php }?>
 <?php }
		else{?>
        <!--else no $poll_data--> 
  <div style="text-align: center;"><?php echo $text_no_poll;?></div>
 <?php }?>
  </div><!--page_item --> 
 </div>
</div>
<!--End poll module --> 