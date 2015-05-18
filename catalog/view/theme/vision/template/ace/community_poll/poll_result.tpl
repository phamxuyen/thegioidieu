    <?php if (isset($reactions)) { ?>
      <?php $labels = array(); $values = array(); ?>
      <div class="clearfix">
        <table width="100%" class="datasheet">
        <thead>
          <tr>
            <th align="left"><h5> <?php echo $text_percent; ?> - <?php echo $text_answer; ?></h5></td>
          </tr>
        </thead>
        <tbody>
          <?php for($i = 0; $i < 6; $i++) { ?>
            <?php if (!empty($poll_data['answer_' . ($i + 1)])) { ?>
              <?php array_push($labels, $poll_data['answer_' . ($i + 1)]); ?>
              <?php array_push($values, $percent[$i]); ?>
              <tr>
                <td>
              <p><?php echo $percent[$i]; ?>%  -  <?php echo $poll_data['answer_' . ($i + 1)]; ?>  (<?php echo $vote[$i]?> )</p>
                <div class="progress">
                    <div role="progressbar" class="progress-bar <?php echo $poll_data['color'];?>-bg" style="width: <?php echo $percent[$i];?>%;"></div> <span></span>
                    
                    </div></td>
              </tr>
            <?php } ?>
          <?php } ?>
        </tbody>
        <tfoot>
          <tr>
            <td><?php echo $text_total_votes;?> <?php echo $total_votes;?></td>
          </tr>
        </tfoot>
      </table>
      <div class="text-center">
        <?php $labels = implode('|', $labels); $values = implode(',', $values); ?>
        <img style="border: 1px solid #DDDDDD; text-align: center;" src="http://chart.apis.google.com/chart?cht=p3&chco=303F4A,E4EEF7,849721&chd=t:<?php echo $values; ?>&chs=750x350&chl=<?php echo $labels; ?>" class="img-responsive" alt="chart"/>
      </div>
    <?php } else { ?>
      <div style="text-align: center; margin-top: 10px; margin-bottom: 10px;"><?php echo $text_no_votes; ?></div>
    <?php } ?>
      </div>
