<?php 
if (IS_LOGGED == false || $pt->config->upload_system != 'on') {
	header("Location: " . PT_Link('login'));
	exit();
}
$content         = 'content';

if($pt->config->ffmpeg_system == 'on'){
	$content     = 'ffmpeg';
}

$max_videos_upload_limit_user_upload = $pt->config->videos_upload_limit;
if ($max_videos_upload_limit_user_upload > 0 && $pt->config->go_pro != "on") {
	$count_user_videos = $db->where('user_id', $user->id)->where('video_location', '', '<>')->getValue(T_VIDEOS, 'COUNT(*)');
	if ($count_user_videos > $max_videos_upload_limit_user_upload) {
		$content = "reached_limit";
	}
}

$max_user_upload = $pt->config->user_max_upload;
if ($pt->user->is_pro != 1 && $pt->config->go_pro == "on") {
	if ($pt->user->uploads >= $max_user_upload) {
		$content = "buy_pro";
	}
}

$pt->page        = 'upload-video';
$pt->title       = $lang->upload . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = $pt->config->keyword;
$pt->content     = PT_LoadPage("upload-video/$content");