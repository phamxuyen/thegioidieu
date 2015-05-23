<div class="bt-newletter not-animated" data-animate="fadeInUp" data-delay="600">
<div class="footer-newletter">
	<div class="title"><h3><?php echo $title; ?></h3>
	<p><?php echo $sub_title; ?></p>
	</div>
	<div>
	<div class="newletter-content">
		<div id="frm_subscribe">
			<form name="subscribe" id="subscribe"   >
				<table>
				   <tr>
					 <td><div class="boss-newletter"><input class="form-control" size="50" class="input-new" type="text" placeholder="<?php echo $text_email; ?>" name="subscribe_email" id="subscribe_email"> <a class="btn_newletter" onclick="email_subscribe()">Gửi</a></div></td>
					</tr>
					<tr style="display:none;">
					 <td><input class="form-control" size="50" class="input-new" type="text" value="<?php echo $text_email; ?>" name="subscribe_name" id="subscribe_name"></td>
					</tr>
					<tr>		
					 <td id="subscribe_result"></td>
				   </tr>
				   <?php for($ns=1;$ns<=$option_fields;$ns++) {
					$ns_var= "option_fields".$ns; ?>
					<tr>
						<td><?php if($$ns_var!=""){
						 echo($$ns_var."&nbsp;<br/>");
						 echo('<input type="text" value="" name="option'.$ns.'" id="option'.$ns.'">');
						} ?></td>
				   </tr>
					<?php } ?>
					<?php if($option_unsubscribe) { ?>
					<tr>
						<td>
							<a class="btn_newletter" onclick="email_unsubscribe()"><i class="fa fa-chevron-right"></i></a>
						</td>
					</tr>
					<?php } ?>  
				</table>
			</form>
		</div>
	</div>
	</div>
<script type="text/javascript"><!--
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}
	}); 
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}
	}); 
}
//--></script>
</div>
</div>
