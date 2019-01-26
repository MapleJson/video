<?php 

if (!IS_LOGGED || $pt->config->go_pro != 'on' || (PT_IsUpgraded() && empty($_SESSION['upgraded']))) {
	header('Location: ' . PT_Link('404'));
	exit;
}


$currency        = '$';

if ($pt->config->payment_currency == 'EUR') {
	$currency    = '€';
}

$pt->title       = $lang->go_pro . ' | ' . $pt->config->title;
$pt->page        = "go_pro";
$pt->description = $pt->config->description;
$pt->keyword     = @$pt->config->keyword;
$pt->content     = PT_LoadPage('go_pro/content', array('CURRENCY' => $currency,'SITE_NAME' => $pt->config->name));



