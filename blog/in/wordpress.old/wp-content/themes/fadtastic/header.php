<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
	<meta http-equiv="Content-Type" content="<?php bloginfo( 'html_type' ); ?>; charset=<?php bloginfo( 'charset' ); ?>" />
	<title><?php wp_title(); ?> <?php bloginfo( 'name' ); ?></title>
	<link rel="stylesheet" href="<?php bloginfo( 'stylesheet_url' ); ?>" type="text/css" media="screen" />
	<link href="<?php bloginfo( 'stylesheet_directory' ); ?>/css/fadtasticdev_print.css" rel="stylesheet" type="text/css" media="print" />
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
<?php
if ( is_singular() ) wp_enqueue_script( 'comment-reply' );
wp_head();
?>
</head>

<body <?php body_class(); ?>>

<div id="wrapper">
	<div class="content_padding">

		<div id="top_menu">

			<?php get_search_form(); ?>

			<div class="clear"></div>

		</div>

		<div id="header_effect">
			<div id="header">
					<p><a href="<?php bloginfo( 'url' ); ?>"><?php bloginfo( 'name' ); ?></a></p>
			</div>
		</div>

		<div id="navcontainer">
			<?php wp_nav_menu( array( 'container' => false, 'theme_location' => 'primary', 'fallback_cb' => 'fadtastic_page_menu' ) ); ?>
		</div>

