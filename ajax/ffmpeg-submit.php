<?php
if (IS_LOGGED == false || $pt->config->upload_system != 'on') {
    $data = array(
        'status' => 400,
        'error' => 'Not logged in'
    );
    echo json_encode($data);
    exit();
} else if ($pt->config->ffmpeg_system != 'on') {
    $data = array(
        'status' => 402
    );
    echo json_encode($data);
    exit();
} else {
    $getID3    = new getID3;
    $featured  = ($user->is_pro == 1) ? 1 : 0;
    $filesize  = 0;
    $error     = false;
    $request   = array();
    $request[] = (empty($_POST['title']) || empty($_POST['description']));
    $request[] = (empty($_POST['tags']) || empty($_POST['video-thumnail']));
    if (in_array(true, $request)) {
        $error = $lang->please_check_details;
    } else if (empty($_POST['video-location'])) {
        $error = $lang->video_not_found_please_try_again;
    } else {
        $request   = array();
        $request[] = (!in_array($_POST['video-location'], $_SESSION['uploads']['videos']));
        $request[] = (!in_array($_POST['video-thumnail'], $_SESSION['ffempg_uploads']));
        $request[] = (!file_exists($_POST['video-location']));
        if (in_array(true, $request)) {
            $error = $lang->error_msg;
        }
    }
    if (empty($error)) {
        $file     = $getID3->analyze($_POST['video-location']);
        $duration = '00:00';
        if (!empty($file['playtime_string'])) {
            $duration = PT_Secure($file['playtime_string']);
        }
        if (!empty($file['filesize'])) {
            $filesize = $file['filesize'];
        }
        $video_res = (!empty($file['video']['resolution_x'])) ? $file['video']['resolution_x'] : 0;
        $video_id        = PT_GenerateKey(15, 15);
        $check_for_video = $db->where('video_id', $video_id)->getValue(T_VIDEOS, 'count(*)');
        if ($check_for_video > 0) {
            $video_id = PT_GenerateKey(15, 15);
        }
        $thumbnail = PT_Secure($_POST['video-thumnail'], 0);
        if (file_exists($thumbnail)) {
            $upload = PT_UploadToS3($thumbnail);
        }
        $category_id = 0;
        $convert     = true;
        $thumbnail   = substr($thumbnail, strpos($thumbnail, "upload"), 120);
        if (!empty($_POST['category_id'])) {
            if (in_array($_POST['category_id'], array_keys($categories))) {
                $category_id = PT_Secure($_POST['category_id']);
            }
        }
        $link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
        $i          = 0;
        preg_match_all($link_regex, PT_Secure($_POST['description']), $matches);
        foreach ($matches[0] as $match) {
            $match_url            = strip_tags($match);
            $syntax               = '[a]' . urlencode($match_url) . '[/a]';
            $_POST['description'] = str_replace($match, $syntax, $_POST['description']);
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
        $data_insert = array(
            'video_id' => $video_id,
            'user_id' => $user->id,
            'title' => PT_Secure($_POST['title']),
            'description' => PT_Secure($_POST['description']),
            'tags' => PT_Secure($_POST['tags']),
            'duration' => $duration,
            'video_location' => '',
            'category_id' => $category_id,
            'thumbnail' => $thumbnail,
            'time' => time(),
            'registered' => date('Y') . '/' . intval(date('m')),
            'featured' => $featured,
            'converted' => '2',
            'size' => $filesize,
            'privacy' => $video_privacy,
            'age_restriction' => $age_restriction
        );
        if ($pt->config->approve_videos == 'on' && !PT_IsAdmin()) {
            $data_insert['approved'] = 0;
        }
        $insert      = $db->insert(T_VIDEOS, $data_insert);
        if ($insert) {
            $delete_files = array();
            if (!empty($_SESSION['ffempg_uploads'])) {
                if (is_array($_SESSION['ffempg_uploads'])) {
                    foreach ($_SESSION['ffempg_uploads'] as $key => $file) {
                        if ($thumbnail != $file) {
                            $delete_files[] = $file;
                            unset($_SESSION['ffempg_uploads'][$key]);
                        }
                    }
                }
            }
            if (!empty($delete_files)) {
                foreach ($delete_files as $key => $file2) {
                    unlink($file2);
                }
            }
            if (isset($_SESSION['ffempg_uploads'])) {
                unset($_SESSION['ffempg_uploads']);
            }
            $data = array(
                'status' => 200,
                'video_id' => $video_id,
                'link' => PT_Link("watch/$video_id")
            );
            ob_end_clean();
            header("Content-Encoding: none");
            header("Connection: close");
            ignore_user_abort();
            ob_start();
            header('Content-Type: application/json');
            echo json_encode($data);
            $size = ob_get_length();
            header("Content-Length: $size");
            ob_end_flush();
            flush();
            session_write_close();
            if (is_callable('fastcgi_finish_request')) {
                fastcgi_finish_request();
            }
            $ffmpeg_b                   = $pt->config->ffmpeg_binary_file;
            $filepath                   = explode('.', $_POST['video-location'])[0];
            $time                       = time();
            $full_dir                   = str_replace('ajax', '/', __DIR__);

            $video_output_full_path_240 = $full_dir . $filepath . "_240p_converted.mp4";
            $video_output_full_path_360 = $full_dir . $filepath . "_360p_converted.mp4";
            $video_output_full_path_480 = $full_dir . $filepath . "_480p_converted.mp4";
            $video_output_full_path_720 = $full_dir . $filepath . "_720p_converted.mp4";
            $video_output_full_path_1080 = $full_dir . $filepath . "_1080p_converted.mp4";
            $video_output_full_path_2048 = $full_dir . $filepath . "_2048p_converted.mp4";
            $video_output_full_path_4096 = $full_dir . $filepath . "_4096p_converted.mp4";

            $video_file_full_path       = $full_dir . $_POST['video-location'];

            $shell     = shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=426:-2 -crf 26 $video_output_full_path_240 2>&1");
            $upload_s3 = PT_UploadToS3($filepath . "_240p_converted.mp4");
            $db->where('id', $insert);
            $db->update(T_VIDEOS, array(
                'converted' => 1,
                '240p' => 1,
                'video_location' => $filepath . "_240p_converted.mp4"
            ));

            if ($video_res >= 640 || $video_res == 0) {
                $shell                      = shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=640:-2 -crf 26 $video_output_full_path_360 2>&1");
                $upload_s3                  = PT_UploadToS3($filepath . "_360p_converted.mp4");
                $db->where('id', $insert);
                $db->update(T_VIDEOS, array( 
                    '360p' => 1,
                ));
            }

            if ($video_res >= 854 || $video_res == 0) {
                $shell     = shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=854:-2 -crf 26 $video_output_full_path_480 2>&1");
                $upload_s3 = PT_UploadToS3($filepath . "_480p_converted.mp4");
                $db->where('id', $insert);
                $db->update(T_VIDEOS, array(
                    '480p' => 1
                ));
            }

            if ($video_res >= 1280 || $video_res == 0) {
                $shell     = shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=1280:-2 -crf 26 $video_output_full_path_720 2>&1");
                $upload_s3 = PT_UploadToS3($filepath . "_720p_converted.mp4");
                $db->where('id', $insert);
                $db->update(T_VIDEOS, array(
                    '720p' => 1
                ));
            }

            if ($video_res >= 1920 || $video_res == 0) {
                $shell     = shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=1920:-2 -crf 26 $video_output_full_path_1080 2>&1");
                $upload_s3 = PT_UploadToS3($filepath . "_1080p_converted.mp4");
                $db->where('id', $insert);
                $db->update(T_VIDEOS, array(
                    '1080p' => 1
                ));
            }

            if ($video_res >= 2048) {
                $shell     = shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=2048:-2 -crf 26 $video_output_full_path_2048 2>&1");
                $upload_s3 = PT_UploadToS3($filepath . "_2048p_converted.mp4");
                $db->where('id', $insert);
                $db->update(T_VIDEOS, array(
                    '2048p' => 1
                ));
            }

            if ($video_res >= 3840) {
                $shell     = shell_exec("$ffmpeg_b -y -i $video_file_full_path -vcodec libx264 -preset {$pt->config->convert_speed} -filter:v scale=3840:-2 -crf 26 $video_output_full_path_4096 2>&1");
                $upload_s3 = PT_UploadToS3($filepath . "_4096p_converted.mp4");
                $db->where('id', $insert);
                $db->update(T_VIDEOS, array(
                    '4096p' => 1
                ));
            }


            if (file_exists($_POST['video-location'])) {
                unlink($_POST['video-location']);
            }

            
            pt_push_channel_notifiations($video_id);
            $_SESSION['uploads'] = array();
            exit();
        }
    } else {
        $data = array(
            'status' => 400,
            'message' => $error_icon . $error
        );
    }
}

