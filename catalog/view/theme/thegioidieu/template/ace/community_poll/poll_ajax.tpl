<?php if($poll_data){?>
  <h4 class="block"><?php echo $poll_data['question'];?></h4>
  <?php if(isset($reactions)){?>
 <div class="front-skills">
   <?php for ($i=0;$i < 6;$i++){?>
    <?php if(!empty($poll_data['answer_'.($i + 1)])){?>
   
    <p><?php echo $percent[$i];?>% - <?php echo $poll_data['answer_'.($i + 1)];?>   (<?php echo $vote[$i]?> )</p>
    <div class="progress">
        <div role="progressbar" class="progress-bar <?php echo $poll_data['color'];?>-bg" style="width: <?php echo $percent[$i];?>%;"></div>
    </div>
    <?php }?>
   <?php }?>
   
   <div class="clearfix">
   <?php echo $text_total_votes;?> <?php echo $total_votes;?>
   </div>
  <?php if($total_votes>0){?> 
   <div class="buttons">
   <div class="right">
   <a href="<?php echo $poll_results;?>"  class="vsmodalbox btn btn-xs crimson" data-type="html" data-title="<?php echo $poll_data['question'];?>"><?php echo $text_poll_results;?></a>
   </div>
   </div>
   <?php }?>
   
   </div>
  <?php }
		else{?>
   <div style="text-align: center;"><?php echo $text_no_votes;?></div>
  <?php }?>
<?php }?>