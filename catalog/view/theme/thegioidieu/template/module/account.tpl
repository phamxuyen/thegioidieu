<?php if ($logged) { ?>
<div class="bt-box bt-account">
<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
<div class="box-content">
<ul>
  <li><a href="<?php echo $account; ?>" class="list-group-item"><?php echo $text_account; ?></a></li>
  <li><a href="<?php echo $edit; ?>" class="list-group-item"><?php echo $text_edit; ?></a> </li>
  <li><a href="<?php echo $password; ?>" class="list-group-item"><?php echo $text_password; ?></a></li>
  
  <li><a href="<?php echo $address; ?>" class="list-group-item"><?php echo $text_address; ?></a></li>
  <li> <a href="<?php echo $wishlist; ?>" class="list-group-item"><?php echo $text_wishlist; ?></a></li>
  <li> <a href="<?php echo $order; ?>" class="list-group-item"><?php echo $text_order; ?></a></li>
  <li><a href="<?php echo $reward; ?>" class="list-group-item"><?php echo $text_reward; ?></a> </li>
  <li><a href="<?php echo $return; ?>" class="list-group-item"><?php echo $text_return; ?></a></li>
  <li> <a href="<?php echo $transaction; ?>" class="list-group-item"><?php echo $text_transaction; ?></a></li>
  <li> <a href="<?php echo $newsletter; ?>" class="list-group-item"><?php echo $text_newsletter; ?></a></li>
  <li><a href="<?php echo $logout; ?>" class="list-group-item"><?php echo $text_logout; ?></a></li>
  </ul>
</div>
</div>
<?php } ?>
