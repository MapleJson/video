<?php
if (IS_LOGGED == false) {
    $data = array('status' => 400, 'error' => 'Not logged in');
    echo json_encode($data);
    exit();
}


if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['tags']) || empty($_POST['video-id'])) {
    $error = $lang->please_check_details;
}

if (empty($error)) {
    $id = PT_Secure($_POST['video-id']);
    $video = $db->where('id', $id)->getOne(T_VIDEOS);
    $can_update = false;
    if (PT_IsAdmin() == false) {
    	if ($db->where('user_id', $user->id)->where('id', $id)->getValue(T_VIDEOS, 'count(*)') > 0) {
    		$can_update = true;
    	}
    } else {
    	$can_update = true;
    }
    if ($can_update == true && !empty($video)) {
    	$video = PT_GetVideoByID($video, 0, 0, 0);
    	$thumbnail = $video->org_thumbnail;
    	if (!empty($_FILES['thumbnail']['tmp_name'])) {
	        $file_info   = array(
	            'file' => $_FILES['thumbnail']['tmp_name'],
	            'size' => $_FILES['thumbnail']['size'],
	            'name' => $_FILES['thumbnail']['name'],
	            'type' => $_FILES['thumbnail']['type'],
	            'allowed' => 'jpg,png,jpeg,gif',
	            'crop' => array(
	                'width' => 1076,
	                'height' => 604
	            )
	        );
	        $file_upload = PT_ShareFile($file_info);
	        if (!empty($file_upload['filename'])) {
	            $thumbnail = PT_Secure($file_upload['filename']);
	        }
	    }
	    $category_id = 0;
	    if (!empty($_POST['category_id'])) {
	        if (in_array($_POST['category_id'], array_keys($categories))) {
	            $category_id = PT_Secure($_POST['category_id']);
	        }
	    }
	    $link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
	    $i          = 0;
	    preg_match_all($link_regex, PT_Secure($_POST['description']), $matches);
	    foreach ($matches[0] as $match) {
	        $match_url           = strip_tags($match);
	        $syntax              = '[a]' . urlencode($match_url) . '[/a]';
	        $_POST['description'] = str_replace($match, $syntax, $_POST['description']);
	    }
	    $featured = $video->featured;
	    if (isset($_POST['featured']) && PT_IsAdmin()) {
	    	$featured = PT_Secure($_POST['featured']);
	    }
	    $video_privacy = 0;
	    if (!empty($_POST['privacy'])) {
	        if (in_array($_POST['privacy'], array(0, 1, 2))) {
	            $video_privacy = PT_Secure($_POST['privacy']);
	        }
	    }
	    $age_restriction = 1;
        if (!empty($_POST['age_restriction'])) {
            if (in_array($_POST['age_restriction'], array(1, 2))) {
                $age_restriction = PT_Secure($_POST['age_restriction']);
            }
        }
	    $data_update = array(
	        'title' => PT_Secure($_POST['title']),
	        'description' => PT_Secure($_POST['description']),
	        'tags' => PT_Secure($_POST['tags']),
	        'category_id' => $category_id,
	        'featured' => $featured,
	        'thumbnail' => $thumbnail,
	        'privacy' => $video_privacy,
	        'age_restriction' => $age_restriction
	    );
	    $update  = $db->where('id', $id)->update(T_VIDEOS, $data_update);
	    if ($update) {
	        $data = array(
	            'status' => 200,
	            'message' => $success_icon . $lang->video_saved
	        );
	    }
    }
} else {
    $data = array(
        'status' => 400,
        'message' => $error_icon . $error
    );
}
?>