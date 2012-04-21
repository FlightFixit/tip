<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo( 'html_type' ); ?>; charset=<?php bloginfo( 'charset' ); ?>" />
<title><?php wp_title(); ?> <?php bloginfo( 'name' ); ?></title>

<link rel="stylesheet" href="<?php bloginfo( 'stylesheet_url' ); ?>?1" type="text/css" media="screen" />
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />

<?php 
if ( is_singular() ) wp_enqueue_script( 'comment-reply' );
wp_head(); 
?>
</head>
<?php $bodyId="";if(is_home()){$bodyId="home";}?>
<body id="<?php echo $bodyId;?>" <?php body_class(); ?>>

<div id="wrap">
<div id="header"><h1><a href="<?php echo home_url( '/' ); ?>"><?php bloginfo( 'name' ); ?></a></h1>
<p class="description"><?php bloginfo( 'description' ); ?></p>
</div>
