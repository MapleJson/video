<?php

if (empty($_GET['page'])) {
    header("Location: " . PT_Link('404'));
    exit();
}
$page         = PT_Secure($_GET['page']);
$limit        = 20;
$pt->rss_feed = false;
$pt->exp_feed = true;
$pages        = array(
    'trending',
    'category',
    'latest',
    'top'
);

if (!in_array($page, $pages)) {
    header("Location: " . PT_Link('404'));
    exit();
}

if (!empty($_GET['feed']) && $_GET['feed'] == 'rss') {
    $limit        = 50;
    $pt->rss_feed = true;

}

$cateogry_id = '';
$videos = array();
if ($page == 'trending') {
    $title  = $lang->trending;
    $db->where('privacy', 0);
    $videos = $db->where('time', time() - 172800, '>')->orderBy('views', 'DESC')->get(T_VIDEOS, $limit);
} 

else if ($page == 'latest') {
    $title  = $lang->latest_videos;
    $db->where('privacy', 0);
    $videos = $db->orderBy('id', 'DESC')->get(T_VIDEOS, $limit);
} 

else if ($page == 'top') {
    $title  = $lang->top_videos;
    $db->where('privacy', 0);
    $videos = $db->orderBy('views', 'DESC')->get(T_VIDEOS, $limit);
} 

else if ($page == 'category') {
    if (!empty($_GET['id'])) {
        if (in_array($_GET['id'], array_keys($categories))) {
            $cateogry = PT_Secure($_GET['id']);
            $title    = $categories[$cateogry];
            $cateogry_id = "data-category='$cateogry'";
            $db->where('privacy', 0);
            $videos   = $db->where('category_id', $cateogry)->orderBy('id', 'DESC')->get(T_VIDEOS, $limit);
        } else {
            header("Location: " . PT_Link('404'));
            exit();
        }
    }
}

use Bhaktaraz\RSSGenerator\Item;
use Bhaktaraz\RSSGenerator\Feed;
use Bhaktaraz\RSSGenerator\Channel;


//Export rss feed
if ($pt->rss_feed) {   
    $rss_feed_xml   = "";
    $fl_rss_feed    = new Feed();
    $fl_rss_channel = new Channel();


    $fl_rss_channel
        ->title($pt->config->title)
        ->description($pt->config->description)
        ->url($pt->config->site_url)
        ->appendTo($fl_rss_feed);

    if (is_array($videos)) {
        foreach ($videos as $feed_item_data) {
            $feed_item_data = PT_GetVideoByID($feed_item_data, 0, 0, 0);
            $fl_rss_item    = new Item();
            $fl_rss_item
             ->title($feed_item_data->title)
             ->description($feed_item_data->markup_description)
             ->url($feed_item_data->url)
             ->pubDate($feed_item_data->time)
             ->guid($feed_item_data->url,true)
             ->media(array(
                'attr'  => 'url',
                'ns'    => 'thumbnail',
                'link'  => PT_GetMedia($feed_item_data->org_thumbnail)))
             ->appendTo($fl_rss_channel);
        }
    }

    header('Content-type: text/rss+xml');
    echo($fl_rss_feed);
    exit();
}


$html_videos = '';
if (!empty($videos)) {
    foreach ($videos as $key => $video) {
    	$video = PT_GetVideoByID($video, 0, 0, 0);
        $html_videos .= PT_LoadPage('videos/list', array(
            'ID' => $video->id,
            'VID_ID' => $video->id,
	        'TITLE' => $video->title,
	        'VIEWS' => $video->views,
            'VIEWS_NUM' => number_format($video->views),
	        'USER_DATA' => $video->owner,
	        'THUMBNAIL' => $video->thumbnail,
	        'URL' => $video->url,
	        'TIME' => $video->time_ago,
            'DURATION' => $video->duration
        ));
    }
}

if (empty($videos)) {
	$html_videos = '<div class="text-center no-content-found empty_state"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video-off"><path d="M16 16v1a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2h2m5.66 0H14a2 2 0 0 1 2 2v3.34l1 1L23 7v10"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>' . $lang->no_videos_found_for_now . '</div>';
}
$pt->videos_count= count($videos);
$pt->page        = $page;
$pt->title       = $title . ' | ' . $pt->config->title;
$pt->description = $pt->config->description;
$pt->keyword     = @$pt->config->keyword;
$pt->content     = PT_LoadPage('videos/content', array(
    'TITLE' => $title,
    'VIDEOS' => $html_videos,
    'TYPE' => $page,
    'CATEGORY_ID' => $cateogry_id
));
