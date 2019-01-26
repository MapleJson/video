-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-08-20 04:21:26
-- 服务器版本： 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sp`
--

-- --------------------------------------------------------

--
-- 表的结构 `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `text` text,
  `time` int(32) NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `announcement_views`
--

CREATE TABLE `announcement_views` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `announcement_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `banned`
--

CREATE TABLE `banned` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(100) DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `text` text COLLATE utf8_unicode_ci,
  `time` int(11) NOT NULL DEFAULT '0',
  `pinned` enum('0','1') CHARACTER SET utf8 DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `dis_likes` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `comments_likes`
--

CREATE TABLE `comments_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `reply_id` int(30) NOT NULL DEFAULT '0',
  `video_id` int(15) NOT NULL DEFAULT '0',
  `post_id` int(15) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `comm_replies`
--

CREATE TABLE `comm_replies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(15) NOT NULL DEFAULT '0',
  `video_id` int(15) NOT NULL DEFAULT '0',
  `post_id` int(15) NOT NULL DEFAULT '0',
  `text` text,
  `time` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`id`, `name`, `value`) VALUES
(1, 'theme', 'youplay'),
(2, 'censored_words', ''),
(3, 'title', '柠檬视频--发现美好世界'),
(4, 'name', '松果商城'),
(5, 'keyword', '视频,松果视频'),
(6, 'email', '18581281315@163.com'),
(7, 'description', '视频服务平台,提供视频播放,视频发布,视频搜索,视频分享... 客户端 移动APP PC客户端 小小优酷 优酷VR 来疯APP 搜库 VIP 订阅 记录 登录 同步各端记录 上传 ...'),
(8, 'validation', 'off'),
(9, 'recaptcha', 'off'),
(10, 'recaptcha_key', ''),
(11, 'language', 'china'),
(12, 'google_app_ID', ''),
(13, 'google_app_key', ''),
(14, 'facebook_app_ID', ''),
(15, 'facebook_app_key', ''),
(16, 'twitter_app_ID', ''),
(17, 'twitter_app_key', ''),
(18, 'yt_api', 'AIzaSyBTwxpmr5EraHyEolTDPiSx7axFS-0CE5s'),
(19, 'seo_link', 'on'),
(20, 'comment_system', 'default'),
(21, 'smtp_or_mail', 'mail'),
(22, 'smtp_host', ''),
(23, 'smtp_username', ''),
(24, 'smtp_password', ''),
(25, 'smtp_encryption', 'TLS'),
(26, 'smtp_port', ''),
(27, 'delete_account', 'on'),
(28, 'total_videos', '7'),
(29, 'total_views', '3'),
(30, 'total_users', '1'),
(31, 'total_subs', '0'),
(32, 'total_comments', '0'),
(33, 'total_likes', '1'),
(34, 'total_dislikes', '0'),
(35, 'total_saved', '0'),
(36, 'last_admin_collection', '1534731336'),
(37, 'user_statics', '[{&quot;month&quot;:&quot;January&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;March&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;April&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;May&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;September&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_users&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_users&quot;:0}]'),
(38, 'videos_statics', '[{&quot;month&quot;:&quot;January&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;February&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;March&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;April&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;May&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;June&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;July&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;August&quot;,&quot;new_videos&quot;:7},{&quot;month&quot;:&quot;September&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;October&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;November&quot;,&quot;new_videos&quot;:0},{&quot;month&quot;:&quot;December&quot;,&quot;new_videos&quot;:0}]'),
(39, 'upload_system', 'on'),
(40, 'import_system', 'on'),
(41, 'resize_video', 'on'),
(42, 'autoplay_system', 'on'),
(43, 'embed_system', 'on'),
(44, 'history_system', 'on'),
(45, 'user_registration', 'on'),
(46, 'verification_badge', 'on'),
(47, 'comments_default_num', '40'),
(48, 'vimeo_api_key', ''),
(49, 'fb_login', 'off'),
(50, 'tw_login', 'off'),
(51, 'plus_login', 'off'),
(52, 'wowonder_app_ID', ''),
(53, 'wowonder_app_key', ''),
(54, 'wowonder_domain_uri', ''),
(55, 'wowonder_site_name', ''),
(56, 'wowonder_login', 'off'),
(57, 'wowonder_img', ''),
(58, 'google', ''),
(59, 'last_created_sitemap', '00-00-0000'),
(60, 'is_ok', '1'),
(61, 'pro_pkg_price', '10'),
(62, 'payment_currency', 'USD'),
(63, 'go_pro', 'off'),
(64, 'paypal_id', ''),
(65, 'paypal_secret', ''),
(66, 'paypal_mode', 'sandbox'),
(67, 'last_backup', '00-00-0000'),
(68, 'user_ads', 'off'),
(69, 'rss_export', 'on'),
(70, 'max_upload', '1000000000'),
(71, 's3_upload', 'off'),
(72, 's3_bucket_name', ''),
(73, 'amazone_s3_key', ''),
(74, 'amazone_s3_s_key', ''),
(75, 'region', 'us-east-1'),
(76, 'ad_v_price', '0.1'),
(77, 'ad_c_price', '0.5'),
(78, 'pub_price', '0.02'),
(79, 'usr_v_mon', 'off'),
(80, 'apps_api_id', '940dd0afb6746ffae8193f15093ab4b0'),
(81, 'apps_api_key', 'e17e0e5a24e9c5e6cc61617a54d3b12c'),
(82, 'ffmpeg_system', 'off'),
(83, 'ffmpeg_binary_file', './assets/import/ffmpeg/ffmpeg'),
(84, 'user_max_upload', '1000000000'),
(85, 'user_max_import', '100'),
(86, 'convert_speed', 'fast'),
(87, 'night_mode', 'both'),
(88, 'server', 'ajax'),
(89, 'article_system', 'on'),
(90, 'ftp_host', 'localhost'),
(91, 'ftp_port', '21'),
(92, 'ftp_username', ''),
(93, 'ftp_password', ''),
(94, 'ftp_upload', 'off'),
(95, 'ftp_endpoint', 'storage.wowonder.com'),
(96, 'ftp_path', './'),
(97, 'watermark', '/themes/youplay/img/video.png'),
(98, 'download_videos', 'off'),
(99, 'facebook_import', 'on'),
(100, 'donate_system', 'off'),
(101, 'approve_videos', 'off'),
(102, 'videos_upload_limit', '0');

-- --------------------------------------------------------

--
-- 表的结构 `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT '0',
  `user_two` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `history`
--

INSERT INTO `history` (`id`, `user_id`, `video_id`, `time`) VALUES
(4, 1, 11, 1534688693),
(5, 1, 12, 1534688923),
(6, 1, 13, 1534689216),
(7, 1, 14, 1534689452),
(8, 1, 15, 1534689709),
(9, 1, 16, 1534689956),
(10, 1, 17, 1534690185);

-- --------------------------------------------------------

--
-- 表的结构 `langs`
--

CREATE TABLE `langs` (
  `id` int(11) NOT NULL,
  `lang_key` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `english` text,
  `arabic` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dutch` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `french` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `german` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `russian` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `spanish` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `turkish` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `china` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `langs`
--

INSERT INTO `langs` (`id`, `lang_key`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`, `china`) VALUES
(1, 'login', 'Login', 'تسجيل الدخول', 'Log in', 'S\'identifier', 'Anmeldung', 'Авторизоваться', 'Iniciar sesión', 'Oturum aç', '登陆'),
(2, 'search_keyword', 'Search for videos', 'البحث عن مقاطع الفيديو', 'Zoek naar video\'s', 'Rechercher des vidéos', 'Suche nach Videos', 'Поиск видео', 'Buscar videos', 'Videoları arayın', '搜索视频'),
(3, 'register', 'Register', 'تسجيل', 'Registreren', 'registre', 'Neu registrieren', 'регистр', 'Registro', 'Kayıt olmak', '注册'),
(4, 'invalid_request', 'Invalid request', 'طلب غير صالح', 'Ongeldig verzoek', 'Requête invalide', 'Ungültige Anfrage', 'Неверный запрос', 'Solicitud no válida', 'Geçersiz istek', '无效请求'),
(5, 'please_check_details', 'Please check the details', 'يرجى التحقق من التفاصيل', 'Controleer de details', 'Vérifiez les détails', 'Bitte überprüfen Sie die Details', 'Пожалуйста, проверьте детали', 'Por favor verifique los detalles', 'Lütfen ayrıntıları kontrol edin', '请你检查细节'),
(6, 'email_sent', 'E-mail sent successfully', 'تم إرسال البريد الإلكتروني بنجاح', 'E-mail is succesvol verzonden', 'E-mail envoyé avec succès', 'Email wurde erfolgreich Versendet', 'Письмо успешно отправлено', 'E-mail enviado correctamente', 'E-posta başarıyla gönderildi', '电子邮件发送成功'),
(7, 'email_not_exist', 'E-mail not exist', 'البريد الإلكتروني غير موجود', 'E-mail bestaat niet', 'E-mail n\'existe pas', 'E-Mail existiert nicht', 'Электронная почта не существует', 'E-mail no existe', 'E-posta yok', '电子邮件不存在'),
(8, 'reset_password', 'Reset Password', 'إعادة تعيين كلمة المرور', 'Wachtwoord opnieuw instellen', 'réinitialiser le mot de passe', 'Passwort zurücksetzen', 'Сброс пароля', 'Restablecer la contraseña', 'Şifreyi yenile', '重置密码'),
(9, 'account_is_not_active', 'Your account is not active yet, please confirm your E-mail.', 'حسابك غير نشط حتى الآن، يرجى تأكيد بريدك الإلكتروني.', 'Uw account is nog niet actief, bevestig alstublieft uw e-mail.', 'Votre compte n\'est pas encore actif, confirmez votre e-mail.', 'Ihr Konto ist noch nicht aktiv, bitte bestätigen Sie Ihre E-Mail.', 'Ваша учетная запись еще не активирована, пожалуйста, подтвердите свой E-mail.', 'Su cuenta aún no está activa, por favor confirme su E-mail.', 'Hesabınız henüz aktif değil, lütfen e-postanızı onaylayın.', '你的账号还没有激活，请检查电子邮件.'),
(10, 'resend_email', 'Resend E-mail', 'إعادة إرسال البريد الإلكتروني', 'Email opnieuw verzenden', 'Ré-envoyer l\'email', 'E-Mail zurücksenden', 'Повторно отправить E-mail', 'Reenviar email', 'Elektronik postayı tekrar gönder', '重新发送电子邮件'),
(11, 'invalid_username_or_password', 'Invalid username or password', 'خطأ في اسم المستخدم أو كلمة مرور', 'ongeldige gebruikersnaam of wachtwoord', 'Nom d\'utilisateur ou mot de passe invalide', 'ungültiger Benutzername oder Passwort', 'неправильное имя пользователя или пароль', 'usuario o contraseña invalido', 'Geçersiz kullanıcı adı veya şifre', '无效的用户名或密码'),
(12, 'gender', 'Gender', 'جنس', 'Geslacht', 'Le genre', 'Geschlecht', 'Пол', 'Género', 'Cinsiyet', '性别'),
(13, 'gender_is_invalid', 'Gender is invalid', 'الجنس غير صالح', 'Geslacht is ongeldig', 'Le sexe n\'est pas valable', 'Geschlecht ist ungültig', 'Пол недействителен', 'Género no válido', 'Cinsiyet geçersiz', '性别无效'),
(14, 'country', 'Country', 'بلد', 'land', 'Pays', 'Land', 'Страна', 'País', 'ülke', '国家'),
(15, 'username_is_taken', 'Username is taken', 'اسم المستخدم ماخوذ', 'Gebruikersnaam is in gebruik', 'Le nom d\'utilisateur est pris', 'Benutzername ist vergeben', 'Имя пользователя', 'El nombre de usuario se ha tomado', 'kullanıcı adı alınmış', '用户名已存在'),
(16, 'username_characters_length', 'Username must be between 5 / 32', 'يجب أن يكون اسم المستخدم بين 5/32', 'Gebruikersnaam moet tussen 5/32 zijn', 'Le nom d\'utilisateur doit être compris entre 5/32', 'Benutzername muss zwischen 5/32 liegen', 'Имя пользователя должно быть от 5/32', 'El nombre de usuario debe estar entre 5/32', 'Kullanıcı adı 5/32 arasında olmalıdır', '用户名字符必须在5 / 32'),
(17, 'username_invalid_characters', 'Invalid username characters', 'أحرف اسم المستخدم غير صالحة', 'Ongeldige gebruikersnaam karakters', 'Caractères d\'identifiant non valides', 'Ungültige Benutzernamen', 'Неверные символы имени пользователя', 'Caracteres de usuario no válidos', 'Geçersiz kullanıcı adı karakterleri', '无效的用户名字符'),
(18, 'email_exists', 'This e-mail is already in use', 'هذا البريد استخدم من قبل', 'Deze email is al in gebruik', 'Cet e-mail est déjà utilisée', 'Diese E-Mail-Adresse wird schon verwendet', 'Этот электронный адрес уже используется', 'Este correo electrónico ya está en uso', 'Bu e-posta zaten kullanılıyor', '电子邮件已经存在'),
(19, 'email_invalid_characters', 'E-mail is invalid', 'البريد الإلكتروني غير صالح', 'Email is ongeldig', 'Le courriel est invalide', 'E-Mail ist ungültig', 'Недействительный адрес электронной почты', 'El correo electrónico es invalido', 'E-posta geçersiz', '电子邮件无效'),
(20, 'password_not_match', 'Password not match', 'كلمة المرور غير متطابقة', 'Wachtwoord niet overeenkomen', 'Le mot de passe ne correspond pas', 'Passwort nicht übereinstimmen', 'Пароль не соответствует', 'La contraseña no coincide', 'Şifre eşleşmiyor', '密码不匹配'),
(21, 'password_is_short', 'Password is too short', 'كلمة المرور قصيرة جدا', 'Wachtwoord is te kort', 'Le mot de passe est trop court', 'Das Passwort ist zu kurz', 'Пароль слишком короткий', 'La contraseña es demasiado corta', 'Şifre çok kısa', '密码太短'),
(22, 'reCaptcha_error', 'Please Check the re-captcha.', 'يرجى التحقق من إعادة كابتشا.', 'Controleer alstublieft de re-captcha.', 'Vérifiez le re-captcha.', 'Bitte überprüfen Sie das Re-Captcha.', 'Проверьте перехват.', 'Por favor, compruebe la re-captcha.', 'Lütfen yeniden captcha\'yı kontrol edin.', '请检查验证码'),
(23, 'successfully_joined_desc', 'Registration successful! We have sent you an email, Please check your inbox/spam to verify your account.', 'التسجيل بنجاح! لقد أرسلنا إليك رسالة إلكترونية، يرجى التحقق من البريد الوارد / الرسائل غير المرغوب فيها للتحقق من حسابك.', 'Registratie gelukt! Wij hebben u een email gestuurd, Controleer uw inbox / spam om uw account te verifiëren.', 'Inscription réussi! Nous vous avons envoyé un courriel, vérifiez votre boîte de réception / spam pour vérifier votre compte.', 'Registrierung erfolgreich! Wir haben Ihnen eine E-Mail geschickt, bitte überprüfen Sie Ihren Posteingang / Spam, um Ihr Konto zu bestätigen.', 'Регистрация прошла успешно! Мы отправили вам электронное письмо. Пожалуйста, проверьте свой почтовый ящик / спам, чтобы подтвердить свою учетную запись.', '¡Registro exitoso! Te hemos enviado un correo electrónico, verifica tu bandeja de entrada / spam para verificar tu cuenta.', 'Kayıt başarılı! Size bir e-posta gönderdik. Hesabınızı doğrulamak için lütfen gelen kutunuzu / spam\'inizi kontrol edin.', '注册成功！ 我们已向您发送电子邮件，请检查您的收件箱或垃圾邮件以验证您的帐户'),
(24, 'change_password', 'Change Password', 'تغيير كلمة السر', 'Verander wachtwoord', 'Changer le mot de passe', 'Passwort ändern', 'Изменить пароль', 'Cambia la contraseña', 'Şifre değiştir', '修改密码'),
(25, '404_desc', 'The page you were looking for doesn\'t exist.', 'الصفحة التي كنت تبحث عنها غير موجودة.', 'De pagina die u zocht, bestaat niet.', 'La page que vous recherchiez n\'existe pas.', 'Die Seite, die Sie gesucht haben, existiert nicht.', 'Страница, которую вы искали, не существует.', 'La página que buscabas no existe.', 'Aradığınız sayfa mevcut değil.', '404错误'),
(26, '404_title', '404, page not found', '404، لم يتم العثور على الصفحة', '404 pagina niet gevonden', '404 Page non trouvée', '404 Seite nicht gefunden', '404 Страница не найдена', '404 Pagina no encontrada', '404 Sayfa Bulunamadı', '404, 页面错误'),
(27, 'your_email_address', 'Your E-mail address', 'عنوان بريدك  الإلكتروني', 'Jouw e-mailadres', 'Votre adresse email', 'Deine Emailadresse', 'Ваш адрес электронной почты', 'Tu correo electrónico', 'E', '你的电子邮件地址'),
(28, 'request_new_password', 'Request new password', 'طلب كلمة مرور جديدة', 'Vraag nieuw wachtwoord aan', 'Demander un nouveau mot de passe', 'Fordere ein neues Passwort an', 'Запросить новый пароль', 'Pide nueva contraseña', 'yeni şifre isteği', '找回密码'),
(29, 'got_your_password', 'Got your password?', 'هل حصلت على كلمة المرور؟', 'Heb je je wachtwoord ontvangen?', 'Vous avez votre mot de passe?', 'Haben Sie Ihr Passwort?', 'Получил пароль?', '¿Tienes tu contraseña?', 'Şifreniz var mı?', '忘记你密码?'),
(30, 'login_', 'Log In', 'تسجيل الدخول', 'Log in', 'S\'identifier', 'Einloggen', 'Авторизоваться', 'Iniciar sesión', 'Oturum aç', '登陆'),
(31, 'please_wait', 'Please wait..', 'أرجو الإنتظار..', 'Even geduld aub..', 'S\'il vous plaît, attendez..', 'Warten Sie mal..', 'Пожалуйста, подождите..', 'Por favor espera..', 'Lütfen bekle..', '请稍后...'),
(32, 'welcome_back', 'Welcome back!', 'مرحبا بعودتك!', 'Welkom terug!', 'Nous saluons le retour!', 'Willkommen zurück!', 'Добро пожаловать!', '¡Dar una buena acogida!', 'Tekrar hoşgeldiniz!', '欢迎您回来!'),
(33, 'username', 'Username', 'اسم المستخدم', 'Gebruikersnaam', 'Nom d\'utilisateur', 'Benutzername', 'имя пользователя', 'Nombre de usuario', 'Kullanıcı adı', '用户名'),
(34, 'password', 'Password', 'كلمه السر', 'Wachtwoord', 'Mot de passe', 'Passwort', 'пароль', 'Contraseña', 'Parola', '密码'),
(35, 'forgot_your_password', 'Forgot your password?', 'نسيت رقمك السري؟', 'Je wachtwoord vergeten?', 'Mot de passe oublié?', 'Haben Sie Ihr Passwort vergessen?', 'Забыли пароль?', '¿Olvidaste tu contraseña?', 'Parolanızı mı unuttunuz?', '忘记你的密码?'),
(36, 'sign_up', 'Sign Up!', 'سجل!', 'Aanmelden!', 'S\'inscrire!', 'Anmelden!', 'Зарегистрироваться!', '¡Regístrate!', 'Kaydol!', '注册!'),
(37, 'new_here', 'New here?', 'جديد هنا؟', 'Nieuw hier?', 'Nouveau ici?', 'Neu hier?', 'Новенький тут?', '¿Nuevo aquí?', 'Burada yeni?', '这里?'),
(38, 'lets_get_started', 'Let\'s get started!', 'هيا بنا نبدأ!', 'Laten we beginnen!', 'Commençons!', 'Lass uns anfangen!', 'Давайте начнем!', '¡Empecemos!', 'Başlayalım!', NULL),
(39, 'email_address', 'E-mail address', 'عنوان البريد الإلكتروني', 'E-mailadres', 'Adresse e-mail', 'E-Mail-Addresse', 'Адрес электронной почты', 'Dirección de correo electrónico', 'E', '电子邮件地址'),
(40, 'confirm_password', 'Confirm Password', 'تأكيد كلمة المرور', 'bevestig wachtwoord', 'Confirmez le mot de passe', 'Bestätige das Passwort', 'Подтвердите Пароль', 'Confirmar contraseña', 'Şifreyi Onayla', '确认密码'),
(41, 'male', 'Male', 'الذكر', 'Mannetje', 'Mâle', 'Männlich', 'мужчина', 'Masculino', 'Erkek', '男性'),
(42, 'female', 'Female', 'إناثا', 'Vrouw', 'Femelle', 'Weiblich', 'женский', 'Hembra', 'Kadın', '女性'),
(43, 'already_have_account', 'Already have an account?', 'هل لديك حساب بالفعل؟', 'Heeft u al een account?', 'Vous avez déjà un compte?', 'Hast du schon ein Konto?', 'У вас уже есть учетная запись?', '¿Ya tienes una cuenta?', 'Zaten hesabınız var mı?', '已经有一个账号?'),
(44, 'home', 'Home', 'الصفحة الرئيسية', 'Huis', 'Accueil', 'Zuhause', 'Главная', 'Casa', 'Ev', '首页'),
(45, 'upload', 'Upload', 'تحميل', 'Uploaden', 'Télécharger', 'Hochladen', 'Загрузить', 'Subir', 'Yükleme', '上传'),
(46, 'terms_of_use', 'Terms of use', 'تعليمات الاستخدام', 'Gebruiksvoorwaarden', 'Conditions d\'utilisation', 'Nutzungsbedingungen', 'Условия эксплуатации', 'Términos de Uso', 'Kullanım Şartları', '使用条款'),
(47, 'privacy_policy', 'Privacy Policy', 'سياسة الخصوصية', 'Privacybeleid', 'Politique de confidentialité', 'Datenschutz-Bestimmungen', 'политика конфиденциальности', 'Política de privacidad', 'Gizlilik Politikası', '隐私政策'),
(48, 'about_us', 'About us', 'معلومات عنا', 'Over ons', 'À propos de nous', 'Über uns', 'О нас', 'Sobre nosotros', 'Hakkımızda', '关于我们'),
(49, 'language', 'Language', 'لغة', 'Taal', 'La langue', 'Sprache', 'язык', 'Idioma', 'Dil', '语言'),
(50, 'copyright', 'Copyright © {{DATE}} {{CONFIG name}}. All rights reserved.', 'حقوق الطبع والنشر © {{DATE}} {{CONFIG name}}. كل الحقوق محفوظة.', 'Copyright © {{DATE}} {{CONFIG name}}. Alle rechten voorbehouden.', 'Copyright © {{DATE}} {{CONFIG name}}. Tous les droits sont réservés.', 'Copyright © {{DATE}} {{CONFIG name}}. Alle Rechte vorbehalten.', 'Copyright © {{DATE}} {{CONFIG name}}. Все права защищены.', 'Copyright © {{DATE}} {{CONFIG name}}. Todos los derechos reservados.', 'Telif Hakkı © {{DATE}} {{CONFIG name}}. Her hakkı saklıdır.', 'Copyright © {{DATE}} {{CONFIG name}}. All rights reserved.'),
(51, 'profile', 'Profile', 'الملف الشخصي', 'Profiel', 'Profil', 'Profil', 'Профиль', 'Perfil', 'Profil', '个人资料'),
(52, 'edit', 'Edit', 'تصحيح', 'Bewerk', 'modifier', 'Bearbeiten', 'редактировать', 'Editar', 'Düzenleme', '编辑'),
(53, 'settings', 'Settings', 'إعدادات', 'instellingen', 'Paramètres', 'Einstellungen', 'настройки', 'Ajustes', 'Ayarlar', '设置'),
(54, 'log_out', 'Log out', 'الخروج', 'Uitloggen', 'Connectez - Out', 'Ausloggen', 'Выйти', 'Cerrar sesión', 'Çıkış Yap', '退出'),
(55, 'featured_video', 'Featured video', 'فيديو متميز', 'Aanbevolen video', 'Vidéo en vedette', 'Empfohlenes Video', 'Продвигаемое Видео', 'Vídeo destacado', 'Öne çıkan video', '特色视频'),
(56, 'subscribe', 'Subscribe', 'الاشتراك', 'abonneren', 'Souscrire', 'Abonnieren', 'Подписывайся', 'Suscribir', 'Abone ol', '订阅'),
(57, 'views', 'Views', 'المشاهدات', 'Bekeken', 'Vues', 'Ansichten', 'Просмотры', 'vistas', 'Görünümler', '浏览'),
(58, 'save', 'Save', 'حفظ', 'Save', 'sauvegarder', 'sparen', 'Сохранить', 'Salvar', 'Kayıt etmek', '保存'),
(59, 'share', 'Share', 'شارك', 'Delen', 'Partager', 'Aktie', 'Поделиться', 'Compartir', 'Pay', '分享'),
(60, 'embed', 'Embed', 'تضمين', 'insluiten', 'Intégrer', 'Einbetten', 'встраивать', 'Empotrar', 'gömmek', '嵌入'),
(61, 'report', 'Report', 'أبلغ عن', 'Rapportere', 'rapport', 'Bericht', 'Отчет', 'Informe', 'Rapor', '举报'),
(62, 'published_on', 'Published on ', 'نشرت في', 'gepubliceerd op', 'Publié le', 'Veröffentlicht auf', 'Опубликован в', 'Publicado en', 'yayınlandı', '发布与'),
(63, 'in', 'In', 'في', 'In', 'Dans', 'Im', 'В', 'En', 'İçinde', '在'),
(64, 'top_videos', 'Top videos', 'أهم مقاطع الفيديو', 'Top video\'s', 'Top videos', 'Top Videos', 'Лучшие видеоролики', 'Los mejores videos', 'En iyi videolar', '热门视频'),
(65, 'trending', 'Trending', 'الشائع', 'Trending', 'Tendances', 'Trending', 'Trending', 'Tendencias', 'Trend', '流行趋势'),
(66, 'explore_more', 'Explore more', 'استكشاف المزيد', 'Ontdek meer', 'Explorez plus', 'Erkunde mehr', 'Узнайте больше', 'Explora más', 'Daha fazla keşfedin', '探索更多'),
(67, 'year', 'year', 'عام', 'jaar', 'an', 'Jahr', 'год', 'año', 'yıl', '年'),
(68, 'month', 'month', 'شهر', 'maand', 'mois', 'Monat', 'месяц', 'mes', 'ay', '月'),
(69, 'day', 'day', 'يوم', 'dag', 'journée', 'Tag', 'день', 'día', 'gün', '天'),
(70, 'hour', 'hour', 'ساعة', 'uur', 'heure', 'Stunde', 'час', 'hora', 'saat', '小时'),
(71, 'minute', 'minute', 'اللحظة', 'minuut', 'minute', 'Minute', 'минут', 'minuto', 'dakika', '分钟'),
(72, 'second', 'second', 'ثانيا', 'tweede', 'seconde', 'zweite', 'второй', 'segundo', 'ikinci', '秒钟'),
(73, 'years', 'years', 'سنوات', 'jaar', 'années', 'Jahre', 'лет', 'años', 'yıl', '年'),
(74, 'months', 'months', 'الشهور', 'maanden', 'mois', 'Monate', 'месяцы', 'meses', 'ay', '月'),
(75, 'days', 'days', 'أيام', 'dagen', 'journées', 'Tage', 'дней', 'días', 'günler', '天'),
(76, 'hours', 'hours', 'ساعات', 'uur', 'heures', 'Std.', 'часов', 'horas', 'saatler', '小时'),
(77, 'minutes', 'minutes', 'الدقائق', 'notulen', 'minutes', 'Protokoll', 'минут', 'minutos', 'dakika', '分钟'),
(78, 'seconds', 'seconds', 'ثواني', 'seconden', 'secondes', 'Sekunden', 'секунд', 'segundos', 'saniye', '秒钟'),
(79, 'time_ago', 'ago', 'منذ', 'geleden', 'depuis', 'vor', 'тому назад', 'hace', 'önce', '前'),
(80, 'url_not_supported', 'URL not supported.', 'عنوان ورل غير متوافق.', 'URL niet ondersteund.', 'URL non prise en charge.', 'URL wird nicht unterstützt.', 'URL не поддерживается.', 'URL no es compatible.', 'URL desteklenmiyor.', 'URL不支持.'),
(81, 'no_more_comments', 'No more comments found', 'لم يتم العثور على مزيد من التعليقات', 'Er zijn nog geen reacties gevonden', 'Plus de commentaires ont été trouvés', 'Keine weiteren Kommentare gefunden', 'Больше комментариев не найдено', 'No se encontraron comentarios', 'Başka yorum bulunamadı', '暂时还没有更多评论'),
(82, 'video_not_found_please_try_again', 'Video not found, please refresh the page and try again.', 'لم يتم العثور على الفيديو، يرجى تحديث الصفحة وإعادة المحاولة.', 'Video niet gevonden, vernieuw de pagina en probeer het opnieuw.', 'Vidéo non trouvée, actualisez la page et réessayez.', 'Video nicht gefunden, bitte aktualisieren Sie die Seite und versuchen Sie es erneut.', 'Видео не найдено, обновите страницу и повторите попытку.', 'No se encontró el video, actualice la página e inténtelo de nuevo.', 'Video bulunamadı, lütfen sayfayı yenileyin ve tekrar deneyin.', '没有找到视频，请刷新页面，再试一次.'),
(83, 'saved', 'Saved', 'حفظ', 'lagret', 'Enregistré', 'gespeichert', 'Сохраненный', 'guardado', 'kaydedilmiş', '保存'),
(84, 'no_comments_found', 'No comments found', 'لم يتم العثور على تعليقات', 'Geen reacties gevonden', 'Aucun commentaire trouvé', 'Keine Kommentare gefunden', 'Комментариев нет', 'No se encontraron comentarios', 'Hiçbir yorum bulunamadı', '暂时无评论'),
(85, 'import', 'Import', 'استيراد', 'Importeren', 'Importer', 'Einführen', 'Импортировать', 'Importar', 'İthalat', '导入'),
(86, 'import_new_video', 'Import new video', 'استيراد فيديو جديد', 'Nieuwe video importeren', 'Importer une nouvelle vidéo', 'Neues Video importieren', 'Импортировать новое видео', 'Importar nuevo video', 'Yeni video aktar', '导入新视频'),
(87, 'video_url', 'Video URL', 'عنوان الفيديو', 'Video URL', 'URL de la vidéo', 'Video-URL', 'URL видео', 'URL del vídeo', 'Video URL\'si', '视频URL'),
(88, 'url_desc', 'YouTube, Dailymotion, Vimeo URLs', 'يوتيوب، دايليموتيون، فيميو عناوين المواقع', 'YouTube, Dailymotion, Vimeo URLs', 'YouTube, Dailymotion, URL de Vimeo', 'YouTube, Dailymotion, Vimeo URLs', 'URL-адреса YouTube, Dailymotion, Vimeo', 'URL de YouTube, Dailymotion, Vimeo', 'YouTube, Dailymotion, Vimeo URL\'leri', '支持比如：http://xxx.com/123.mp4'),
(89, 'fetch_Video', 'Fetch Video', 'جلب الفيديو', 'Haal video', 'Fetch Video', 'Video abrufen', 'Извлечение видео', 'Obtener video', 'Video getir', '获取视频'),
(90, 'video_title', 'Video Title', 'عنوان مقطع الفيديو', 'Video Titel', 'titre de la vidéo', 'Videotitel', 'Название видео', 'Titulo del Video', 'video başlığı', '视频标题'),
(91, 'video_title_help', 'Your video title, 2 - 55 characters', 'عنوان الفيديو، من 2 إلى 55 حرفا', 'Je videotitel, 2 - 55 tekens', 'Votre titre vidéo, 2 à 55 caractères', 'Ihr Videotitel, 2 - 55 Zeichen', 'Название вашего видео, 2 - 55 символов', 'Su título de vídeo, 2 - 55 caracteres', 'Video başlığınız, 2 - 55 karakter', '你的视频标题, 2 - 55 字符'),
(92, 'video_descritpion', 'Video Description', 'وصف الفيديو', 'video beschrijving', 'description de vidéo', 'Videobeschreibung', 'описание видео', 'Descripción del video', 'Video Açıklaması', '视频描述'),
(93, 'category', 'Category', 'فئة', 'categorie', 'Catégorie', 'Kategorie', 'категория', 'categoría', 'kategori', '视频分类'),
(94, 'tags', 'Tags', 'الكلمات', 'Tags', 'Mots clés', 'Tags', 'Теги', 'Etiquetas', 'Etiketler', '视频标签'),
(95, 'tags_help', 'Tags, seprated by comma', 'الكلمات، سيبراتد بواسطة فاصلة', 'Tags gescheiden door komma\'s', 'Tags, séparés par virgule', 'Tags, gefolgt von Komma', 'Теги, разделенные запятой', 'Etiquetas, seprated by comma', 'Etiketler, virgülle ayrılmış', '多个标签以英文逗号分开'),
(96, 'publish', 'Publish', 'نشر', 'Publiceren', 'Publier', 'Veröffentlichen', 'Публиковать', 'Publicar', 'yayınlamak', '发布'),
(97, 'upload_new_video', 'Upload new video', 'تحميل فيديو جديد', 'Nieuwe video uploaden', 'Télécharger une nouvelle vidéo', 'Neues Video hochladen', 'Загрузить новое видео', 'Subir nuevo video', 'Yeni video yükle', '上传新视频'),
(98, 'choose_new_file', 'Choose video file..', 'اختيار ملف فيديو ..', 'Kies een videobestand ..', 'Choisissez le fichier vidéo ..', 'Videodatei auswählen', 'Выберите видеофайл.', 'Elige un archivo de video ..', 'Video dosyasını seçin ..', '选择视频文件..'),
(99, 'thumbnail', 'Thumbnail', 'صورة مصغرة', 'thumbnail', 'La vignette', 'Miniaturansicht', 'Thumbnail', 'Miniatura', 'başparmak tırnağı', '视频封面'),
(100, 'successfully_uplaoded', 'successfully uploaded.', 'تم تحميلها بنجاح.', 'succesvol geüpload.', 'téléchargé avec succès.', 'erfolgreich hochgeladen', 'успешно загружен.', 'cargado con éxito.', 'başarıyla yüklendi.', '上传成功.'),
(101, 'reply', 'Reply', 'الرد', 'Antwoord', 'Répondre', 'Antworten', 'Ответить', 'Respuesta', 'Cevap', '回复'),
(102, 'show_more', 'Show more', 'أظهر المزيد', 'Laat meer zien', 'Montre plus', 'Zeig mehr', 'Показать больше', 'Mostrar más', 'Daha fazla göster', '显示更多'),
(103, 'comments', 'Comments', 'تعليقات', 'Comments', 'commentaires', 'Bemerkungen', 'Комментарии', 'Comentarios', 'Yorumlar', '评论'),
(104, 'write_your_comment', 'Write your comment..', 'اكتب تعليقك ..', 'Schrijf je reactie ..', 'Écrivez votre commentaire ..', 'Schreiben Sie Ihren Kommentar ..', 'Написать комментарий ..', 'Escriba su comentario ..', 'Yorumunuzu yazın ..', '留下你的评论..'),
(105, 'fb_comments', 'Facebook Comments', 'تعليقات الفيسبوك', 'Facebook Reacties', 'Commentaires de Facebook', 'Facebook Kommentare', 'Комментарии Facebook', 'Comentarios de Facebook', 'Facebook Yorumları', 'Facebook 评论'),
(106, 'related_videos', 'Related Videos', 'فيديوهات ذات علاقة', 'Relaterte videoer', 'Vidéos connexes', 'Ähnliche Videos', 'Похожие видео', 'Videos relacionados', 'İlgili videolar', '相关视频'),
(107, 'delete_confirmation', 'Are you sure you want to delete your comment?', 'هل تريد بالتأكيد حذف تعليقك؟', 'Weet u zeker dat u uw reactie wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer votre commentaire?', 'Bist du sicher, dass du deinen Kommentar löschen möchtest?', 'Вы уверены, что хотите удалить свой комментарий?', '¿Seguro que quieres eliminar tu comentario?', 'Yorumu silmek istediğinizden emin misiniz?', '你确定删除你的评论?'),
(108, 'subscribed', 'Subscribed', 'المشترك', 'geabonneerd', 'Souscrit', 'Gezeichnet', 'подписной', 'Suscrito', 'Abone', '已订阅'),
(109, 'no_videos_found_subs', 'No videos found, subscribe to get started!', 'لم يتم العثور على مقاطع فيديو، اشترك في الخطوات الأولى!', 'Geen video\'s gevonden, schrijf je in om te beginnen!', 'Aucune vidéo n\'a été trouvée, inscrivez-vous pour commencer!', 'Keine Videos gefunden, abonnieren, um loszulegen!', 'Видео не найдено, подписаться, чтобы начать работу!', 'No videos encontrados, suscríbase para empezar!', 'Hiçbir video bulunamadı, başlamak için abone olun!', '没有发现视频，请开始订阅!'),
(110, 'subscriptions', 'Subscriptions', 'الاشتراكات', 'abonnementen', 'Abonnements', 'Abonnements', 'Подписки', 'Suscripciones', 'Abonelikler', '订阅'),
(111, 'no_videos_found_history', 'No videos found, watch to get started!', 'لم يتم العثور على مقاطع فيديو، يمكنك مشاهدة الخطوات الأولى!', 'Geen video\'s gevonden, kijk om te beginnen!', 'Aucune vidéo n\'a été trouvée, regardez pour commencer!', 'Keine Videos gefunden, schau, um loszulegen!', 'Видео не найдено, следите, чтобы начать!', 'No se han encontrado vídeos, ¡mira para empezar!', 'Hiçbir video bulunamadı, başlamak için izleyin!', '没有找到视频，请开始观看!'),
(112, 'history', 'History', 'التاريخ', 'Geschiedenis', 'Histoire', 'Geschichte', 'история', 'Historia', 'tarih', '历史纪录'),
(113, 'no_videos_found_liked', 'No videos found, like to get started!', 'لم يتم العثور على مقاطع فيديو، مثل البدء!', 'Geen video\'s gevonden, graag aan de slag!', 'Aucune vidéo trouvée, n\'aime la mise en route!', 'Keine Videos gefunden, wie los!', 'Видео не найдено, как начать!', 'No se han encontrado vídeos, ¡como para empezar!', 'Hiçbir video bulunamadı, başlamak gibi!', '找不到视频，请开始点赞！'),
(114, 'liked_videos', 'Liked videos', 'أعجبت مقاطع الفيديو', 'Verwachte video\'s', 'Vidéos aimées', 'Mochte Videos', 'Понравившиеся видео', 'Videos que me gustaron', 'Beğenilen videolar', '点赞视频'),
(115, 'latest_videos', 'Latest videos', 'أحدث مقاطع الفيديو', 'Laatste video\'s', 'Dernières vidéos', 'Neueste Videos', 'Последние видео', 'Últimos vidéos', 'En yeni videolar', '最新视频'),
(116, 'no_videos_found_for_now', 'No videos found for now!', 'لم يتم العثور على مقاطع فيديو في الوقت الحالي!', 'Er zijn nog geen video\'s gevonden!', 'Aucune vidéo trouvée pour l\'instant!', 'Bisher keine Videos gefunden!', 'Видео не найдено пока!', 'No se encontraron videos por ahora!', 'Şuan için bir video bulunamadı!', '暂时还没有视频!'),
(117, 'no_more_videos_to_show', 'No more videos to show', 'لا مزيد من مقاطع الفيديو المراد عرضها', 'Nog geen video\'s om te laten zien', 'Plus de vidéos à afficher', 'Keine Videos mehr zu zeigen', 'Больше нет видео для показа', 'No hay más videos para mostrar', 'Gösterilecek daha fazla video yok', '没有更多视频来显示'),
(118, 'categories', 'Categories', 'الاقسام', 'Categorieën', 'Catégories', 'Kategorien', 'категории', 'Categorías', 'Kategoriler', '视频分类'),
(119, 'video_already_exist', 'Video is already exist', 'الفيديو موجود من قبل', 'Video bestaat al', 'La vidéo existe déjà', 'Video ist bereits vorhanden', 'Видео уже существует', 'El video ya existe', 'Video zaten var', '视频已经存在'),
(120, 'video_saved', 'Video successfully updated', 'تم تحديث الفيديو بنجاح', 'Video is succesvol bijgewerkt', 'Vidéo mise à jour avec succès', 'Video erfolgreich aktualisiert', 'Видео успешно обновлено', 'Video actualizado correctamente', 'Video başarıyla güncellendi', '视频成功更新'),
(121, 'manage_videos', 'Manage Videos', 'إدارة مقاطع الفيديو', 'Beheer video\'s', 'Gérer les vidéos', 'Videos verwalten', 'Управление видео', 'Administrar vídeos', 'Videoları Yönet', '管理视频'),
(122, 'search', 'Search', 'بحث', 'Zoeken', 'Chercher', 'Suche', 'Поиск', 'Buscar', 'Arama', '搜索'),
(123, 'manage', 'Manage', 'يدير', 'beheren', 'Gérer', 'Verwalten', 'управлять', 'Gestionar', 'yönetme', '管理'),
(124, 'edit_video', 'Edit video', 'تحرير الفيديو', 'Bewerk video', 'Éditer vidéo', 'Video bearbeiten', 'Редактировать видео', 'Editar video', 'Videoyu düzenle', '编辑视频'),
(125, 'delete_video_confirmation', 'Are you sure you want to delete this video? This action can\'t be undo', 'هل تريد بالتأكيد حذف هذا الفيديو؟ لا يمكن التراجع عن هذا الإجراء', 'Weet u zeker dat u deze video wilt verwijderen? Deze actie kan niet worden ongedaan gemaakt', 'Êtes-vous sûr de vouloir supprimer cette vidéo? Cette action ne peut pas annuler', 'Sind Sie sicher, dass Sie dieses Video löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden', 'Вы действительно хотите удалить это видео? Это действие не может быть отменено', '¿Seguro que quieres eliminar este video? No se puede deshacer esta acción', 'Bu videoyu silmek istediğinizden emin misiniz? Bu işlem geri alınamaz', NULL),
(126, 'manage_my_videos', 'Manage My Videos', 'إدارة مقاطع الفيديو الخاصة بي', 'Beheer mijn video\'s', 'Gérer mes vidéos', 'Verwalten Sie meine Videos', 'Управление видео', 'Administrar mis videos', 'Videolarımı Yönet', '管理我的视频'),
(127, 'delete_videos', 'Delete video', 'حذف الفيديو', 'Video verwijderen', 'Supprimer la vidéo', 'Video löschen', 'Удалить видео', 'Eliminar vídeo', 'Videoyu sil', '删除视频'),
(128, 'search_results', 'Search Results', 'نتائج البحث', 'Zoekresultaten', 'Résultats de la recherche', 'Suchergebnisse', 'результаты поиска', 'Resultados de la búsqueda', 'arama sonuçları', '搜索结果'),
(129, 'status', 'Status', 'وضع', 'staat', 'Statut', 'Status', 'статус', 'estatus', 'durum', '状态'),
(130, 'active', 'Active', 'نشيط', 'Actief', 'actif', 'Aktiv', 'активный', 'Activo', 'Aktif', '活跃'),
(131, 'inactive', 'Inactive', 'غير نشط', 'Inactief', 'Inactif', 'Inaktiv', 'Неактивный', 'Inactivo', 'etkisiz', '不活跃'),
(132, 'type', 'Type', 'اكتب', 'Type', 'Type', 'Art', 'Тип', 'Tipo', 'tip', '类型'),
(133, 'user', 'User', 'المستعمل', 'Gebruiker', 'Utilisateur', 'Benutzer', 'пользователь', 'Usuario', 'kullanıcı', '用户'),
(134, 'admin', 'Admin', 'مشرف', 'beheerder', 'Admin', 'Administrator', 'Администратор', 'Administración', 'yönetim', 'Admin'),
(135, 'verification', 'Verification', 'التحقق', 'Verificatie', 'Vérification', 'Überprüfung', 'верификация', 'Verificación', 'Doğrulama', '验证'),
(136, 'verified', 'Verified', 'التحقق', 'geverifieerd', 'Vérifié', 'Verifiziert', 'проверенный', 'Verificado', 'Doğrulanmış', '验证'),
(137, 'not_verified', 'Not verified', 'لم يتم التحقق منه', 'niet geverifieerd', 'non vérifié', 'Nicht verifiziert', 'не подтверждено', 'No verificado', 'Doğrulanmadı', '没有验证'),
(138, 'setting_updated', 'Settings successfully updated!', 'تم تحديث الإعدادات بنجاح!', 'Instellingen succesvol bijgewerkt!', 'Les paramètres ont été mis à jour avec succès!', 'Einstellungen erfolgreich aktualisiert!', 'Настройки успешно обновлены!', 'Configuración actualizada con éxito!', 'Ayarlar başarıyla güncellendi!', '设置成功更新'),
(139, 'first_name', 'First Name', 'الاسم الاول', 'Voornaam', 'Prénom', 'Vorname', 'Имя', 'Nombre de pila', 'İsim', '名字'),
(140, 'last_name', 'Last Name', 'الكنية', 'Achternaam', 'Nom de famille', 'Familienname, Nachname', 'Фамилия', 'Apellido', 'Soyadı', '姓氏'),
(141, 'about_profile', 'About', 'حول', 'Over', 'Sur', 'Über', 'Около', 'Acerca de', 'hakkında', '自我介绍'),
(142, 'facebook', 'Facebook', 'فيس بوك', 'Facebook', 'Facebook', 'Facebook', 'facebook', 'Facebook', 'Facebook', '新浪微博'),
(143, 'google_plus', 'Google+', 'في + Google', 'Google+', 'Google+', 'Google+', 'Google+', 'Google+', 'Google+', 'QQ空间'),
(144, 'twitter', 'Twitter', 'تغريد', 'tjilpen', 'Gazouillement', 'Twitter', 'щебет', 'Gorjeo', 'heyecan', '人人网'),
(145, 'current_password', 'Current Passowrd', 'باسورد الحالي', 'Huidige Passowrd', 'Passowrd actuel', 'Aktuelles Passowrd', 'Текущий Passowrd', 'Passowrd actual', 'Geçerli Geçiş', '当前密码'),
(146, 'new_password', 'New Passowrd', 'جديد باسورد', 'Nieuwe Passowrd', 'New Passowrd', 'Neue Passowrd', 'Новый Passowrd', 'Nuevo pasatiempo', 'Yeni Passowrd', '新密码'),
(147, 'confirm_new_password', 'Confirm new password', 'تأكيد كلمة المرور الجديدة', 'Bevestig nieuw wachtwoord', 'Confirmer le nouveau mot de passe', 'Bestätige neues Passwort', 'Подтвердите новый пароль', 'Confirmar nueva contraseña', 'Yeni şifreyi onayla', '确认新密码'),
(148, 'current_password_dont_match', 'Current password doesn\'t match.', 'كلمة المرور الحالية غير متطابقة.', 'Huidig ​​wachtwoord komt niet overeen.', 'Le mot de passe actuel ne correspond pas.', 'Aktuelles Passwort stimmt nicht überein.', 'Текущий пароль не соответствует.', 'La contraseña actual no coincide.', 'Geçerli şifre uyuşmuyor.', NULL),
(149, 'new_password_dont_match', 'New password doesn\'t match.', 'كلمة المرور الجديدة غير متطابقة.', 'Nieuw wachtwoord komt niet overeen.', 'Le nouveau mot de passe ne correspond pas.', 'Neues Passwort stimmt nicht überein.', 'Новый пароль не соответствует.', 'La nueva contraseña no coincide.', 'Yeni şifre uyuşmuyor.', NULL),
(150, 'avatar', 'Avatar', 'الصورة الرمزية', 'avatar', 'Avatar', 'Benutzerbild', 'Аватар', 'Avatar', 'Avatar', '头像'),
(151, 'cover', 'Cover', 'غطاء، يغطي', 'deksel', 'Couverture', 'Abdeckung', 'Обложка', 'Cubrir', 'kapak', '封面'),
(152, 'your_account_was_deleted', 'Your account was deleted', 'تم حذف حسابك', 'Uw account is verwijderd', 'Votre compte a été supprimé', 'Ihr Konto wurde gelöscht', 'Ваша учетная запись была удалена', 'Se ha eliminado tu cuenta.', 'Hesabınız silindi', '你账号被删除'),
(153, 'avatar_and_cover', 'Avatar & Cover', 'الصورة الرمزية والغطاء', 'Avatar & Cover', 'Avatar et couverture', 'Avatar & Cover', 'Аватар & Cover', 'Avatar y portada', 'Avatar & Kapak', '头像 &amp; 封面'),
(154, 'general', 'General', 'جنرال لواء', 'Algemeen', 'Général', 'General', 'Генеральная', 'General', 'Genel', '常规'),
(155, 'delete_account', 'Delete account', 'حذف الحساب', 'Account verwijderen', 'Supprimer le compte', 'Konto löschen', 'Удалить аккаунт', 'Borrar cuenta', 'Hesabı sil', '删除账号'),
(156, 'general_settings', 'General Settings', 'الاعدادات العامة', 'Algemene instellingen', 'réglages généraux', 'Allgemeine Einstellungen', 'общие настройки', 'Configuración general', 'Genel Ayarlar', '常规设置'),
(157, 'password_settings', 'Password Settings', 'إعدادات كلمة المرور', 'Wachtwoordinstellingen', 'Paramètres du mot de passe', 'Kennworteinstellungen', 'Настройки пароля', 'Configuración de la contraseña', 'Şifre Ayarları', '密码设置'),
(158, 'profile_settings', 'Profile Settings', 'إعدادات الملف الشخصي', 'Profielinstellingen', 'Paramètres de profil', 'Profileinstellungen', 'Настройки профиля', 'Configuración de perfil', 'Profil ayarları', '个人资料设置'),
(159, 'videos', 'Videos', 'أشرطة فيديو', 'Videos', 'Vidéos', 'Videos', 'Видео', 'Videos', 'Videolar', '视频'),
(160, 'up_next', 'Up next', 'التالي', 'Volgende', 'Suivant', 'Als nächstes', 'Следующий', 'Hasta la próxima', 'Bir sonraki', '下一个'),
(161, 'autoplay', 'Autoplay', 'تشغيل تلقائي', 'Automatisch afspelen', 'Lecture automatique', 'Automatisches Abspielen', 'Автовоспроизведение', 'Auto reproducción', 'Otomatik oynatma', '自动播放'),
(162, 'featured', 'Featured', 'متميز', 'Uitgelicht', 'En vedette', 'Vorgestellt', 'Рекомендуемые', 'Destacados', 'Öne çıkan', '精选'),
(163, 'saved_videos', 'Saved Videos', 'مقاطع الفيديو المحفوظة', 'Opgeslagen video\'s', 'Vidéos sauvegardées', 'Gespeicherte Videos', 'Сохраненные видео', 'Videos guardados', 'Kaydedilen Videolar', '保存视频'),
(164, 'my_channel', 'My Channel', 'قناتي', 'Mijn kanaal', 'Ma chaîne', 'Mein Kanal', 'Мой канал', 'Mi canal', 'Benim kanalım', '我的频道'),
(165, 'add_to', 'Add to', 'إضافة إلى', 'Legg til i', 'Ajouter à', 'Hinzufügen zu', 'Добавить в', 'Agregar a', 'Ekle', '添加到'),
(166, 'add_to_pl', 'Add to playlist', 'إضافة إلى قائمة التشغيل', 'Legg til i spilleliste', 'Ajouter à la playlist', 'Zu Playlist hinzufügen', 'Добавить в плейлист', 'Agregar a lista de reproducción', 'Çalma listesine ekle', '添加到播放列表'),
(167, 'create_new', 'Create new', 'إنشاء جديد', 'Opprett ny', 'Créer un nouveau', 'Neu erstellen', 'Создать новый', 'Crear nuevo', 'Yeni oluştur', '新创建'),
(168, 'close', 'Close', 'قريب', 'Lukk', 'Fermer', 'Schließen', 'Закрыть', 'cerca', 'yakın', '取消'),
(169, 'removed_from', 'Removed from', 'تمت الإزالة من', 'Fjernet fra', 'Retiré de', 'Entfernt von', 'Удалено из', 'Eliminado de', 'Kaldırıldı', '移除'),
(170, 'added_to', 'Added to', 'تمت الإضافة إلى', 'Lagt til', 'Ajouté à', 'Hinzugefügt zu', 'Добавлено в', 'Agregado a', 'Eklendi', '添加到'),
(171, 'create_new_pl', 'Create new playlist', 'إنشاء قائمة تشغيل جديدة', 'Opprett ny spilleliste', 'Créer une nouvelle playlist', 'Neue Playlist erstellen', 'Создать новый плейлист', 'Crear nueva lista de reproducción', 'Yeni çalma listesi oluştur', '创建新的播放列表'),
(172, 'pl_name', 'Playlist name', 'اسم قائمة التشغيل', 'Spilleliste navn', 'Nom de la liste de lecture', 'Playlist-Name', 'Название плейлиста', 'Nombre de la lista de reproducción', 'Çalma listesi adı', '播放列表名称'),
(173, 'privacy', 'Privacy', 'خصوصية', 'personvern', 'Confidentialité', 'Privatsphäre', 'Приватность', 'intimidad', 'gizlilik', '隐私'),
(174, 'description', 'Description', 'وصف', 'beschrijving', 'Description', 'Beschreibung', 'Описание', 'descripción', 'tanım', '描述'),
(175, 'create', 'Create', 'خلق', 'Opprett', 'Créer', 'Erstellen', 'создать', 'crear', 'oluşturmak', '创建'),
(176, 'cancel', 'Cancel', 'إلغاء', 'Avbryt', 'Annuler', 'Abbrechen', 'отменить', 'cancelar', 'iptal', '取消'),
(177, 'pl_name_required', 'Play list name is required.', 'اسم قائمة التشغيل مطلوب.', 'Spillelistenavn er nødvendig.', 'Le nom de la liste de lecture est requis.', 'Der Name der Wiedergabeliste ist erforderlich.', 'Введите имя плейлиста', 'Se requiere el nombre de la lista de reproducción.', 'Çalma listesi adı gerekiyor.', '播放列表名称是必须的'),
(178, 'play_lists', 'PlayLists', 'قوائم التشغيل', 'spillelister', 'PlayLists', 'PlayLists', 'плейлисты', 'las listas de reproducción', 'çalma', '播放列表'),
(179, 'delete', 'Delete', 'حذف', 'Slett', 'Supprimer', 'Löschen', 'удалять', 'borrar', 'silmek', '删除'),
(180, 'confirmation', 'Confirmation!', 'تأكيد!', 'Bekreftelse!', 'Confirmation!', 'Bestätigung!', 'Подтверждение!', 'Confirmación!', 'Onay!', '确认'),
(181, 'confirm_delist', 'Are you sure you want to delete this PlayList?', 'هل تريد بالتأكيد حذف قائمة التشغيل هذه؟', 'Er du sikker på at du vil slette denne PlayList?', 'Êtes-vous sûr de vouloir supprimer cette PlayList?', 'Möchten Sie diese PlayList wirklich löschen?', 'Вы действительно хотите удалить этот список воспроизведения?', '¿Estás seguro de que quieres eliminar esta PlayList?', 'Bu Oynatma Listesini silmek istediğinizden emin misiniz?', '你确定删除这个播放列表?'),
(182, 'yes_del', 'Yes,delete it!', 'نعم، حذفه!', 'Ja, slett det!', 'Oui, supprimez-le!', 'Ja, löschen Sie es!', 'Да, удалите его!', 'Sí, ¡bórralo!', 'Evet, sil şunu!', '是的，删除它!'),
(183, 'deleted', 'Deleted!', 'حذف!', 'Slettet!', 'Supprimé!', 'Gelöscht!', 'Удаляется!', 'Borrado!', 'Silinen!', '删除!'),
(184, 'was_deleted', 'has been deleted!', 'تم حذف!', 'har blitt slettet!', 'a été supprimé!', 'wurde gelöscht!', 'был удален!', 'ha sido eliminado', 'silindi!', '已被删除！'),
(185, 'no_lists_found', 'No PlayLists Found!', 'لم يتم العثور على قوائم تشغيل!', 'Ingen spillelister funnet!', 'Aucune liste de lecture trouvée!', 'Keine PlayLists gefunden!', 'Нет списков воспроизведения!', 'No se encontraron listas de reproducción', 'Hiç PlayList Bulunamadı!', '没有发现视频列表!'),
(186, 'public', 'Public', 'جمهور', 'offentlig', 'Public', 'Öffentlichkeit', 'Публичный', 'público', 'kamu', '公开'),
(187, 'private', 'Private', 'خاص', 'privat', 'Privé', 'Privat', 'Приватный', 'privado', 'özel', '私人'),
(188, 'сreated', 'Created', 'مكون', 'laget', 'établi', 'Erstellt', 'созданный', 'creado', 'düzenlendi', '创建'),
(189, 'pl_сreated', 'PlayList was successful added!', 'تمت إضافة قائمة التشغيل بنجاح!', 'Spilleliste ble lagt til!', 'PlayList a été ajouté avec succès!', 'PlayList wurde erfolgreich hinzugefügt!', 'Плейлист был успешно добавлен!', '¡La lista de reproducción se agregó con éxito!', 'Çalma listesi başarıyla eklendi!', '播放列表添加成功'),
(190, 'pl_saved', 'PlayList was successful saved!', 'تم حفظ قائمة التشغيل بنجاح!', 'Spillelisten ble lagret!', 'PlayList a été enregistré avec succès!', 'PlayList wurde erfolgreich gespeichert!', 'Плейлист был успешно сохранен!', '¡La lista de reproducción se guardó con éxito!', 'Çalma listesi başarıyla kaydedildi!', '播放列表成功保存!'),
(191, 'watch_later', 'Watch later', 'سأشاهده لاحقا', 'Se senere', 'Regarder plus tard', 'Später ansehen', 'Посмотреть позже', 'Ver despues', 'Daha sonra izle', '稍后观看'),
(192, 'articles', 'Articles', 'مقالات', 'Artikler', 'Des articles', 'Artikel', 'Статьи', 'Artículos', 'Makaleler', '新闻资讯'),
(193, 'search_articles', 'Search for articles', 'البحث عن المقالات', 'Søk etter artikler', 'Rechercher des articles', 'Suche nach Artikeln', 'Поиск статей', 'Buscar artículos', 'Makaleleri ara', '搜索文章'),
(194, 'most_popular', 'Most popular', 'الأكثر شعبية', 'Mest populær', 'Le plus populaire', 'Am beliebtesten', 'Самый популярный', 'Más popular', 'En popüler', '最受欢迎'),
(195, 'no_result_for', 'Sorry, no results found for', 'آسف، لا توجد نتائج ل', 'Beklager, ingen resultater funnet for', 'Désolé, aucun résultat trouvé pour', 'Leider wurden keine Ergebnisse für', 'Извините, результатов не найдено', 'Lo sentimos, no se encontraron resultados para', 'Üzgünüz, bunun hakkında bir sonuç yok', '不好意思，没有结果'),
(196, 'no_post_found', 'No posts found!', 'لم يتم العثور على أية مشاركات!', 'Ingen innlegg funnet!', 'Aucun article trouvé!', 'Keine Einträge gefunden!', 'Сообщений не найдено!', '¡No se han encontrado publicaciones!', 'Gönderi bulunamadı!', '没有发现文章'),
(197, 'related_articles', 'Related Articles', 'مقالات ذات صلة', 'Relaterte artikler', 'Articles Liés', 'In Verbindung stehende Artikel', 'Статьи по Теме', 'Artículos relacionados', 'İlgili Makaleler', '相关文章'),
(198, 'share_to', 'Share to', 'مشاركة في', 'Del til', 'Partager à', 'Teilen mit', 'Поделиться с', 'Compartir a', 'Paylaş', '分享到'),
(199, 'no_more_articles', 'No more Articles', 'لا مزيد من المقالات', 'Ingen flere artikler', 'Plus d\'articles', 'Keine Artikel mehr', 'Нет статей', 'No más artículos', 'Artık Makale Yok', '没有更多文章'),
(200, 'go_pro', 'Go Pro', 'الذهاب للمحترفين', 'Bli profesjonell', 'Go Pro', 'Go pro', 'Стать pro', 'Hazte profesional', 'Yanlışa git', '去专业版'),
(201, 'buy_pro_pkg', 'Discover more features with {{SITE_NAME}} Pro package!', 'اكتشاف المزيد من الميزات مع {{SITE_NAME}} حزمة برو!', 'Oppdag flere funksjoner med {{SITE_NAME}} Pro pakke!', 'Découvrez plus de fonctionnalités avec le package {{SITE_NAME}} Pro!', 'Entdecken Sie weitere Funktionen mit dem {{SITE_NAME}} Pro-Paket!', 'Узнайте больше о функциях с пакетом {{SITE_NAME}} Pro!', 'Descubre más funciones con el {{SITE_NAME}} paquete Pro!', '{{SITE_NAME}} Pro paketi ile daha fazla özellik keşfedin!', 'Discover more features with {{SITE_NAME}} Pro package!'),
(202, 'free_mbr', 'Free Member', 'عضو مجاني', 'Gratis medlem', 'Membre gratuit', 'Freies Mitglied', 'Свободный член', 'miembro gratuito', 'Ücretsiz Üye', '免费会员'),
(203, 'pro_mbr', 'Pro Member', 'عضو برو', 'Pro-medlem', 'Membre Pro', 'Pro-Mitglied', 'Про член', 'Pro miembro', 'Pro Üyesi', '专业会员'),
(204, 'upload_1gb_limit', 'Upload up to 1GB limit', 'تحميل حد يصل إلى 1 غيغابايت', 'Last opp opptil 1 GB grense', 'Importer jusqu\'à 1 Go de limite', 'Bis zu 1 GB limitieren', 'Загружать ограничение до 1 ГБ', 'Carga hasta 1GB de límite', '1GB limitine kadar yükle', '上传到 1GB 限制'),
(205, 'ads_will_show_up', 'Videos ads will show up', 'ستظهر إعلانات مقاطع الفيديو', 'Videoannonser vises', 'Les annonces vidéo s\'affichent', 'Videos werden geschaltet', 'Появятся видеообъявления', 'Los anuncios de videos aparecerán', 'Videolar reklamları gösterilir', '出现视频广告'),
(206, 'not_featured_videos', 'Not featured videos', 'مقاطع الفيديو غير المميزة', 'Ikke kjennetegnet videoer', 'Vidéos non présentées', 'Nicht vorgestellte Videos', 'Не показано видео', 'Videos no destacados', 'Özellikli video yok', '没有精选视频'),
(207, 'no_verified_badge', 'No verified badge', 'لم يتم التحقق من شارة', 'Ingen bekreftet merke', 'Aucun badge vérifié', 'Kein bestätigtes Abzeichen', 'Нет подтвержденного значка', 'Sin insignia verificada', 'Doğrulanmış rozet yok', '没有验证微章'),
(208, 'stay_free', 'Stay Free', 'ابق حرا', 'Forbli fri', 'Reste libre', 'Bleibe frei', 'Оставайся свободным', 'Mantente Libre', 'Bedava Kal', '保持免费'),
(209, 'upgrade', 'Upgrade', 'تطوير', 'Oppgradering', 'Surclassement', 'Aktualisierung', 'Обновить', 'Mejorar', 'yükseltmek', '升级'),
(210, 'upload_1tr_limit', 'Upload up to 1000GB', 'تحميل ما يصل إلى 1000 غيغابايت', 'Last opp opptil 1000 GB', 'Télécharger jusqu\'à 1000Go', 'Bis zu 1000 GB hochladen', 'Загрузите до 1000 ГБ', 'Carga hasta 1000GB', '1000GB\'a kadar yükle', '上传到 1000GB'),
(211, 'ads_wont_show_up', 'No ads will show up', 'لن تظهر أية إعلانات', 'Ingen annonser vil dukke opp', 'Aucune annonce ne s\'affichera', 'Es werden keine Anzeigen geschaltet', 'Объявления не будут отображаться', 'No se mostrarán anuncios', 'Hiçbir reklam gösterilmez', '不会出现广告'),
(212, 'ur_are_featured', 'Featured videos', 'مقاطع الفيديو الخاصة بك واردة', 'Dine videoer er omtalt', 'Vos vidéos sont en vedette', 'Ihre Videos sind gekennzeichnet', 'Ваши видеоролики', 'Tus videos son presentados', 'Videolarınız öne çıkıyor', '精选视频'),
(213, 'verified_badge', 'Verified badge', 'تم التحقق من الشارة', 'Verifisert merketegn', 'Badge vérifié', 'Bestätigter Ausweis', 'Проверенный значок', 'Insignia verificada', 'Doğrulanmış rozet', '验证微章'),
(214, 'congratulations', 'Congratulations!', 'تهانينا!', 'Gratulerer!', 'Toutes nos félicitations!', 'Glückwünsche!', 'Поздравления!', '¡Felicitaciones!', 'Tebrik ederiz!', '恭喜!'),
(215, 'uare_pro', 'You have successfully upgraded you profile to PRO user!', 'لقد نجحت في ترقية ملفك الشخصي إلى مستخدم برو!', 'Du har oppgradert profilen din til PRO-brukeren!', 'Vous avez mis à jour votre profil avec succès vers l\'utilisateur PRO!', 'Sie haben Ihr Profil erfolgreich auf den PRO-Benutzer aktualisiert!', 'Вы успешно обновили свой профиль до пользователя PRO!', '¡Ha actualizado su perfil con éxito a usuario PRO!', 'Profilinizi PRO kullanıcılarına başarıyla yükselttiniz!', '你已经成功升级账号!'),
(216, 'start_features', 'Start browsing new features', 'ابدأ تصفح الميزات الجديدة', 'Begynn å bla gjennom nye funksjoner', 'Commencer à parcourir les nouvelles fonctionnalités', 'Suche nach neuen Funktionen', 'Начать просмотр новых функций', 'Comienza a navegar por nuevas funciones', 'Yeni özelliklere göz atmaya başlayın', '开始浏览新特性'),
(217, 'import_limit_reached_upgrade', 'You have reached your import limit, upgrade to pro to import unlimited videos!', 'لقد وصلت إلى حد الاستيراد، وترقية إلى الموالية لاستيراد أشرطة الفيديو غير محدود!', 'Du har nådd importgrensen din, oppgrader til pro for å importere ubegrensede videoer!', 'Vous avez atteint votre limite d\'importation, passez à pro pour importer des vidéos illimitées!', 'Sie haben Ihr Importlimit erreicht, aktualisieren Sie auf Pro, um unlimitierte Videos zu importieren!', 'Вы достигли своего лимита импорта, обновляете pro для импорта неограниченного количества видео!', '¡Has alcanzado tu límite de importación, actualízate a pro para importar videos ilimitados!', 'İçe aktarma limitinize ulaştınız, sınırsız videoları içe aktarmak için yanlızca yükseltin!', '您已达到导入限制，请升级为导入无限制视频！'),
(218, 'upload_limit_reached_upgrade', 'You have reached your upload limit, upgrade to pro to upload unlimited videos!', 'لقد وصلت إلى حد التحميل، وترقية إلى الموالية لتحميل أشرطة الفيديو غير محدود!', 'Du har nådd opplastingsgrensen din, oppgrader til pro for å laste opp ubegrensede videoer!', 'Vous avez atteint votre limite de téléchargement, passez à pro pour télécharger des vidéos illimitées!', 'Du hast dein Upload-Limit erreicht, aktualisiere auf Pro, um unlimitierte Videos hochzuladen!', 'Вы достигли предела загрузки, обновляете до Pro для загрузки неограниченного количества видео!', 'Has alcanzado el límite de carga y actualízate a profesional para subir videos ilimitados.', 'Yükleme limitinize ulaştınız, sınırsız video yüklemek için profesyonelliğe geçin!', '您已达到上传限制，升级至专业版无限上传视频！'),
(219, 'import_limit_reached', 'You have reached your import limit', 'لقد وصلت إلى حد الاستيراد', 'Du har nådd importgrensen din', 'Vous avez atteint votre limite d\'importation', 'Sie haben Ihr Importlimit erreicht', 'Вы достигли своего предела импорта', 'Has alcanzado tu límite de importación', 'İçe aktarma limitinize ulaştınız.', '您已达到导入限制'),
(220, 'upload_limit_reached', 'You have reached your upload limit', 'لقد وصلت إلى حد التحميل', 'Du har nådd opplastingsgrensen din', 'Vous avez atteint votre limite de téléchargement', 'Du hast dein Upload-Limit erreicht', 'Вы достигли предела загрузки', 'Has alcanzado tu límite de carga', 'Yükleme limitinize ulaştınız.', '您已达到上传限制'),
(221, 'upgrade_now', 'Upgrade Now?', 'تحديث الآن؟', 'Oppgrader nå?', 'Mettre à jour maintenant?', 'Jetzt upgraden?', 'Обнови сейчас?', '¿Actualizar ahora?', 'Şimdi Yükselt?', '现在升级?'),
(222, 'error', 'Error!', 'خطأ!', 'Feil!', 'Erreur!', 'Fehler!', 'Ошибка!', '¡Error!', 'Hata!', '错误!'),
(223, 'error_msg', 'Something went wrong Please try again later!', 'هناك شئ خاطئ، يرجى المحاولة فى وقت لاحق!', 'Noe gikk galt. Prøv igjen senere!', 'Quelque chose c\'est mal passé. Merci d\'essayer plus tard!', 'Etwas ist schief gelaufen Bitte versuche es später noch einmal!', 'Что-то пошло не так. Пожалуйста, повторите попытку позже!', 'Algo salió mal. ¡Inténtalo de nuevo más tarde!', 'Bir şeyler yanlış oldu. Lütfen sonra tekrar deneyiniz!', '发生错误。请稍后再试！'),
(224, 'oops', 'Oops', 'وجه الفتاة', 'Oops', 'Oops', 'Hoppla', 'Ой', 'Uy', 'Hata', '哎呀'),
(225, 'write_a_reply', 'Write a comment and press ENTER', 'اكتب تعليق واضغط إنتر', 'Schrijf een reactie en druk op ENTER', 'Ecrire un commentaire et appuyez sur ENTER', 'Schreiben Sie einen Kommentar und drücken Sie ENTER.', 'Напишите комментарий и нажмите клавишу ВВОД', 'Escribe un comentario y presiona ENTER', 'Yorum yazın ve ENTER tuşuna basın', '编写评论并按回车键'),
(226, 'file_is_too_big', 'File is too big, Max upload size is', 'الملف كبير جدا، الحد الأقصى لحجم التحميل هو', 'Bestand is te groot, Max upload grootte is', 'Le fichier est trop grand, la taille maximale de téléchargement est', 'Datei ist zu groß, Max Upload-Größe ist', 'Файл слишком большой, максимальный размер загрузки', 'El archivo es demasiado grande, el tamaño máximo de carga es', 'Dosya çok büyük, Maks. Yükleme boyutu', '文件太大，最大上传大小为'),
(227, 'ads', 'Advertising', 'إعلان', 'Advertising', 'Publicité', 'Werbung', 'реклама', 'publicidad', 'reklâm', '广告'),
(228, 'wallet', 'Wallet', 'محفظة', 'portemonnee', 'Portefeuille', 'Geldbörse', 'бумажник', 'billetera', 'cüzdan', '钱包'),
(229, 'name', 'Name', 'اسم', 'naam', 'Nom', 'Name', 'имя', 'nombre', 'isim', '名称'),
(230, 'results', 'Results', 'النتائج', 'resultaten', 'Résultats', 'Ergebnisse', 'результаты', 'resultados', 'sonuçlar', '结果'),
(231, 'spent', 'Spent', 'أمضى', 'besteed', 'Dépensé', 'Ausgegeben', 'потраченное', 'gastado', 'harcanmış', '花费'),
(232, 'action', 'Action', 'عمل', 'actie', 'Action', 'Aktion', 'действие', 'acción', 'eylem', '操作'),
(233, 'clicks', 'Clicks', 'نقرات', 'klikken', 'Clics', 'Klicks', 'Щелчки', 'clics', 'Tıklanma', '点击'),
(234, 'create_ad', 'Create ad', 'إنشاء إعلان', 'Maak een advertentie', 'Créer une annonce', 'Anzeige erstellen', 'Создать объявление', 'Crear anuncio', 'Reklam oluştur', '创建广告'),
(235, 'my_balance', 'MY BALANCE', 'ماي بالانس', 'MIJN EVENWICHT', 'MON ÉQUILIBRE', 'MEINE BALANCE', 'МОЙ БАЛАНС', 'MI EQUILIBRIO', 'MY BALANCE', '我的平衡'),
(236, 'replenish_my_balance', 'Replenish My Balance', 'ريبلينيش بلدي التوازن', 'Vervult mijn saldo', 'Réapprovisionner mon équilibre', 'Füllen Sie mein Gleichgewicht auf', 'Пополнить баланс', 'Reponer mi saldo', 'Bakiyemi yenile', '补充我的平衡'),
(237, 'amount', 'Amount', 'كمية', 'bedrag', 'Montant', 'Betrag', 'Сумма', 'cantidad', 'miktar', '数量'),
(238, 'replenish', 'Replenish', 'سد النقص', 'bijvullen', 'Régénérer', 'Auffüllen', 'Пополнить', 'reponer', 'doldurmak', '补充'),
(239, 'create_new_ad', 'Create new ad', 'إنشاء إعلان جديد', 'Maak een nieuwe advertentie', 'Créer une nouvelle annonce', 'Neue Anzeige erstellen', 'Создать новое объявление', 'Crear nuevo anuncio', 'Yeni reklam oluştur', '创建新广告'),
(240, 'title', 'Title', 'لقب', 'titel', 'Titre', 'Titel', 'Название', 'título', 'başlık', '标题'),
(241, 'select_media', 'Select Media', 'حدد الوسائط', 'Selecteer media', 'Sélectionner un média', 'Medien auswählen', 'Выбрать носитель', 'Seleccionar medios', 'Medya Seç', '选择媒体'),
(242, 'pricing', 'Pricing', 'التسعير', 'pricing', 'Tarification', 'Preise', 'Ценообразование', 'la fijación de precios', 'Fiyatlandırma', '价格');
INSERT INTO `langs` (`id`, `lang_key`, `english`, `arabic`, `dutch`, `french`, `german`, `russian`, `spanish`, `turkish`, `china`) VALUES
(243, 'placement', 'Placement', 'وضع', 'plaatsing', 'Placement', 'Platzierung', 'Размещение', 'colocación', 'yerleştirme', '布局'),
(244, 'traget_audience', 'Target Audience', 'الجمهور المستهدف', 'Doelgroep', 'Public cible', 'Zielgruppe', 'Целевая аудитория', 'Audiencia objetivo', 'Hedef Kitle', '目标观众'),
(245, 'video_ad', 'Videos (Format Video / Image)', 'مقاطع الفيديو (تنسيق الفيديو / الصورة)', 'Video\'s (video / afbeelding opmaken)', 'Vidéos (format vidéo / image)', 'Videos (Format Video / Bild)', 'Видео (формат видео / изображение)', 'Videos (Formato de video / imagen)', 'Videolar (Biçim Video / Resim)', '视频(视频格式 / 图片)'),
(246, 'page_ad', 'Sidebar (Format Image)', 'الشريط الجانبي (تنسيق الصورة)', 'Zijbalk (opmaakafbeelding)', 'Barre latérale (format image)', 'Seitenleiste (Bild formatieren)', 'Боковая панель (формат изображения)', 'Barra lateral (Imagen de formato)', 'Kenar Çubuğu (Biçim Resim)', 'Sidebar (Format Image)'),
(247, 'cost_click', 'Pay Per Click', 'الدفع لكل نقرة', 'Betaal per klik', 'Payer par clic', 'Zahlen pro Klick', 'Оплатить за клик', 'Pago por clic', 'Tıklama Başı Ödeme', '点击付费'),
(248, 'cost_view', 'Pay Per Impression', 'الدفع لكل ظهور', 'Betaal per indruk', 'Pay Per Impression', 'Bezahlen pro Eindruck', 'Оплатить за показ', 'Pago por impresión', 'Gösterim Başı Ödeme', '支付记录'),
(249, 'invalid_name', 'Name must be between 5/32', 'يجب أن يكون الاسم بين 5/32', 'Naam moet tussen 5/32 zijn', 'Le nom doit être entre 5/32', 'Name muss zwischen 5/32 liegen', 'Имя должно быть от 5/32', 'El nombre debe estar entre 5/32', 'Ad 5/32 arasında olmalıdır', '名称必须在5/32'),
(250, 'invalid_url', 'The URL is invalid. Please enter a valid URL', 'عنوان ورل غير صالح. الرجاء إدخال عنوان ورل صالح', 'De URL is ongeldig. Voer een geldige URL in', 'L\'URL est invalide. Veuillez entrer une URL valide', 'Die URL ist ungültig. Bitte geben Sie eine gültige URL ein', 'Недопустимый URL. Введите действительный URL-адрес', 'La URL no es válida. Por favor ingrese una URL válida', 'URL geçersiz. Lütfen geçerli bir URL girin', '请输入有效的URL'),
(251, 'invalid_ad_title', 'Ad title must be between 5/100', 'يجب أن يكون عنوان الإعلان بين 5/100', 'De advertentietitel moet tussen 5/100 zijn', 'Le titre de l\'annonce doit être compris entre 5/100', 'Der Anzeigentitel muss zwischen 5/100 liegen', 'Название объявления должно быть от 5/100', 'El título del anuncio debe estar entre 5/100', 'Reklam başlığı 5/100 arasında olmalıdır.', '广告标题必须在 5/100'),
(252, 'invalid_videoad_media', 'Media file is invalid. Please select a valid image / video', 'ملف الوسائط غير صالح. الرجاء تحديد صورة / فيديو صالح', 'Mediabestand is ongeldig. Selecteer een geldige afbeelding / video', 'Le fichier multimédia est invalide. Veuillez sélectionner une image / vidéo valide', 'Mediendatei ist ungültig. Bitte wählen Sie ein gültiges Bild / Video aus', 'Недопустимый файл мультимедиа. Выберите действительное изображение / видео', 'El archivo multimedia no es válido. Seleccione una imagen / video válido', 'Medya dosyası geçersiz. Lütfen geçerli bir resim / video seçin', '媒体文件无效。 请选择一个有效的图像/视频'),
(253, 'invalid_pagead_media', 'Media file is invalid. Please select a valid image', 'ملف الوسائط غير صالح. الرجاء تحديد صورة صالحة', 'Mediabestand is ongeldig. Selecteer een geldige afbeelding', 'Le fichier multimédia est invalide. Veuillez sélectionner une image valide', 'Mediendatei ist ungültig. Bitte wählen Sie ein gültiges Bild', 'Недопустимый файл мультимедиа. Выберите действительное изображение', 'El archivo multimedia no es válido. Seleccione una imagen válida', 'Medya dosyası geçersiz. Lütfen geçerli bir resim seçin', '媒体文件无效。 请选择一个有效的图像'),
(254, 'edit_ad', 'Edit ad', 'تعديل الإعلان', 'Advertentie bewerken', 'Modifier l\'annonce', 'Anzeige bearbeiten', 'Изменить объявление', 'Editar anuncio', 'Reklamı düzenle', '编辑广告'),
(255, 'by', 'By', 'بواسطة', 'door', 'Par', 'Von', 'по', 'por', 'tarafından', '通过'),
(256, 'more_info', 'More Info', 'مزيد من المعلومات', 'Meer info', 'Plus d\'infos', 'Mehr Infos', 'Дополнительная информация', 'Más información', 'Daha Fazla Bilgi', '更多信息'),
(257, 'monetization', 'Monetization', 'تسييل', 'monetization', 'Monétisation', 'Monetarisierung', 'монетизация', 'monetización', 'Para Kazanma', '货币'),
(258, 'monetization_settings', 'Monetization Settings', 'إعدادات تحقيق الدخل', 'Instellingen voor inkomsten genereren', 'Paramètres de monétisation', 'Monetarisierungseinstellungen', 'Настройки монетизации', 'Configuración de monetización', 'Para Kazandırma Ayarları', '货币设置'),
(259, 'withdrawals', 'Withdrawals', 'السحب', 'onttrekkingen', 'Retraits', 'Abhebungen', 'Изъятия', 'Los retiros', 'Çekme', '提款'),
(260, 'balance', 'Available balance', 'الرصيد المتاح', 'Beschikbare balans', 'Solde disponible', 'Verfügbare Bilanz', 'Доступный баланс', 'Saldo disponible', 'Kullanılabilir bakiye', '可用余额'),
(261, 'min', 'Min', 'دقيقة', 'min', 'Min', 'Min', 'мин', 'min', 'min', 'Min'),
(262, 'submit_withdrawal_request', 'Submit withdrawal request', 'إرسال طلب السحب', 'Verzoek tot opname indienen', 'Envoyer une demande de retrait', 'Abhebungsanfrage einreichen', 'Отправить запрос', 'Enviar solicitud', 'Istek gönder', '提交取款请求'),
(263, 'cant_request_withdrawal', 'You can not submit withdrawal request until the previous requests has been approved / rejected', 'لا يمكنك إرسال طلب', 'U kunt geen aanvraag indienen', 'Vous ne pouvez pas soumettre une demande', 'Sie können keine Anfrage senden', 'Вы не можете отправить запрос до тех пор, пока предыдущий запрос не будет одобрен / отклонен', 'No puede enviar la solicitud hasta que la solicitud anterior haya sido aprobada / rechazada', 'Önceki istek onaylanana / reddedilene kadar istekte bulunamazsınız', '在先前的请求被批准/拒绝之前，您不能提交取款请求'),
(264, 'withdrawal_request_amount_is', 'Your balance is {{BALANCE}}, the minimum withdrawal request amount is 50:', 'رصيدك هو {{بالانس}}، الحد الأدنى لطلب السحب هو 50:', 'Uw saldo is {{BALANCE}}, het minimum opnameverzoek is 50:', 'Votre solde est {{BALANCE}}, la demande de retrait minimum est de 50:', 'Ihr Guthaben ist {{BALANCE}}, die Mindestanzahl der Auszahlungen beträgt 50:', 'Ваш баланс {{BALANCE}}, минимальный запрос на изъятие составляет 50:', 'Su saldo es {{BALANCE}}, la solicitud mínima de retiro es 50:', 'Bakiyeniz {{BALANCE}}, minimum para çekme isteği 50\'dir:', 'Your balance is {{BALANCE}}, the minimum withdrawal request amount is 50:'),
(265, 'min_withdrawal_request_amount_is', 'The minimum withdrawal request is 50:', 'الحد الأدنى لطلب السحب هو 50:', 'Het minimale opnameverzoek is 50:', 'La demande de retrait minimum est de 50:', 'Die minimale Auszahlungsanforderung ist 50:', 'Минимальный запрос на изъятие составляет 50:', 'La solicitud mínima de retiro es 50:', 'Minimum para çekme talebi 50\'dir:', '最低提款要求是50：'),
(266, 'withdrawal_request_sent', 'Your withdrawal request has been successfully sent!', 'تم إرسال طلب السحب بنجاح!', 'Uw opnameverzoek is met succes verzonden!', 'Votre demande de retrait a bien été envoyée!', 'Ihre Auszahlungsanfrage wurde erfolgreich versendet!', 'Ваш запрос на удаление был успешно отправлен!', '¡Su solicitud de retiro ha sido enviada con éxito!', 'Çekilme isteğiniz başarıyla gönderildi!', '您的取款请求已成功发送！'),
(267, 'enabled', 'Enabled', 'تمكين', 'ingeschakeld', 'Activé', 'Aktiviert', 'Включено', 'Activado', 'Etkin', '启用'),
(268, 'disabled', 'Disabled', 'معاق', 'invalide', 'Désactivé', 'Deaktiviert', 'Выключено', 'discapacitado', 'engelli', '禁用'),
(269, 'withdrawals_history', 'Withdrawals History', 'انسحابات التاريخ', 'Opnames geschiedenis', 'Historique des retraits', 'Abhebungen Geschichte', 'История изъятий', 'Historia de Retiros', 'Para Çekme Tarihi', '提款记录'),
(270, 'rejected', 'Rejected', 'مرفوض', 'verworpen', 'Rejeté', 'Abgelehnt', 'отвергнуто', 'rechazado', 'reddedilen', '拒绝'),
(271, 'accepted', 'Accepted', 'قبلت', 'geaccepteerd', 'Accepté', 'Akzeptiert', 'Принято', 'aceptado', 'kabul', '接受'),
(272, 'requested_at', 'Requested at', 'طلب في', 'Gevraagd om', 'Demandé à', 'Angefordert bei', 'Запрошено на', 'Solicitado en', 'Adresinden istendi', '要求在'),
(273, 'confirm_delete_ad', 'Are you sure you want to delete this ad?', 'هل تريد بالتأكيد حذف هذا الإعلان؟', 'Weet je zeker dat je deze advertentie wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer cette annonce?', 'Möchten Sie diese Anzeige wirklich löschen?', 'Вы уверены, что хотите удалить это объявление?', '¿Seguro que quieres eliminar este anuncio?', 'Bu reklamı silmek istediğinizden emin misiniz?', '你确定要删除该广告？'),
(274, 'ad_published', 'Your ad has been published successfully', 'إعلانك هنا', 'Uw advertentie is hier', 'Votre annonce est ici', 'Ihre Anzeige ist hier', 'Ваше объявление успешно опубликовано', 'Su anuncio ha sido publicado con éxito', 'Reklamınız başarıyla yayınlandı', '您的广告已成功发布'),
(275, 'ad_saved', 'Your changes to the ad were successfully saved', 'تغييراتك إلى الأفضل', 'Uw wijzigingen in de beste', 'Vos changements au meilleur', 'Ihre Änderungen an den besten', 'Ваши изменения в объявлении были успешно сохранены', 'Sus cambios en el anuncio se guardaron con éxito', 'Reklamdaki değişiklikler başarıyla kaydedildi', '您对广告所做的更改已成功保存'),
(276, 'pending', 'Pending', 'ريثما', 'in afwachting van', 'en attente', 'anstehend', 'в ожидании', 'pendiente', 'kadar', '挂起'),
(277, 'balance_is_0', 'Your current wallet balance is: 0, please top up your wallet to continue.', 'رصيد المحفظة الحالي هو: 0، يرجى متابعة محفظتك للمتابعة.', 'Uw huidige portemonneebalans is: 0, vul uw portemonnee aan om door te gaan.', 'Votre solde de portefeuille actuel est: 0, veuillez compléter votre portefeuille pour continuer.', 'Ihre aktuelle Brieftasche Gleichgewicht ist: 0, bitte nach oben Ihre Brieftasche, um fortzufahren.', 'Ваш текущий баланс кошелька: 0, пожалуйста, пополните свой кошелек, чтобы продолжить.', 'Su saldo de cartera actual es: 0, por favor, recargue su cartera para continuar.', 'Mevcut cüzdan bakiyeniz: 0, devam etmek için lütfen cüzdanınızı doldurun.', '您当前的钱包余额为：0，请将您的钱包充值以继续。'),
(278, 'top_up', 'Top Up', 'أشحن', 'Top Up', 'Remplir', 'Nachfüllen', 'Пополнить', 'Completar', 'Ekleyin', '充值'),
(279, 'earn_mon', 'Earn ({{CONFIG pub_price}} {{CONFIG payment_currency}}) for each advertisement click you get from your videos!', 'اربح ({{CONFIG pub_price}} {{CONFIG payment_currency}}) لكل إعلان يتم النقر عليه من مقاطع الفيديو التابعة لك', 'Verdien ({{CONFIG pub_price}} {{CONFIG payment_currency}}) voor elke advertentieklik die je krijgt van je video\'s!', 'Gagnez ({{CONFIG pub_price}} {{CONFIG payment_currency}}) pour chaque annonce que vous recevez de vos vidéos!', 'Verdiene ({{CONFIG pub_price}} {{CONFIG payment_currency}}) für jeden Werbeclick, den du aus deinen Videos erhältst!', 'Заработайте ({{CONFIG pub_price}} {{CONFIG payment_currency}}) для каждого рекламного клика, который вы получаете от своих видео!', 'Gane ({{CONFIG pub_price}} {{CONFIG payment_currency}}) por cada clic publicitario que obtenga de sus videos.', 'Videolarınızdan aldığınız her bir reklam tıklaması için {{CONFIG pub_price}} {{CONFIG payment_currency}} kazanın!', '赚取（0.02美元）为每个广告点击你从你的影片！'),
(280, 'get_verified', 'Get verified', 'الحصول على التحقق', 'Wordt geverifieerd', 'Être vérifié', 'Verifiziert werden', 'Пройти проверку', 'Verifícate', 'Onaylanmış olmak', '获得验证'),
(281, 'u_are_verified', 'Congratulations, you are verified. Thanks for verifying your ID', 'تهانينا، لقد تم إثبات ملكيتك. نشكرك على إثبات هويتك', 'Gefeliciteerd, je bent geverifieerd. Bedankt voor het verifiëren van uw ID', 'Félicitations, vous êtes vérifié. Merci d\'avoir vérifié votre identifiant', 'Herzlichen Glückwunsch, du bist verifiziert. Vielen Dank für die Bestätigung Ihrer ID', 'Поздравляем, вы подтверждены. Спасибо, что подтвердили свой идентификатор', 'Felicidades, estás verificado. Gracias por verificar tu ID', 'Tebrikler, doğrulanmışsın. Kimliğinizi doğruladığınız için teşekkür ederiz', '恭喜，你已验证。 感谢您验证您的ID'),
(282, 'verif_request_received', 'Your request was received and is pending approval', 'تم استلام طلبك وهو في انتظار الموافقة', 'Uw aanvraag is ontvangen en wacht op goedkeuring', 'Votre demande a été reçue et est en attente d\'approbation', 'Ihre Anfrage wurde empfangen und steht noch aus.', 'Ваш запрос был получен и находится на рассмотрении', 'Su solicitud fue recibida y está pendiente de aprobación', 'Talebiniz alındı ve onay bekliyor', '您的请求已收到，正在等待批准'),
(283, 'upload_id', 'Upload Passport or ID', 'تحميل جواز السفر أو الهوية', 'Upload paspoort of ID', 'Télécharger un passeport ou un identifiant', 'Reisepass oder ID hochladen', 'Загрузить паспорт или идентификатор', 'Cargar pasaporte o ID', 'Pasaport veya Kimliği Yükle', '上传护照或身份证'),
(284, 'select_id', 'Please select a recent picture of your passport or id', 'يرجى تحديد صورة حديثة لجواز السفر أو الهوية', 'Selecteer een recente foto van uw paspoort of id', 'Veuillez sélectionner une photo récente de votre passeport ou identifiant', 'Bitte wählen Sie ein aktuelles Bild Ihres Passes oder Ihrer ID', 'Пожалуйста, выберите последнее изображение своего паспорта или идентификатора', 'Seleccione una foto reciente de su pasaporte o identificación', 'Lütfen pasaportunuzun veya kimlik numaranızın son bir resmini seçin', '请选择最近的护照或身份证照片'),
(285, 'choose_file', 'Choose File', 'اختر ملف', 'Kies bestand', 'Choisir le fichier', 'Datei wählen', 'Выберите файл', 'Elija el archivo', 'Dosya seçin', '选择文件'),
(286, 'submit_request', 'Submit request', 'تقديم الطلب', 'Aanvraag indienen', 'Envoyer la demande', 'Anfrage einreichen', 'Отправить запрос', 'Enviar peticion', 'İstek gönderin', '提交请求'),
(287, 'submit_verif_request_error', 'You can not submit verification request until the previous requests has been accepted / rejected', 'لا يمكنك إرسال طلب التحقق إلى أن يتم قبول الطلبات السابقة أو رفضها', 'U kunt geen verificatieverzoek indienen totdat de vorige verzoeken zijn geaccepteerd / afgewezen', 'Vous ne pouvez pas soumettre de demande de vérification tant que les demandes précédentes n\'ont pas été acceptées / rejetées', 'Sie können keine Überprüfungsanfrage senden, bis die vorherigen Anforderungen akzeptiert / abgelehnt wurden.', 'Вы не можете отправить запрос на подтверждение до тех пор, пока предыдущие запросы не будут приняты / отклонены', 'No puede enviar solicitud de verificación hasta que las solicitudes anteriores hayan sido aceptadas / rechazadas', 'Önceki istekler kabul / reddedilene kadar doğrulama isteği gönderemezsiniz.', '在先前的请求已被接受/拒绝之前，您无法提交验证请求'),
(288, 'ivalid_last_name', 'Last name is too long!', 'اسم العائلة طويل جدا!', 'Achternaam is te lang!', 'Le nom de famille est trop long!', 'Nachname ist zu lang!', 'Фамилия слишком длинная!', '¡El apellido es demasiado largo!', 'Soyadı çok uzun!', '姓氏太长了！'),
(289, 'ivalid_image_file', 'The Image file is Not valid.please select a valid picture!', 'ملف الصورة غير صالح.الرجاء تحديد صورة صالحة!', 'Het afbeeldingsbestand is niet geldig. Selecteer een geldige foto!', 'Le fichier Image n\'est pas valide. Veuillez sélectionner une image valide!', 'Die Bilddatei ist nicht gültig. Bitte wählen Sie ein gültiges Bild aus!', 'Файл изображения недействителен. Выберите правильное изображение!', 'El archivo de imagen no es válido. ¡Por favor seleccione una imagen válida!', 'Resim dosyası geçerli değil. Geçerli bir resim seçin!', '图像文件无效。请选择一个有效的图片！'),
(290, 'ivalid_id_file', 'The passport/ID picture must be an image', 'يجب أن تكون صورة الجواز / الهوية صورة', 'Het paspoort / ID-beeld moet een afbeelding zijn', 'L\'image du passeport / ID doit être une image', 'Das Pass / ID-Bild muss ein Bild sein', 'Паспорт / удостоверение личности должно быть изображением', 'El pasaporte / foto de identificación debe ser una imagen', 'Pasaport / kimlik resmi bir resim olmalıdır.', '护照/身份证照片必须是图片'),
(291, 'verif_request_sent', 'Your request was successfully sent and will be in the near future reviwed!', 'تم إرسال طلبك بنجاح وسوف تكون في المستقبل القريب ريفيويد!', 'Uw aanvraag is met succes verzonden en zal in de nabije toekomst worden herzien!', 'Votre demande a été envoyée avec succès et sera dans un futur proche reviwed!', 'Ihre Anfrage wurde erfolgreich versendet und wird in naher Zukunft reviwed sein!', 'Ваш запрос был успешно отправлен и будет в ближайшее время изменен!', 'Su solicitud fue enviada con éxito y será reviwed en el futuro cercano.', 'Talebiniz başarıyla gönderildi ve yakın gelecekte yeniden incelenecek!', '您的请求已成功发送，并将在不久的将来进行审核！'),
(292, 'unknown_error', 'Error: an unknown error occurred. Please try again later', 'خطأ: حدث خطأ غير معروف. الرجاء معاودة المحاولة في وقت لاحق', 'Fout: er is een onbekende fout opgetreden. Probeer het later opnieuw', 'Erreur: une erreur inconnue s\'est produite. Veuillez réessayer plus tard', 'Fehler: Ein unbekannter Fehler ist aufgetreten. Bitte versuche es später noch einmal', 'Ошибка: произошла неизвестная ошибка. Пожалуйста, повторите попытку позже', 'Error: se produjo un error desconocido. Por favor, inténtelo de nuevo más tarde', 'Hata: Bilinmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyiniz', '错误：发生未知错误。 请稍后再试'),
(293, 'ivalid_thumb_file', 'Thumbnail image file is invalid. Please select a valid image', 'ملف الصورة المصغرة غير صالح. الرجاء تحديد صورة صالحة', 'Miniatuurafbeeldingsbestand is ongeldig. Selecteer een geldige afbeelding', 'Le fichier d\'image miniature est invalide. Veuillez sélectionner une image valide', 'Miniaturbilddatei ist ungültig. Bitte wählen Sie ein gültiges Bild', 'Недопустимый файл изображения миниатюр. Выберите действительное изображение', 'El archivo de imagen en miniatura no es válido. Seleccione una imagen válida', 'Küçük resim dosyası geçersiz. Lütfen geçerli bir resim seçin', '缩略图图像文件无效。 请选择一个有效的图像'),
(294, 'hide', 'Hide', 'إخفاء', 'Verbergen', 'Cacher', 'Verbergen', 'Спрятать', 'Esconder', 'Saklamak', '隐藏'),
(295, 'message', 'Message', 'رسالة', 'Bericht', 'Message', 'Botschaft', 'Сообщение', 'Mensaje', 'Mesaj', '信息'),
(296, 'notifications', 'Notifications', 'إخطارات', 'Varsler', 'Notifications', 'Benachrichtigungen', 'Уведомления', 'Notificaciones', 'Bildirimler', '通知'),
(297, 'subscribed_u', 'subscribed to your channel', 'مشترك في قناتك', 'abonnerer på kanalen din', 'abonné à votre chaîne', 'abonniert deinen Kanal', 'подписался на ваш канал', 'suscrito a tu canal', 'kanalınıza abone', '订阅您的频道'),
(298, 'unsubscribed_u', 'unsubscribed from your channel', 'غير مشترك من قناتك', 'avmeldt fra kanalen din', 'désabonné de votre chaîne', 'von deinem Kanal abgemeldet', 'отписался с вашего канала', 'anulado de su canal', 'kanalınızdan aboneliğiniz iptal edildi', '取消订阅您的频道'),
(299, 'liked_ur_video', 'liked your video', 'أعجبك الفيديو', 'likte videoen din', 'aimé votre vidéo', 'mochte dein Video', 'понравилось ваше видео', 'me gustó tu video', 'videonuzu beğendim', '点赞你的视频'),
(300, 'disliked_ur_video', 'disliked your video', 'لم يعجبك الفيديو', 'Mislikte videoen din', 'n\'aimait pas votre vidéo', 'hat dein Video nicht gefallen', 'не понравилось ваше видео', 'disgustó tu video', 'videonun beğenilmediğini', '不喜欢你的视频'),
(301, 'commented_ur_video', 'commented on your video', 'علق على الفيديو التابع لك', 'kommenterte videoen din', 'a commenté votre vidéo', 'hat dein Video kommentiert', 'прокомментировал ваше видео', 'comentó tu video', 'videonuza yorum yaptı', '评论你的视频'),
(302, 'liked_ur_comment', 'liked your comment', 'أحب تعليقك', 'likte din kommentar', 'aimé ton commentaire', 'mochte deinen Kommentar', 'понравился ваш комментарий', 'le gustó su comentario', 'Yorumu beğeniyor', '赞了你的评论'),
(303, 'disliked_ur_comment', 'disliked your comment', 'لم يعجبك تعليقك', 'Mislikte din kommentar', 'n\'aimait pas ton commentaire', 'hat deinen Kommentar nicht gefallen', 'не понравился ваш комментарий', 'disgustado su comentario', 'yorumunu beğenmedi', '不喜欢你的评论'),
(304, 'replied_2ur_comment', 'replied to your comment', 'أجاب على تعليقك', 'svarte på din kommentar', 'a répondu à votre commentaire', 'antwortete auf deinen Kommentar', 'ответил на ваш комментарий', 'respondió a tu comentario', 'senin yorumuna cevap verdi', '举报你的评论'),
(305, 'cancel_report', 'Cancel Report', 'إلغاء التقرير', 'Avbryt rapport', 'Annuler le rapport', 'Bericht abbrechen', 'Отменить отчет', 'Cancelar informe', 'Raporu İptal Et', '取消举报'),
(306, 'no_more_videos', 'No more videos found', 'لم يتم العثور على مزيد من مقاطع الفيديو', 'Ingen flere videoer funnet', 'Plus de vidéos trouvées', 'Keine weiteren Videos gefunden', 'Больше видео не найдено', 'No se encontraron más videos', 'Başka video bulunamadı', '没有发现更多视频'),
(307, 'load_more', 'Load more', 'تحميل المزيد', 'Last mer', 'Charger plus', 'Mehr laden', 'Показать больше', 'Carga más', 'Daha fazla yükle', '加载更多'),
(308, 'report_zs_video', 'Report this video', 'ابلغ عن هذا الفيديو', 'Rapporter denne videoen', 'Signaler cette vidéo', 'Melde dieses Video', 'Сообщить об этом видео', 'Reporta este video', 'Bu videoyu rapor et', '举报此视频'),
(309, 'write_vr_summary', 'Please write a summary of what this video was about', 'يرجى كتابة ملخص عن هذا الفيديو', 'Vennligst skriv et sammendrag av hva denne videoen handlet om', 'S\'il vous plaît écrire un résumé de ce que cette vidéo était sur', 'Bitte schreibe eine Zusammenfassung darüber, worum es in diesem Video ging', 'Пожалуйста, напишите резюме того, о чем это видео было', 'Por favor, escribe un resumen de lo que este video fue sobre', 'Lütfen bu videonun neye ait olduğunu özetleyin', '请写下这个视频关于什么的摘要'),
(310, 'submit', 'Submit', 'خضع', 'Sende inn', 'Soumettre', 'einreichen', 'Отправить', 'Enviar', 'Gönder', '提交'),
(311, 'thank_u', 'Thank you', 'شكرا لكم', 'Takk skal du ha', 'Je vous remercie', 'Vielen Dank', 'Спасибо', 'Gracias', 'teşekkür ederim', '非常感谢'),
(312, 'we_received_ur_rep', 'We have received your report!', 'لقد تلقينا تقريرك!', 'Vi har mottatt din rapport!', 'Nous avons reçu votre rapport!', 'Wir haben Ihren Bericht erhalten!', 'Мы получили ваш отчет!', '¡Hemos recibido su informe!', 'Raporunuzu aldık!', '我们已收到您的举报'),
(313, 'report_canceled', 'Your report has been canceled!', 'تم إلغاء تقريرك!', 'Rapporten din er kansellert!', 'Votre rapport a été annulé!', 'Ihr Bericht wurde storniert!', 'Ваш отчет отменен!', '¡Su informe ha sido cancelado!', 'Raporunuz iptal edildi!', '您的举报已被取消！'),
(314, 'comment_pinned', 'Comment pinned to top', 'تم تعليق التعليق إلى الأعلى', 'Kommentar festet til toppen', 'Commentaire épinglé en haut', 'Kommentar nach oben gepinnt', 'Комментарий прикреплен к верхней части', 'Comentario anclado al principio', 'Yorum en üste sabitlendi', '评论固定在顶部'),
(315, 'comment_unpinned', 'Comment unpinned', 'تم إلغاء تثبيت التعليق', 'Kommentar unpinned', 'Commentaire détaché', 'Kommentar nicht gepinnt', 'Комментарий откреплен', 'Comentario sin fijar', 'Sabitsiz yorum', '评论取消固定'),
(316, 'porcessing_video', 'Processing your video - this may take a few minutes', 'معالجة الفيديو - قد يستغرق ذلك بضع دقائق', 'Je video verwerken - dit kan een paar minuten duren', 'Traitement de votre vidéo - cela peut prendre quelques minutes', 'Verarbeitung deines Videos - dies kann einige Minuten dauern', 'Обработка вашего видео - это может занять несколько минут', 'Procesando su video: esto puede demorar unos minutos', 'Videonuzu işlemek - bu birkaç dakika alabilir', '处理您的视频 - 这可能需要几分钟的时间'),
(317, 'video_thumbs', 'Video thumbnails', 'الصور المصغرة الفيديو', 'Videominiaturen', 'vignettes vidéo', 'Video-Miniaturansichten', 'Видео эскизы', 'Miniaturas de vídeo', 'Video küçük resimleri', '视频封面'),
(318, 'ur_video_porcessing', 'This video is being converted to few resolutions, it may take a few minutes.', 'يتم تحويل الفيديو، قد يستغرق بضع دقائق', 'Video wordt geconverteerd, dit kan enkele minuten duren', 'La vidéo est convertie, cela peut prendre quelques minutes', 'Video wird konvertiert, es kann einige Minuten dauern', 'Видео конвертируется, это может занять несколько минут', 'El video se convierte, puede tomar unos minutos', 'Video dönüştürülür, birkaç dakika sürebilir.', '此视频正在转换为少数分辨率，可能需要几分钟时间。'),
(319, 'this_video_porcessing', 'This video is being processed, please come back in few minutes', 'تتم معالجة هذا الفيديو، يرجى العودة في غضون بضع دقائق', 'Deze video wordt verwerkt. Kom over een paar minuten terug', 'Cette vidéo est en cours de traitement, revenez dans quelques minutes', 'Dieses Video wird gerade bearbeitet. Bitte kommen Sie in ein paar Minuten zurück', 'Это видео обрабатывается, пожалуйста, вернитесь через несколько минут', 'Este video está siendo procesado, vuelve en unos minutos', 'Bu video işleniyor, lütfen birkaç dakika içinde geri dönün', '此视频正在处理中，请在几分钟后再回来'),
(320, 'mode', 'Mode', 'الوضع', 'mode', 'Mode', 'Modus', 'Режим', 'Modo', 'kip', '模式'),
(321, 'day_mode', 'Day mode', 'وضع اليوم', 'Dagmodus', 'Mode jour', 'Tagesmodus', 'Дневной режим', 'Modo día', 'Gün modu', '白天模式'),
(322, 'night_mode', 'Night mode', 'الوضع الليلي', 'Nachtstand', 'Mode nuit', 'Nacht-Modus', 'Ночной режим', 'Modo nocturno', 'Gece modu', '夜晚模式'),
(323, 'sort_by', 'Sort by', 'ترتيب حسب', 'Sorteer op', 'Trier par', 'Sortiere nach', 'Сортировать по', 'Ordenar por', 'Göre sırala', '排序方式'),
(324, 'top_commnets', 'Top Comments', 'أعلى تعليقات', 'Top Reacties', 'Meilleures Commentaires', 'Beste Kommentare', 'Лучшие комментарии', 'Top Comentarios', 'En Çok Yorumlananlar', '热门评论'),
(325, 'last_commnets', 'Latest comments', 'أحدث تعليقات', 'Laatste Reacties', 'Derniers Commentaires', 'Neueste Kommentare', 'Последние комментарии', 'Últimos comentarios', 'Son Yorumlar', '最新评论'),
(326, 'darg_drop_video', 'Drag & Drop video', 'سحب وإسقاط الفيديو', 'Video slepen en neerzetten', 'Drag & Drop vidéo', 'Video per Drag & Drop', 'Перетащите сюда видео', 'Arrastrar y soltar video', 'Sürükle ve Bırak video', '拖放视频'),
(327, 'click_2choose_file', 'click to select a file', 'انقر لتحديد ملف', 'klik om een bestand te selecteren', 'cliquez pour sélectionner un fichier', 'Klicken Sie, um eine Datei auszuwählen', 'нажмите, чтобы выбрать файл', 'haga clic para seleccionar un archivo', 'bir dosya seçmek için tıklayın', '点击选择一个文件'),
(328, 'or', 'or', 'أو', 'of', 'ou', 'oder', 'или', 'o', 'veya', '或'),
(329, 'contact_us', 'Contact us', 'اتصل بنا', 'Neem contact met ons op', 'Contactez nous', 'Kontaktiere uns', 'Свяжитесь с нами', 'Contáctenos', 'Bizimle iletişime geçin', '联系我们'),
(330, 'email', 'E-mail', 'البريد الإلكتروني', 'E-mail', 'E-mail', 'E-mail', 'E-mail', 'E-mail', 'E-mail', '电子邮件'),
(331, 'added_new_video', 'added a new video', 'نشر فيديو جديد', 'nieuwe video toegevoegd', 'Ajout d&#039;une nouvelle vidéo', 'neues Video hinzugefügt', 'добавлено новое видео', 'video nuevo agregado', 'yeni video eklendi', '添加新视频'),
(332, 'added_new_video', 'added a new video', 'نشر فيديو جديد', 'nieuwe video toegevoegd', NULL, 'neues Video hinzugefügt', 'добавлено новое видео', 'video nuevo agregado', 'yeni video eklendi', '添加新视频'),
(333, 'messages', 'Messages', 'رسائل', 'berichten', 'messages', 'Mitteilungen', 'Сообщения', 'Mensajes', 'Mesajlar', '信息'),
(334, 'are_you_sure_you_want_delete_chat', 'Are you sure that you want to delete the conversation?', 'هل تريد بالتأكيد حذف المحادثة؟', 'Weet je zeker dat je het gesprek wilt verwijderen?', 'Êtes-vous sûr de vouloir supprimer la conversation?', 'Möchten Sie die Unterhaltung wirklich löschen?', 'Вы уверены, что хотите удалить разговор?', '¿Estás seguro de que quieres eliminar la conversación?', 'Sohbeti silmek istediğinizden emin misiniz?', '你确定要删除对话吗？'),
(335, 'no_messages_found_hi', 'No messages were found, say Hi!', 'لم يتم العثور على رسائل، ويقول مرحبا!', 'Er zijn geen berichten gevonden, bijvoorbeeld Hallo!', NULL, 'Keine Nachrichten gefunden, sagen Hallo!', 'Сообщения не найдены, скажите Привет!', 'No se encontraron mensajes, decir Hola!', 'Mesaj bulunamadı, merhaba deyin!', '没有消息被发现，嗨！'),
(336, 'no_messages_found_channel', 'No messages were found, please choose a channel to chat.', 'لم يتم العثور على أية رسائل، يرجى اختيار قناة للدردشة.', 'Er zijn geen berichten gevonden. Kies een kanaal om te chatten.', NULL, 'Es wurden keine Nachrichten gefunden. Wähle einen Chat-Kanal aus.', 'Сообщения не найдены, выберите канал для чата.', 'No se encontraron mensajes, elija un canal para chatear.', 'Hiçbir mesaj bulunamadı, lütfen sohbet etmek için bir kanal seçin.', '没有消息被发现，请选择一个频道聊天。'),
(337, 'no_match_found', 'No match found', 'لا يوجد تطابق', 'Geen overeenkomst gevonden', 'Pas de résultat trouvé', 'Keine Übereinstimmung gefunden', 'Не найдено совпадений', 'No se encontraron coincidencias', 'Eşleşme bulunamadı', '未找到匹配项'),
(338, 'message', 'Message', 'رسالة', 'Bericht', 'Message', 'Botschaft', 'Сообщение', 'Mensaje', 'Mesaj', '信息'),
(339, 'write_message', 'Write your message and hit enter..', 'اكتب رسالتك واضغط على إنتر ..', 'Schrijf je bericht en druk op enter ..', 'Rédigez votre message et appuyez sur Entrée.', 'Schreibe deine Nachricht und drücke Enter.', 'Напишите свое сообщение и нажмите enter.', 'Escriba su mensaje y presione enter ...', 'Mesajınızı yazın ve enter tuşuna basın ..', '写下你的信息，然后回车'),
(346, 'channels', 'Channels', 'قنوات', 'kanalen', 'Chaînes', 'Kanäle', 'каналы', 'Canales', 'Kanallar', '频道'),
(347, 'recent_articles', 'Most recent articles', 'أحدث المقالات', 'Meest recente artikelen', 'Articles les plus récents', 'Neueste Artikel', 'Последние статьи', 'Artículos más recientes', 'En yeni makaleler', '最近文章'),
(348, 'read_more', 'Read more', 'اقرأ أكثر', 'Lees verder', 'Lire la suite', 'Weiterlesen', 'Прочитайте больше', 'Lee mas', 'Daha fazla oku', '阅读更多'),
(349, 'removed_history', 'Removed from History', 'تمت إزالته من السجل', 'Verwijderd uit de geschiedenis', NULL, 'Aus dem Verlauf entfernt', 'Удалено из истории', 'Eliminado de la historia', 'Geçmişten kaldırıldı', '从历史记录中删除'),
(350, 'show_less', 'Show less', 'عرض أقل', 'Vis mindre', 'Montre moins', 'Zeige weniger', 'Показывай меньше', 'Muestra menos', 'Daha az göster', '收起显示'),
(351, 'no_users_found', 'No users found', 'لم يتم العثور على أي مستخدم', 'Geen gebruikers gevonden', 'Aucun utilisateur trouvé', 'Keine Benutzer gefunden', 'Пользователи не найдены', 'No se encontraron usuarios', 'Kullanıcı bulunamadı', '未找到相应的用户'),
(352, 'social_links', 'Social links', 'روابط اجتماعية', 'Sociale links', 'Liens sociaux', 'Soziale Verbindungen', 'Социальные ссылки', 'Vínculos sociales', 'Sosyal bağlantılar', '社交链接'),
(353, 'cookie_message', 'This website uses cookies to ensure you get the best experience on our website.', 'يستخدم موقع الويب هذا ملفات تعريف الارتباط لضمان حصولك على أفضل تجربة على موقعنا.', 'Deze website maakt gebruik van cookies om ervoor te zorgen dat u de beste ervaring op onze website krijgt.', 'Ce site utilise des cookies pour vous assurer la meilleure expérience sur notre site.', 'Diese Website verwendet Cookies, um sicherzustellen, dass Sie die beste Erfahrung auf unserer Website erhalten.', 'На этом веб-сайте используются файлы cookie, чтобы вы могли получить лучший опыт на нашем веб-сайте.', 'Este sitio web utiliza cookies para garantizar que obtenga la mejor experiencia en nuestro sitio web.', 'Bu web sitesi, web sitemizde en iyi deneyimi yaşamanızı sağlamak için çerezleri kullanır.', '本网站使用cookies以确保您在我们的网站上获得最佳体验。'),
(354, 'cookie_dismiss', 'Got It!', 'فهمتك!', 'Begrepen!', 'Je lai!', 'Ich habs!', 'Понял!', '¡Lo tengo!', 'Anladım!', '知道了！'),
(355, 'cookie_link', 'Learn More', 'أعرف أكثر', 'Kom meer te weten', 'Apprendre encore plus', 'Erfahren Sie mehr', 'Выучить больше', 'Aprende más', 'Daha fazla bilgi edin', '了解更多'),
(356, 'terms_accept', 'Please agree to the Terms of use & Privacy Policy', 'يرجى الموافقة على شروط الاستخدام وسياسة الخصوصية', 'Ga akkoord met de gebruiksvoorwaarden en het privacybeleid', 'Veuillez accepter les conditions dutilisation et la politique de confidentialité', 'Bitte stimme den Nutzungsbedingungen und Datenschutzrichtlinien zu', 'Пожалуйста, соглашайтесь с Условиями использования и Политикой конфиденциальности', 'Acepta los Términos de uso y la Política de privacidad', 'Lütfen Kullanım Koşulları ve Gizlilik Politikasını kabul edin', '请同意使用条款和隐私政策'),
(357, 'terms_agreement', 'By creating your account, you agree to our', 'عن طريق إنشاء حسابك ، فإنك توافق على', 'Door uw account aan te maken, gaat u akkoord met onze', 'En créant votre compte, vous acceptez notre', 'Mit der Erstellung Ihres Benutzerkontos stimmen Sie unseren Nutzungsbedingungen zu', 'Создав свою учетную запись, вы соглашаетесь с нашими', 'Al crear su cuenta, usted acepta nuestra', 'Hesabınızı oluşturarak,', '创建您的帐户，默认您同意我们的条款'),
(358, 'no_notifications', 'You do not have any notifications', 'ليس لديك أي إخطارات', 'Je hebt geen meldingen', 'Vous navez aucune notification', 'Sie haben keine Benachrichtigungen', 'У вас нет уведомлений', 'No tienes ninguna notificación', 'Bildiriminiz yok', '您没有任何通知'),
(359, 'unlisted', 'Unlisted', 'غير مدرج', 'geheim', 'Non listé', 'Nicht gelistet', 'Unlisted', 'No estante en la lista', 'Liste dışı', '不公开'),
(360, 'video_private_text', 'This is video private, just the publisher can view it.', 'هذا فيديو خاص ، يمكن للناشر فقط مشاهدته.', 'Dit is video-privé, alleen de uitgever kan het bekijken.', 'C\'est de la vidéo privée, seul l\'éditeur peut le voir.', 'Dies ist Video privat, nur der Herausgeber kann es anzeigen.', 'Это видео конфиденциально, только издатель может его просмотреть.', 'Este es un video privado, solo el editor puede verlo.', 'Bu video özel, sadece yayıncı bunu görüntüleyebilir.', '这是视频私有的，只有发布者才能查看。'),
(361, 'instagram', 'Instagram', 'إينستاجرام', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram', 'Instagram'),
(362, 'original', 'Original', 'أصلي', 'origineel', 'Original', 'Original', 'оригинал', 'Original', 'orijinal', '原版文件下载'),
(363, 'age_restriction', 'Age Restriction', 'شرط العمر أو السن', 'Leeftijdsbeperking', 'Restriction d\'âge', 'Altersbeschränkung', 'Ограничение возраста', 'Restricción de edad', 'Yaş kısıtlaması', '年龄限制'),
(364, 'all_ages', 'All ages can view this video', 'يمكن لجميع الأعمار مشاهدة هذا الفيديو', 'Alle leeftijden kunnen deze video bekijken', 'Tous les âges peuvent voir cette vidéo', 'Alle Altersgruppen können dieses Video ansehen', 'Все возрасты могут просматривать это видео', 'Todas las edades pueden ver este video', 'Her yaştan bu videoyu görüntüleyebilir', '所有年龄段的人都可以观看此视'),
(365, 'only_18', 'Only +18', 'فقط +18', 'Alleen +18', 'Seulement +18', 'Nur +18', 'Только +18', 'Solo +18', 'Sadece +18', '只有满了18岁才可以公开'),
(366, 'not_allowed_change_age', 'You are not allowed to change your age more than one time', 'لا يسمح لك بتغيير عمرك أكثر من مرة', 'Het is niet toegestaan ​​om je leeftijd meer dan één keer te veranderen', 'Vous n\'êtes pas autorisé à changer votre âge plus d\'une fois', 'Sie dürfen Ihr Alter nicht mehr als einmal ändern', 'Вам не разрешается менять свой возраст более одного раза', 'No puedes cambiar tu edad más de una vez', 'Yaşınızı bir kereden fazla değiştiremezsiniz', '您不得超过一次更改您的年龄'),
(367, 'age_restrict_text', 'This video is age restricted for viewers under +18', 'هذا الفيديو مقيّد بالعمر للمشاهدين تحت +18', 'Deze video is leeftijdsbeperkend voor kijkers onder +18', 'Cette vidéo est limitée à l’âge pour les téléspectateurs de moins de 18 ans.', 'Dieses Video ist für Zuschauer unter +18 Altersbeschränkung', 'Это видео ограничено для зрителей под +18', 'Este video está restringido para menores de 18 años.', 'Bu video, +18 yaşın altındaki görüntüleyenler için kısıtlanmış', '此视频的年龄限制为+18以上的观看者'),
(368, 'age_restrcit_text_2', 'Create an account or login to confirm your age.', 'قم بإنشاء حساب أو تسجيل الدخول لتأكيد عمرك.', 'Maak een account aan of log in om uw leeftijd te bevestigen.', 'Créez un compte ou connectez-vous pour confirmer votre âge.', 'Erstelle ein Konto oder logge dich ein, um dein Alter zu bestätigen.', 'Создайте учетную запись или авторизуйтесь, чтобы подтвердить свой возраст.', 'Crea una cuenta o inicia sesión para confirmar tu edad.', 'Yaşınızı onaylamak için bir hesap oluşturun veya giriş yapın.', '创建帐户或登录以确认您的年龄。'),
(369, 'donation_paypal_email', 'Donation PayPal Email', 'التبرع البريد الإلكتروني بأي بال', 'Donatie PayPal E-mail', 'Don PayPal Email', 'Spende PayPal E-Mail', 'Пожертвование PayPal Email', 'Donación Correo electrónico de PayPal', 'Bağış PayPal Email', '打赏PayPal电子邮件'),
(370, 'download', 'Download', 'تحميل', 'Download', 'Télécharger', 'Herunterladen', 'Скачать', 'Descargar', 'İndir', '下载'),
(371, 'donate', 'Donate', 'تبرع', 'schenken', 'Faire un don', 'Spenden', 'жертвовать', 'Donar', 'bağışlamak', '打赏'),
(372, 'video_approve_text', 'This video is being reviewed, please check back later.', 'هذا الفيديو قيد المراجعة ، يرجى معاودة التحقق لاحقًا.', 'Deze video wordt beoordeeld. Kom later nog eens terug.', 'Cette vidéo est en cours de révision, veuillez vérifier plus tard.', 'Dieses Video wird gerade überprüft. Bitte schauen Sie später noch einmal vorbei.', 'Это видео просматривается, пожалуйста, зайдите позже.', 'Este video está siendo revisado, por favor revise más tarde.', 'Bu video inceleniyor, lütfen daha sonra tekrar kontrol edin.', '正在审核此视频，请稍后再回来查看。'),
(373, '_reached_upload_limit', 'You have reached your upload limit.', 'لقد وصلت إلى حد التحميل الخاص بك.', 'Je hebt je uploadlimiet bereikt.', 'Vous avez atteint votre limite de téléchargement.', 'Sie haben Ihr Upload-Limit erreicht.', 'Вы достигли предела загрузки.', 'Has alcanzado tu límite de carga.', 'Yükleme sınırınıza ulaştınız.', '您已达到上传限制。'),
(374, 'delete_some_videos', 'Please delete some of your videos in able to upload more.', 'يرجى حذف بعض مقاطع الفيديو التابعة لك وقادرة على تحميل المزيد.', 'Verwijder enkele van je video\'s in staat om meer te uploaden.', 'Veuillez supprimer certaines de vos vidéos pour pouvoir en télécharger davantage.', 'Bitte lösche einige deiner Videos, um mehr hochladen zu können.', 'Пожалуйста, удалите некоторые из ваших видеороликов, которые могут загрузить больше.', 'Elimina algunos de tus videos para poder subir más.', 'Lütfen daha fazla yükleme yapabileceğiniz videolarınızın bir kısmını silin.', '请删除部分视频，以便上传更多内容。');

-- --------------------------------------------------------

--
-- 表的结构 `likes_dislikes`
--

CREATE TABLE `likes_dislikes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `likes_dislikes`
--

INSERT INTO `likes_dislikes` (`id`, `user_id`, `video_id`, `post_id`, `type`, `time`) VALUES
(1, 1, 17, 0, 1, 1534725772);

-- --------------------------------------------------------

--
-- 表的结构 `lists`
--

CREATE TABLE `lists` (
  `id` int(11) NOT NULL,
  `list_id` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `privacy` int(11) NOT NULL DEFAULT '1',
  `views` int(11) NOT NULL DEFAULT '0',
  `icon` varchar(3000) NOT NULL DEFAULT '',
  `time` int(30) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL DEFAULT '0',
  `to_id` int(11) NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `seen` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `from_deleted` int(11) NOT NULL DEFAULT '0',
  `to_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notifier_id` int(11) NOT NULL DEFAULT '0',
  `recipient_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `text` text,
  `url` varchar(3000) NOT NULL DEFAULT '',
  `seen` varchar(50) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(200) NOT NULL DEFAULT '',
  `amount` int(11) NOT NULL DEFAULT '0',
  `date` varchar(100) NOT NULL DEFAULT '',
  `expire` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `play_list`
--

CREATE TABLE `play_list` (
  `id` int(11) NOT NULL,
  `list_id` varchar(500) NOT NULL DEFAULT '',
  `video_id` varchar(500) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `profile_fields`
--

CREATE TABLE `profile_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `options` varchar(3000) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `type` text COLLATE utf8_unicode_ci,
  `length` int(11) NOT NULL DEFAULT '0',
  `placement` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profile',
  `registration_page` int(11) NOT NULL DEFAULT '0',
  `profile_page` int(11) NOT NULL DEFAULT '0',
  `active` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `pt_posts`
--

CREATE TABLE `pt_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT '0',
  `image` varchar(3000) NOT NULL DEFAULT '',
  `text` text,
  `tags` varchar(500) NOT NULL DEFAULT '',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `shared` int(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `pt_posts`
--

INSERT INTO `pt_posts` (`id`, `title`, `description`, `category`, `image`, `text`, `tags`, `time`, `user_id`, `active`, `views`, `shared`) VALUES
(1, '阿姆斯特丹：谜一样的性感水城', '荷兰这个国家向来与水脱离不了关系，那么可以说傍水而居的阿姆斯特丹是欧洲最特别的运河之城。Amsterdam，原本的意思就是“阿姆斯特河上的一座大坝”，从城市的名字就能看出它和水的不解之缘了。..', 1, 'upload/photos/2018/08/xgfXDNxPRjxkMvJhuRof_19_68041a863489f1ea755212bc523ce5c4_image.jpg', '&lt;p&gt;荷兰这个国家向来与水脱离不了关系，那么可以说傍水而居的阿姆斯特丹是欧洲最特别的运河之城。Amsterdam，原本的意思就是“阿姆斯特河上的一座大坝”，从城市的名字就能看出它和水的不解之缘了。&lt;/p&gt;&lt;p&gt;&lt;br&gt;阿姆斯特丹在历史上经历了从不起眼的小渔村发展成大都市的过程，聪明的荷兰人运用水的优势开凿出犹如蜘蛛网般密布的环状水道，凭借着开关水道收取贸易通行费和拓展海上霸权的方式，成为了十六、十七世纪大航海时代欧洲最重要的经济中心。&lt;/p&gt;&lt;p&gt;&lt;br&gt;如今这些环环相扣的水道成为了阿姆斯特丹城最独特的景致，浪漫的运河、精致的桥梁、古老的街道、传统的建筑、珍贵的文化遗产和热情的民风造就了这座古朴又充满活力的城市。沿着运河缓步而行，感受这座城市谜一样的性感与柔情。&lt;/p&gt;&lt;p&gt;&lt;br data-mce-bogus=&quot;1&quot;&gt;&lt;/p&gt;&lt;p&gt;在阿姆斯特丹的发展历史上有过两个黄金年代，19世纪末期是阿姆斯特丹的第二个黄金年代，当时城市规模开始扩大，修建了不少新建筑，阿姆斯特丹中央火车站（Amsterdam Centraal Station）就是在那时落成的。如今中央火车站不仅是阿姆斯特丹的交通枢纽，也是重要的地标之一。这座新哥特式风格的建筑有两幢对称的塔楼，右边是钟楼，左边则是风向标&lt;/p&gt;', '旅游', '1534691283', 1, '1', 4, 0),
(2, '在欧洲大陆的最南端有这样一块土地', '在欧洲大陆的最南端有这样一块土地，你可以说他热情，因为那里的阳光好像一年四季都在盛放，没有休息的时日，你可以说他温柔，因为文化的积淀让这一处土地的每一个角落都散发出浓郁的人文馨香..', 1, 'upload/photos/2018/08/RxxHuTjVMUwlNsx79NSo_19_178488f5db028fb87332da431b9dff76_image.jpg', '&lt;p&gt;在欧洲大陆的最南端有这样一块土地，你可以说他热情，因为那里的阳光好像一年四季都在盛放，没有休息的时日，你可以说他温柔，因为文化的积淀让这一处土地的每一个角落都散发出浓郁的人文馨香，你可以说他绮丽，因为这里融会贯通了太多不同的文化和缤纷的色彩，庄重或者张扬，都在这片土地上生机勃勃的旺盛生长着，直布罗陀海峡和地中海让他广纳四方的精彩和精华，他是西班牙的安达卢西亚，他的风情万种总是令人着迷。&lt;/p&gt;&lt;p&gt;说道西班牙很多人都会想到处在最南边的安达卢西亚，而提到安达卢西亚，几处耳熟能详的著名城市都在这里，塞维利亚是他的州府，还有科尔多瓦、格拉纳达等等，但是如果说是对安达卢西亚这片土地有着极大兴趣想要深入了解一下，那么更加安静，&lt;/p&gt;&lt;p&gt;人文气息更浓郁的马拉加应该是不二之选。虽然马拉加不比他的邻居城市们那样有名气，但是却是安达卢西亚地区的相当富有历史气息和艺术氛围的城市。说起来马拉加可是毕加索的故乡呢，古罗马的圆形剧场，穆斯林的城堡，还有崭新落成的毕加索博物馆，&lt;/p&gt;&lt;p&gt;甚至是街边的咖啡馆和书店，都能让人感受到这里曾经是辉煌历史的见证者，也是现代文明的参与者，这里的多情和多彩好像很容易就能找到源头和依据。&lt;/p&gt;', '欧洲', '1534691549', 1, '1', 1, 0),
(3, '不止有亚德里亚海上最美的夕阳', '很久以前在网上看过一片英文游记，标题是“亚德里亚海上最美的日落”。文章配图极抓眼球，只见一座宛若彩色城堡般的古城悬浮于丝缎般平滑的海面上，在它身后，一轮殷红的落日正缓缓沉入大海。我赶紧往下翻看..', 1, 'upload/photos/2018/08/2ycLmSX7h8SurCbK7X1i_19_61cf0b824ace11ffb52803e21b8f3f3f_image.jpg', '&lt;p&gt;第一眼，我以为这是座意大利城市。不是吗，那撑起了整座城市天际线轮廓的钟塔完全就是威尼斯钟塔的迷你版嘛。那些海边五颜六色的房子，也有着浓浓的意大利风情。 在意大利地图上沿着亚德里亚海岸看了半天， 没看到这地方啊，一搜，嗨，人家是克罗地亚的地盘。&lt;/p&gt;&lt;p&gt;其实我的直觉并没有错。罗维尼的历史与意大利有很深的渊源。罗维尼原本是亚德里亚海东岸的一个靠近海岸的岛屿。公元四世纪时，它在罗马的统治下， 东西罗马分裂后，它在六世纪归于东罗马帝国也就是拜占庭帝国的版图。 &lt;/p&gt;&lt;p&gt;1283年至1797年间，罗维尼成为威尼斯共和国在伊斯特拉（ISTRIA）地区最重要的商贸城市，1763年人们填海修路把它和陆地连接了起来。这段时期，也是罗维尼历史最辉煌的年代。在欧洲逛久了发现一条规律，一座城市不管在哪个国家，只要敢自称“历史上曾是威尼斯共和国的重要城市”，就绝对有看头。毕竟，那个纵横地中海长达一千年的共和国有着实在太骄人太奇葩的过往。&lt;/p&gt;&lt;p&gt;当拿破仑葬送了威尼斯的千年好梦， 他自然也短时间成了罗维尼的主人。之后是奥匈帝国直到一次大战。1918到1947年，罗维尼又成了意大利的领土。二战之后，成了南斯拉夫的一员，直到克罗地亚独立。至今，罗维尼的官方语言是克罗地亚语和意大利语双语制， 而当地老百姓的日常语言更为独特，似乎每个人都有不同的语言习惯，一句话往往从意大利语开始，伊斯特拉方言继续，最后以克罗地亚语结束，中间闹不好还会冒出一个德语词汇​。短短的句子里，浓缩了祖辈们在岁月长河里走过的变化风云。&lt;/p&gt;', '亚洲', '1534691722', 1, '1', 7, 0),
(4, '最适合七夕情人节的古北水镇哦', '中国传统情人节七夕近在眼前，是不是又在为如何找到一个“可以提供吃喝玩乐一条龙服务、颜值还很高最好带些浪漫气质的度假目的地而发愁”', 1, 'upload/photos/2018/08/nKm7DyE8M8LKiLpdcl8s_20_2b63c5bfd1d7f01369b4b2592dcaff44_image.jpg', '&lt;p&gt;中国传统情人节七夕近在眼前，是不是又在为如何找到一个“可以提供吃喝玩乐一条龙服务、颜值还很高最好带些浪漫气质的度假目的地而发愁”？&lt;/p&gt;&lt;p&gt;如果是，古北水镇请pick一下。&lt;/p&gt;&lt;div&gt;&lt;p&gt;还记得彭于晏的美好肉体在连片的屋檐上跳来跳去的画面吗？&lt;/p&gt;&lt;/div&gt;&lt;p&gt;真正诱发我们对古北水镇的兴趣，其实是姜文的电影《邪不压正》。但必须承认并非因为故事情节，而是影片中一幕幕徐徐展开的如画卷般的故事发生地、我们每个人心中的文化故城——北平。&lt;/p&gt;&lt;p&gt;但你知道吗？那个看起来充满古韵的电影取景地其实是在北京郊外、一座存在不过4年的小镇，它距离北京约2小时车程、就在司马台长城脚下、兼具北国之大气和南方之柔美，它的名字叫古北水镇。&lt;/p&gt;&lt;div&gt;&amp;nbsp;&lt;/div&gt;', '情人节', '1534726245', 1, '1', 0, 0),
(5, '去西藏，看全国花期最晚的油菜花', '也许只能从建筑分辨出这里是藏区了，当你驻足，仔细凝望这些好像具有魔力一般的房子。你会羡慕这里的人们，没有市井，没有噪音。这是最原始的活法，自由自在、自得其乐。..', 1, 'upload/photos/2018/08/C5kzU2P8F2l1aO46lDLU_20_db57c29f7e49fb401a647f14769e851d_image.jpg', '&lt;p data-mpa-powered-by=&quot;yiban.io&quot;&gt;好像每个季节，都能在朋友圈看到又有朋友去了西藏。西藏的特别之处在于这是个会让你上瘾的地方，你一定会一见倾心，再见倾情。&lt;/p&gt;&lt;p&gt;虽然很多人提起西藏只知道珠峰、拉萨，但我想告诉你们西藏真正的美在路上、在湛蓝的晴空里、在悠悠的白云里、在高洁的雪山里、在仓央嘉措流淌的诗句里。在西藏，你的脚步会放得很慢很慢。你不想错过西藏的每一点细节。&lt;/p&gt;&lt;p&gt;有个喜欢的旅行者写过这么一本书，《神的孩子都要去西藏》。的确，神的孩子都要去西藏。&lt;/p&gt;&lt;p&gt;这一篇我想给你们看看真实的西藏路上的风景。&lt;/p&gt;&lt;p&gt;那是8月底，我们正在去往鲜花小镇亚东的路上。一路颠簸，大家都在期待等下要见到的亚东。中途经过帕里镇，突然一大片金黄映入眼帘，朋友惊呼“油菜花！”&lt;/p&gt;', '西藏', '1534726346', 1, '1', 0, 0),
(6, '五月，冰城紫色浪漫的最美时光', '5月5日，哈尔滨“伏尔加庄园杯”首页丁香花国际摄影大赛拉开帷幕，这不仅仅是一次发现美丽丁香的赛事，更是一次以丁香为媒“爱我冰城”的艺术展示。..', 1, 'upload/photos/2018/08/mAD8MfbebTWfbVAPXCHM_20_1909d0fd78a7dc23a6e8c30d616efa86_image.jpg', '&lt;p align=&quot;left&quot;&gt;&lt;span&gt;五月，是哈尔滨幽香飘洒的季节，&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span&gt;五月，是冰城紫色浪漫的最美时光。&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&amp;nbsp;&lt;wbr&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span size=&quot;3&quot; face=&quot;楷体&quot; data-mce-style=&quot;font-family: 楷体; font-size: medium;&quot; style=&quot;font-family: 楷体; font-size: medium;&quot;&gt;5月5日，哈尔滨“伏尔加庄园杯”首页丁香花国际摄影大赛拉开帷幕，这不仅仅是一次发现美丽丁香的赛事，更是一次以丁香为媒“爱我冰城”的艺术展示。&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&amp;nbsp;&lt;wbr&gt;&lt;/p&gt;&lt;p align=&quot;left&quot;&gt;&lt;span size=&quot;3&quot; face=&quot;楷体&quot; data-mce-style=&quot;font-family: 楷体; font-size: medium;&quot; style=&quot;font-family: 楷体; font-size: medium;&quot;&gt;作为一个冰城的摄影人，这些年也留下了好多哈尔滨市花——丁香花的倩影。撷一束紫色的记忆，同享冰城五月的芬芳。&lt;/span&gt;&lt;/p&gt;&lt;div id=&quot;sina_keyword_ad_area2&quot; class=&quot;articalContent   newfont_family&quot;&gt;&lt;p align=&quot;left&quot;&gt;&lt;span&gt;丁香花，1988年&lt;/span&gt;&lt;span size=&quot;3&quot; face=&quot;楷体&quot; data-mce-style=&quot;font-family: 楷体; font-size: medium;&quot; style=&quot;font-family: 楷体; font-size: medium;&quot;&gt;被确定为哈尔滨市花。&lt;/span&gt;丁香花在19世纪末伴随着大批侨民的涌入被引进哈尔滨大量栽种，每年五月，哈尔滨大街小巷丁香花盛开，是哈尔滨最美的季节。&lt;/p&gt;&lt;/div&gt;&lt;div class=&quot;atc_photoblog borderc&quot;&gt;&lt;br data-mce-bogus=&quot;1&quot;&gt;&lt;/div&gt;', '哈尔滨', '1534726525', 1, '1', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `video_id` int(15) NOT NULL DEFAULT '0',
  `article_id` int(15) NOT NULL DEFAULT '0',
  `ad_id` int(15) NOT NULL DEFAULT '0',
  `comment_id` int(20) NOT NULL DEFAULT '0',
  `reply_id` int(25) NOT NULL DEFAULT '0',
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `text` text,
  `time` varchar(50) NOT NULL DEFAULT '',
  `seen` int(11) NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `saved_videos`
--

CREATE TABLE `saved_videos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(30) NOT NULL DEFAULT 'web',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `user_id`, `platform`, `time`) VALUES
(1, 'ec332e9c4ac3797105e8dba0a7399ed855b1d8fd1525101168cf6705fe94f66a5aab787ceb0a7ff46e', 1, 'web', 1525101168),
(3, 'd65c82aff5451ce8fa43230e48c459b2a978d81f1534579697bf157ccb8242be5e6b620b15cec792f9', 1, 'web', 1534579697);

-- --------------------------------------------------------

--
-- 表的结构 `site_ads`
--

CREATE TABLE `site_ads` (
  `id` int(11) NOT NULL,
  `placement` varchar(50) NOT NULL DEFAULT '',
  `code` text,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `site_ads`
--

INSERT INTO `site_ads` (`id`, `placement`, `code`, `active`) VALUES
(1, 'header', '', 0),
(2, 'footer', '', 0),
(3, 'watch_side_bar', '', 0),
(4, 'watch_comments', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `subscriber_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `terms`
--

CREATE TABLE `terms` (
  `id` int(11) NOT NULL,
  `type` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `terms`
--

INSERT INTO `terms` (`id`, `type`, `text`) VALUES
(1, 'terms_of_use', '&lt;p&gt; <br>	【遵守法律法规】您同意在使用我方平台服务过程中，遵守以下法律法规：《中华人民共和国网络安全法》、《中华人民共和国保守国家秘密法》、《中华人民共和国著作权法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《互联网电子公告服务管理规定》、《信息网络传播权保护条例》等有关计算机及互联网规定的法律、法规。在任何情况下，我方一旦合理地认为您的行为可能违反上述法律、法规，可以在任何时候，不经事先通知终止向您提供服务。&lt;br /&gt; <br>	&lt;h3&gt; <br>		4.3禁止的内容 <br>	&lt;/h3&gt; <br>您理解并保证您在我方平台上传、发布或传输的内容（包括您的账户名称等信息）应当遵守宪法、法律和行政法规，坚持为人民服务、为社会主义服务的方向，坚持正确舆论导向，发挥舆论监督作用，促进形成积极健康、向上向善的网络文化，维护国家利益和公共利益。我方平台有权对您上传、发布或传输的信息进行管理，发现法律、行政法规禁止发布或者传输的信息的，或含有以下内容的，我方平台将立即停止传输该信息，采取消除等处置措施，防止信息扩散，保存有关记录，并向有关主管部门报告： <br>&lt;/p&gt; <br>&lt;p&gt; <br>	&lt;br /&gt; <br>（一）反对宪法确定的基本原则的；&amp;nbsp;&lt;br /&gt; <br>（二）危害国家统一、主权和领土完整的；&amp;nbsp;&lt;br /&gt; <br>（三）泄露国家秘密、危害国家安全或者损害国家荣誉和利益的；&amp;nbsp;&lt;br /&gt; <br>（四）煽动民族仇恨、民族歧视，破坏民族团结，或者侵害民族风俗、习惯的；&amp;nbsp;&lt;br /&gt; <br>（五）宣扬邪教、迷信的；&amp;nbsp;&lt;br /&gt; <br>（六）扰乱社会秩序，破坏社会稳定的；&amp;nbsp;&lt;br /&gt; <br>（七）诱导未成年人违法犯罪和渲染暴力、色情、赌博、恐怖活动的；&amp;nbsp;&lt;br /&gt; <br>（八）侮辱或者诽谤他人，侵害公民个人名誉、隐私、知识产权和其他合法权益的；&amp;nbsp;&lt;br /&gt; <br>（九）危害社会公德，损害民族优秀文化传统的；&amp;nbsp;&lt;br /&gt; <br>（十）有关法律、行政法规和国家规定禁止的其他内容。&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>【上传非法及侵权内容的后果】如果您上传、发布或传输的内容含有以上违反法律法规的信息或内容的，或者侵犯任何第三方的合法权益，您将直接承担以上导致的一切不利后果。如因此给我方造成不利后果的，您应负责消除影响，并且赔偿我方因此导致的一切损失，包括且不限于财产损害赔偿、名誉损害赔偿、律师费、交通费等因维权而产生的合理费用。&lt;br /&gt; <br>4.4禁止的行为&lt;br /&gt; <br>	&lt;h4&gt; <br>		您理解并保证不就我方平台服务进行下列的禁止的行为，也不允许任何人利用您的账户进行下列行为：&amp;nbsp; <br>	&lt;/h4&gt; <br>&lt;br /&gt; <br>1) 在注册账户时，或使用我方平台服务时，冒充他人，或您讹称与任何人或实体有联系（包括设置失实的账户名称或接入另一用户的账户）；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>2) 伪造标题或以其他方式操控内容，使他人误认为该内容为我方所传输；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>3) 将无权传输的内容（例如内部资料、机密资料）进行上传、发布、发送电子邮件或以其他方式传输；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>4) 发送任何未获邀约或未经授权的垃圾电邮、广告或宣传资料，或任何其他商业通讯；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>5) 未经我方明确许可，使用我方平台服务用于任何商业用途或为任何第三方的利益；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>6) 跟踪或以其他方式骚扰他人；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>7) 参与任何非法或有可能非法（由我方判断）的活动或交易，包括传授犯罪方法、出售任何非法药物、洗钱活动、诈骗等；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>8) 赌博、提供赌博数据或透过任何方法诱使他人参与赌博活动；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>9) 使用或利用我方知识产权（包括我们的商标、品牌、标志、任何其他专有数据或任何网页的布局或设计），或在其他方面侵犯我方任何知识产权（包括试图对我方平台客户端或所使用的软件进行逆向工程）；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>10) 通过使用任何自动化程序、软件、引擎、网络爬虫、网页分析工具、数据挖掘工具或类似工具，接入我方平台服务、收集或处理通过我方平台服务所提供的内容；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>11) 参与任何“框架”、“镜像”或其他技术，目的是模仿我方平台服务的外观和功能；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>12) 干预或试图干预任何用户或任何其他方接入我方平台服务；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>13) 故意散播病毒、网络蠕虫、特洛伊木马病毒、已损毁的档案或其他恶意代码或项目；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>14) 未经他人明确同意，分享或发布该等人士可识别个人身份的资料；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>15) 探究或测试我方平台服务、系统或其他用户的系统是否容易入侵攻击，或在其他方面规避（或试图规避）我方平台服务、系统或其他用户的系统的任何安全功能；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>16) 对我方平台服务所用的软件进行解编、反向编译或逆向工程，或试图作出上述事项；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>17) 为破坏或滥用的目的开设多个账户，或恶意上传重复的、无效的大容量数据和信息；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>18) 利用网络从事侵害他人名誉、隐私、知识产权和其他合法权益等活动；&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>19) 故意或非故意违反任何相关的中国法律、法规、规章、条例等其他具有法律效力的规范。&lt;br /&gt; <br>&lt;/p&gt;'),
(2, 'privacy_policy', '&lt;p&gt; <br>	&lt;h4&gt; <br>		&amp;nbsp;隐私权政策 <br>	&lt;/h4&gt; <br>在您使用我方提供的服务时，您同意我方按照在我方平台上公布的隐私权政策收集、存储、使用、披露和保护您的个人信息。&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>我方非常重视用户个人信息的保护， 根据有关法律法规要求，网络产品、服务具有收集用户信息功能的，其提供者应当向用户明示并取得同意。我方特此通过单独明示的 《法律声明和隐私权政策》 明确向您告知收集、使用用户个人信息的目的、方式和范围，查询、更正信息的渠道以及拒绝提供信息的后果。 我方希望通过隐私权政策向您清楚地介绍我方对您个人信息的处理方式，因此我方建议您完整地阅读 《法律声明和隐私权政策》 ，以帮助您更好地保护您的隐私权。&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>如果您不同意 《法律声明和隐私权政策》 的任何内容，您应立即停止使用我方平台服务。当您使用我方平台提供的任一服务时，即表示您已同意我们按照我方平台 《法律声明和隐私权政策》 来合法收集、使用和保护您的个人信息。&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>《法律声明和隐私权政策》 中所指个人信息是指以电子或者其他方式记录的能够单独或者与其他信息结合识别自然人个人身份的各种信息，包括但不限于自然人的姓名、出生日期、身份证件号码、个人生物识别信息、住址、电话号码等。&amp;nbsp;&lt;br /&gt; <br>&lt;br /&gt; <br>如您对本隐私权政策有任何疑问或对您的个人信息保护有任何投诉，您可以通过我方平台公布的联系方式与我们联系。&lt;br /&gt; <br>	&lt;div&gt; <br>		&lt;br /&gt; <br>	&lt;/div&gt; <br>&lt;/p&gt; <br>&lt;p&gt; <br>	&lt;br /&gt; <br>&lt;/p&gt;'),
(3, 'about', '&lt;h4&gt; <br>	审慎阅读 <br>&lt;/h4&gt; <br>&lt;p&gt; <br>	&amp;nbsp;您在申请注册流程中点击同意本协议之前，应当认真阅读本协议。 请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款、法律适用和争议解决条款。免除或者限制责任的条款将以粗体下划线标识，您应重点阅读。 如您对协议有任何疑问，可向我方平台客服咨询。&amp;nbsp; <br>&lt;/p&gt; <br>&lt;p&gt; <br>	&lt;br /&gt; <br>&lt;/p&gt; <br>&lt;h4&gt; <br>	签约动作 <br>&lt;/h4&gt; <br>&lt;p&gt; <br>	当您按照注册页面提示填写信息、阅读并同意本协议且完成全部注册程序后，即表示您已充分阅读、理解并接受本协议的全部内容，并与优酷网和我方平台网站达成一致，成为优酷网或我方平台“用户”。 阅读本协议的过程中，如果您不同意本协议或其中任何条款约定，您应立即停止注册程序。 <br>&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `typings`
--

CREATE TABLE `typings` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT '0',
  `user_two` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `ip_address` varchar(150) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `password` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'male',
  `email_code` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `language` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT 'english',
  `avatar` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/d-avatar.jpg',
  `cover` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/d-cover.jpg',
  `src` varchar(22) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `about` text COLLATE utf8_unicode_ci,
  `google` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `twitter` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `instagram` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL DEFAULT '0',
  `verified` int(11) NOT NULL DEFAULT '0',
  `last_active` int(11) NOT NULL DEFAULT '0',
  `registered` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `is_pro` int(11) NOT NULL DEFAULT '0',
  `imports` int(11) NOT NULL DEFAULT '0',
  `uploads` int(11) NOT NULL DEFAULT '0',
  `wallet` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `balance` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `video_mon` int(10) NOT NULL DEFAULT '0',
  `age_changed` int(11) NOT NULL DEFAULT '0',
  `donation_paypal_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `ip_address`, `password`, `first_name`, `last_name`, `gender`, `email_code`, `language`, `avatar`, `cover`, `src`, `country_id`, `age`, `about`, `google`, `facebook`, `twitter`, `instagram`, `active`, `admin`, `verified`, `last_active`, `registered`, `is_pro`, `imports`, `uploads`, `wallet`, `balance`, `video_mon`, `age_changed`, `donation_paypal_email`) VALUES
(1, 'admin', '18581281315@163.com', '::1', 'd033e22ae348aeb5660fc2140aec35850c4da997', '张', '怡', 'male', '', 'china', 'upload/photos/2018/08/LxKLttFu5kNbSsbTfNqA_20_2414e5b3c15cf2611492ea9e4b5f4b8e_image.jpg', 'upload/photos/2018/08/OhwGPJMvSJIl4uZAaj47_20_2414e5b3c15cf2611492ea9e4b5f4b8e_image.jpg', '', 0, 0, '当教师把每一个学生都理解为他是一个具有个人特点的、具有自己的志向、自己的智慧和性格结构的人的时候，这样的理解才能有助于教师去热爱儿童和尊重儿童。 —— 赞科夫', 'https://www.pineal.cn/', 'https://www.pineal.cn/', 'https://www.pineal.cn/', '', 1, 1, 0, 1534731650, '00/0000', 0, 15, 14788376, '0', '0', 0, 0, '18581281315@163.com');

-- --------------------------------------------------------

--
-- 表的结构 `user_ads`
--

CREATE TABLE `user_ads` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `results` int(11) NOT NULL DEFAULT '0',
  `spent` varchar(20) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `audience` text,
  `category` varchar(50) NOT NULL DEFAULT '',
  `media` varchar(1000) NOT NULL DEFAULT '',
  `url` varchar(3000) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `placement` varchar(50) NOT NULL DEFAULT '',
  `posted` varchar(50) NOT NULL DEFAULT '0',
  `headline` varchar(1000) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `location` varchar(1000) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `usr_prof_fields`
--

CREATE TABLE `usr_prof_fields` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `fid_2` varchar(32) NOT NULL DEFAULT '',
  `fid_3` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `verification_requests`
--

CREATE TABLE `verification_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `message` text,
  `media_file` text,
  `time` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `video_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `short_id` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `thumbnail` varchar(500) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/photos/thumbnail.jpg',
  `video_location` varchar(3000) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `youtube` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `vimeo` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `daily` varchar(32) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `facebook` varchar(100) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `time_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '0',
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `duration` varchar(33) CHARACTER SET latin1 NOT NULL DEFAULT '00:00',
  `size` int(50) NOT NULL DEFAULT '0',
  `converted` int(5) NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL DEFAULT '0',
  `registered` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT '0000/00',
  `privacy` int(11) NOT NULL DEFAULT '0',
  `age_restriction` int(11) NOT NULL DEFAULT '1',
  `type` varchar(100) NOT NULL DEFAULT '',
  `approved` int(11) NOT NULL DEFAULT '1',
  `240p` int(11) NOT NULL DEFAULT '0',
  `360p` int(11) NOT NULL DEFAULT '0',
  `480p` int(11) NOT NULL DEFAULT '0',
  `720p` int(11) NOT NULL DEFAULT '0',
  `1080p` int(11) NOT NULL DEFAULT '0',
  `2048p` int(11) NOT NULL DEFAULT '0',
  `4096p` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `videos`
--

INSERT INTO `videos` (`id`, `video_id`, `user_id`, `short_id`, `title`, `description`, `thumbnail`, `video_location`, `youtube`, `vimeo`, `daily`, `facebook`, `time`, `time_date`, `active`, `tags`, `duration`, `size`, `converted`, `category_id`, `views`, `featured`, `registered`, `privacy`, `age_restriction`, `type`, `approved`, `240p`, `360p`, `480p`, `720p`, `1080p`, `2048p`, `4096p`) VALUES
(13, 'qtrQFcASDBXN7g1', 1, 'X1D28P', '航拍振华轮轮靠港 振华岸吊生意遍布全球', '因为大型货轮靠港的时候不可能急速停止，没有拖轮助航靠泊，会发生船舶与码头的碰撞，即使码头有护炫，也会造成水工结构和轮船的破坏。因此，10万吨以上货轮靠港的时候，进入港池以后必须熄灭动力，靠拖轮拖因靠泊。10万吨以下船舶，不是第一次来本码头的，可以自航靠泊，但必须引水。', 'upload/photos/2018/08/7kCMqE7M8AJH5vURHGZQ_19_0401356d95aff2b9c44c612406349a74_image.jpg', 'http%3A%2F%2Fips.ifeng.com%2Fvideo19.ifeng.com%2Fvideo09%2F2018%2F04%2F25%2F26197665-102-9987625-231117.mp4', '', '', '', '', 1534689216, '2018-08-19 14:33:36', 0, '邮轮', '00:00', 0, 1, 1, 0, 0, '2018/8', 0, 1, '4', 1, 0, 0, 0, 0, 0, 0, 0),
(11, 'APyKHAHJxZHsTVr', 1, 'lXiOqW', '这座火车站被认为是国内最“坑”的一座车站', '火车站按作业性质分为客运站、货运站、用来编组的编组站和客货功能兼备的客货运站4种。车站大小鉴定标准，是按车辆到发线的多少来定义；中国现在最大的火车站属于西安北站18站台34股道。而非乘客站房和站房占地面积大小或人流量多少来定义。火车站大小俨然是以能容纳火车的数量来鉴定。', 'upload/photos/2018/08/55AihjjQJkpVf3ZOu3pi_19_73a5feed73b5e13f1da556668caab2f7_image.jpg', 'http%3A%2F%2Fips.ifeng.com%2Fvideo19.ifeng.com%2Fvideo09%2F2018%2F04%2F27%2F26303126-102-9987625-031313.mp4', '', '', '', '', 1534688693, '2018-08-19 14:24:53', 0, '火车站', '00:00', 0, 1, 1, 1, 0, '2018/8', 0, 1, '4', 1, 0, 0, 0, 0, 0, 0, 0),
(12, 'ccLLGvFwQiu3KRn', 1, 'd6zLQ3', '航拍大连棒棰岛星海湾跨海大桥', '大连湾跨海交通工程连接大连市核心区和金普新区，起于大连市解放路（与规划解放路立交衔接），路线向东跨中南路（设置中南路互通），在海之韵公园入海，进入海底隧道，依次下穿大港航道、大连湾西航道，在原甘井子航道南侧填筑桥隧转换人工岛，路线出海后以桥梁形式向东北方向延伸，并设置大连湾东航道主通航孔桥，至北岸金普新区西海屯登陆，登录后连续上跨海滨路、金窑铁路、金马路，下穿规划东北大街，上跨港兴大街（设置北岸复合式互通），沿黄海中路高架，上跨疏港高速（设置疏港高速互通）后至黄海东路落地', 'upload/photos/2018/08/67PJ1CIS1cMyrVeVYM97_19_5bf93c1f07abea71a262a2a6f6991a3f_image.jpg', 'http%3A%2F%2Fips.ifeng.com%2Fvideo19.ifeng.com%2Fvideo09%2F2018%2F04%2F22%2F25879858-102-9987625-201032.mp4', '', '', '', '', 1534688923, '2018-08-19 14:28:43', 0, '跨海大桥', '00:00', 0, 1, 1, 0, 0, '2018/8', 0, 1, '4', 1, 0, 0, 0, 0, 0, 0, 0),
(14, 'eXcqm2l2kjSVTzb', 1, 'CSzYz8', '超乎想象的黑龙江之美 高清航拍东方莫斯科', '黑龙江是中国位置最北、最东，纬度最高，经度最东的省份。黑龙江省西起 121°11′，东至135°05′，南起43°25′，北至53°33′，南北跨10个纬度，2个热量带；东西跨14个经度，3个湿润区。面积47.3万平方公里（含加格达奇区和松岭区）。北部和东部与俄罗斯相邻，边境线长3045千米，是亚洲与太平洋地区陆路通往俄罗斯远东和欧洲大陆的重要通道，西部与南部分别与内蒙古和吉林省相邻，东部近日本海', 'upload/photos/2018/08/ap5akgakcukEgrz2qmdw_19_17871b13ec999cf9e0c51731c454849c_image.jpg', 'http%3A%2F%2Fips.ifeng.com%2Fvideo19.ifeng.com%2Fvideo09%2F2018%2F04%2F25%2F26186946-102-9987625-205347.mp4', '', '', '', '', 1534689452, '2018-08-19 14:37:32', 0, '莫斯科', '00:00', 0, 1, 1, 0, 0, '2018/8', 0, 1, '4', 1, 0, 0, 0, 0, 0, 0, 0),
(15, 'f193bfLRmPG2KcS', 1, 'vIZm5B', '中国面积最大的省你绝对猜不到，不是新疆', '简介：中华人民共和国位于亚洲东部，太平洋西岸，是工人阶级领导的、以工农联盟为基础的人民民主专政的社会主义国家。1949年（己丑年）10月1日成立，以五星红旗为国旗，《义勇军进行曲》为国歌，国徽内容包括国旗、天安门、齿轮和麦稻穗，首都北京，省级行政区划为23个省、5个自治区、4个直辖市、2个特别行政...', 'upload/photos/2018/08/7x2UBpwY8aICwKDwNQMO_19_6b2369a172a3abe7da0bd25007117bef_image.jpg', 'http%3A%2F%2Fips.ifeng.com%2Fvideo19.ifeng.com%2Fvideo09%2F2018%2F05%2F01%2F26560298-102-009-181534.mp4', '', '', '', '', 1534689709, '2018-08-19 14:41:49', 0, '中国', '00:00', 0, 1, 1, 0, 0, '2018/8', 0, 1, '4', 1, 0, 0, 0, 0, 0, 0, 0),
(16, 'X2Dt1YSOY1Nrqu9', 1, 'NJpmmU', '欧洲第一个对华免签的国家，曾受中国援助', '欧洲的全称是欧罗巴洲，英文为Europe。关于欧洲这个名称的由来，有一些传说。在希腊神话中，德墨忒尔（Demeter）是专管农事的女神，她保佑人间五谷丰登、人畜两旺。在有关这位女神的画像中，人们总是把她画成坐在公牛背上。古代，公牛是人类不可缺少的耕畜，女神既然主管农事，自然就要坐在公牛背上了。这位女神的另一个名字叫欧罗巴，人们出于对女神的敬意，就把欧罗巴称为大洲的名字', 'upload/photos/2018/08/dvdHPOZiuYsKKOBI5AUk_19_a403e29573a8287c7b4d6e09b5497c59_image.jpg', 'http%3A%2F%2Fips.ifeng.com%2Fvideo19.ifeng.com%2Fvideo09%2F2018%2F04%2F30%2F26523606-102-009-224021.mp4', '', '', '', '', 1534689956, '2018-08-19 14:45:56', 0, '欧洲', '00:00', 0, 1, 1, 0, 0, '2018/8', 0, 1, '4', 1, 0, 0, 0, 0, 0, 0, 0),
(17, 'TrpiCqAIbz56Hxq', 1, 'kYu4HN', '中国第一高楼 300亿高达636米比东方之门还要高2倍', '高楼即高层建筑，按传统来说，一般9层以上，带电梯的楼宇即可以被称为高楼。但在现代社会，由于高层建筑数量越来越多，高度也越来越高，对高楼又增加了新的定义，一般18层以上被称为高层建筑，100米或30层以上可以被称为超高层建筑或摩天大楼。根据世界超高层建筑学会的新标准，300米以上为超高层建筑。  <br>、', 'upload/photos/2018/08/adL6wzO2UhhPPOqKYpWe_19_395462f3c5111fb5ebd5f57950597592_image.jpg', 'http%3A%2F%2Fips.ifeng.com%2Fvideo19.ifeng.com%2Fvideo09%2F2018%2F04%2F29%2F26490684-102-9987625-210626.mp4', '', '', '', '', 1534690185, '2018-08-19 14:49:45', 0, '高楼', '00:00', 0, 1, 1, 2, 0, '2018/8', 0, 1, '4', 1, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `video_ads`
--

CREATE TABLE `video_ads` (
  `id` int(11) NOT NULL,
  `ad_link` varchar(400) NOT NULL DEFAULT '',
  `name` varchar(300) NOT NULL DEFAULT '',
  `ad_media` varchar(400) NOT NULL DEFAULT '',
  `ad_image` varchar(400) NOT NULL DEFAULT '',
  `skip_seconds` int(11) NOT NULL DEFAULT '0',
  `vast_type` varchar(30) NOT NULL DEFAULT '',
  `vast_xml_link` varchar(700) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `watch_later`
--

CREATE TABLE `watch_later` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `video_id` int(30) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `watch_later`
--

INSERT INTO `watch_later` (`id`, `user_id`, `video_id`, `time`) VALUES
(1, 1, 7, '1534596106'),
(2, 1, 5, '1534596131');

-- --------------------------------------------------------

--
-- 表的结构 `withdrawal_requests`
--

CREATE TABLE `withdrawal_requests` (
  `id` int(20) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(200) NOT NULL DEFAULT '',
  `amount` varchar(100) NOT NULL DEFAULT '0',
  `currency` varchar(20) NOT NULL DEFAULT '',
  `requested` varchar(100) NOT NULL DEFAULT '',
  `status` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `announcement_views`
--
ALTER TABLE `announcement_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `announcement_id` (`announcement_id`);

--
-- Indexes for table `banned`
--
ALTER TABLE `banned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `likes` (`likes`),
  ADD KEY `dis_likes` (`dis_likes`);

--
-- Indexes for table `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `type` (`type`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `reply_id` (`reply_id`);

--
-- Indexes for table `comm_replies`
--
ALTER TABLE `comm_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `value` (`value`(255));

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_one` (`user_one`),
  ADD KEY `user_two` (`user_two`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_key` (`lang_key`);

--
-- Indexes for table `likes_dislikes`
--
ALTER TABLE `likes_dislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `type` (`type`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`(255)),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `privacy` (`privacy`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `to_id` (`to_id`),
  ADD KEY `seen` (`seen`),
  ADD KEY `time` (`time`),
  ADD KEY `from_deleted` (`from_deleted`),
  ADD KEY `to_deleted` (`to_deleted`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `type` (`type`),
  ADD KEY `seen` (`seen`),
  ADD KEY `notifier_id` (`notifier_id`),
  ADD KEY `time` (`time`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `play_list`
--
ALTER TABLE `play_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list_id` (`list_id`(255)),
  ADD KEY `video_id` (`video_id`(255));

--
-- Indexes for table `profile_fields`
--
ALTER TABLE `profile_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_page` (`registration_page`),
  ADD KEY `active` (`active`),
  ADD KEY `profile_page` (`profile_page`);

--
-- Indexes for table `pt_posts`
--
ALTER TABLE `pt_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views` (`views`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_videos`
--
ALTER TABLE `saved_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `platform` (`platform`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `site_ads`
--
ALTER TABLE `site_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `placement` (`placement`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subscriber_id` (`subscriber_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typings`
--
ALTER TABLE `typings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `password` (`password`),
  ADD KEY `last_active` (`last_active`),
  ADD KEY `admin` (`admin`),
  ADD KEY `active` (`active`),
  ADD KEY `registered` (`registered`),
  ADD KEY `is_pro` (`is_pro`),
  ADD KEY `wallet` (`wallet`),
  ADD KEY `balance` (`balance`),
  ADD KEY `video_mon` (`video_mon`);

--
-- Indexes for table `user_ads`
--
ALTER TABLE `user_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usr_prof_fields`
--
ALTER TABLE `usr_prof_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `verification_requests`
--
ALTER TABLE `verification_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `video_id_2` (`video_id`),
  ADD KEY `youtube_id` (`youtube`),
  ADD KEY `vimeo` (`vimeo`),
  ADD KEY `daily` (`daily`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `featured` (`featured`),
  ADD KEY `registered` (`registered`),
  ADD KEY `views` (`views`),
  ADD KEY `time` (`time`),
  ADD KEY `order1` (`category_id`,`id`),
  ADD KEY `order2` (`id`,`views`),
  ADD KEY `240p` (`240p`),
  ADD KEY `360p` (`360p`),
  ADD KEY `480p` (`480p`),
  ADD KEY `720p` (`720p`),
  ADD KEY `1080p` (`1080p`),
  ADD KEY `4096p` (`4096p`),
  ADD KEY `2048p` (`2048p`),
  ADD KEY `privacy` (`privacy`),
  ADD KEY `short_id` (`short_id`),
  ADD KEY `age_restriction` (`age_restriction`),
  ADD KEY `approved` (`approved`);
ALTER TABLE `videos` ADD FULLTEXT KEY `description` (`description`);
ALTER TABLE `videos` ADD FULLTEXT KEY `title` (`title`);
ALTER TABLE `videos` ADD FULLTEXT KEY `tags` (`tags`);

--
-- Indexes for table `video_ads`
--
ALTER TABLE `video_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `watch_later`
--
ALTER TABLE `watch_later`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `announcement_views`
--
ALTER TABLE `announcement_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `banned`
--
ALTER TABLE `banned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `comments_likes`
--
ALTER TABLE `comments_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `comm_replies`
--
ALTER TABLE `comm_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- 使用表AUTO_INCREMENT `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `langs`
--
ALTER TABLE `langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- 使用表AUTO_INCREMENT `likes_dislikes`
--
ALTER TABLE `likes_dislikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `lists`
--
ALTER TABLE `lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `play_list`
--
ALTER TABLE `play_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `profile_fields`
--
ALTER TABLE `profile_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pt_posts`
--
ALTER TABLE `pt_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `saved_videos`
--
ALTER TABLE `saved_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `site_ads`
--
ALTER TABLE `site_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `typings`
--
ALTER TABLE `typings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `user_ads`
--
ALTER TABLE `user_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `usr_prof_fields`
--
ALTER TABLE `usr_prof_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `verification_requests`
--
ALTER TABLE `verification_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `video_ads`
--
ALTER TABLE `video_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `watch_later`
--
ALTER TABLE `watch_later`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
