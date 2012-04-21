<?php
/**
 * @package WordPress
 * @subpackage Rusty Grunge
 */

get_header(); ?>

		<section id="primary">
			<div id="content" role="main">
			
			<?php if ( '' != get_header_image() ) : ?>
			<div class="header-image">
				<img src="<?php header_image(); ?>" width="<?php echo HEADER_IMAGE_WIDTH; ?>" height="<?php echo HEADER_IMAGE_HEIGHT; ?>" alt="" />
			</div>
			<?php endif; ?>

				<?php the_post(); ?>

				<header class="page-header">
					<h1 class="page-title">
						<?php
							if ( is_day() ) :
								printf( __( 'Daily Archives: <span>%s</span>', 'rusty-grunge' ), get_the_date() );
							elseif ( is_month() ) :
								printf( __( 'Monthly Archives: <span>%s</span>', 'rusty-grunge' ), get_the_date( 'F Y' ) );
							elseif ( is_year() ) :
								printf( __( 'Yearly Archives: <span>%s</span>', 'rusty-grunge' ), get_the_date( 'Y' ) );
							else :
								_e( 'Archives', 'rusty-grunge' );
							endif;
						?>
					</h1>
				</header>

				<?php rewind_posts(); ?>

				<?php /* Display navigation to next/previous pages when applicable */ ?>
				<?php if ( $wp_query->max_num_pages > 1 ) : ?>
					<nav id="nav-above">
						<h1 class="section-heading"><?php _e( 'Post navigation', 'rusty-grunge' ); ?></h1>
						<div class="nav-previous"><?php next_posts_link( __( '<span class="meta-nav">&larr;</span> Older posts', 'rusty-grunge' ) ); ?></div>
						<div class="nav-next"><?php previous_posts_link( __( 'Newer posts <span class="meta-nav">&rarr;</span>', 'rusty-grunge' ) ); ?></div>
					</nav><!-- #nav-above -->
				<?php endif; ?>
				
				<?php /* Start the Loop */ ?>
				<?php while ( have_posts() ) : the_post(); ?>
					
					<?php get_template_part( 'content', get_post_format() ); ?>

				<?php endwhile; ?>
				
				<?php /* Display navigation to next/previous pages when applicable */ ?>
				<?php if (  $wp_query->max_num_pages > 1 ) : ?>
					<nav id="nav-below">
						<h1 class="section-heading"><?php _e( 'Post navigation', 'rusty-grunge' ); ?></h1>
						<div class="nav-previous"><?php next_posts_link( __( '<span class="meta-nav">&larr;</span> Older posts', 'rusty-grunge' ) ); ?></div>
						<div class="nav-next"><?php previous_posts_link( __( 'Newer posts <span class="meta-nav">&rarr;</span>', 'rusty-grunge' ) ); ?></div>
					</nav><!-- #nav-below -->
				<?php endif; ?>				

			</div><!-- #content -->
		</section><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>