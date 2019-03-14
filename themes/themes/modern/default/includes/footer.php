<?php
/**
 * Footer template.
 *
 * The main footer template. This is used throughout the application.
 *
 * @author     Cory Collier <corycollier@corycollier.com>
 * @license    http://opensource.org/licenses/MIT  MIT License
 * @version    git: $Id$
 * @link       https://github.com/corycollier/simplesamlphp-module-themes
 * @see        https://github.com/simplesamlphp/simplesamlphp/
 * @since      File available since Release 1.3.0
 */
?>
<?php
// Define variables.
$url_path = SimpleSAML_Module::getModuleURL('themes');
$css_path = $url_path . '/css';
$js_path  = $url_path . '/js';
$img_path = $url_path . '/img';
?>

<?php
// Output the post content items.
if (!empty($this->data['htmlinject']['htmlContentPost'])) :
  foreach ($this->data['htmlinject']['htmlContentPost'] as $content) :
    echo $content;
  endforeach;
endif;
?>


    <!-- end .content -->

    <!-- end .footer -->

    <script src="<?php echo $js_path; ?>/jquery.js"></script>
    <script src="<?php echo $js_path; ?>/bootstrap.min.js"></script>
  </body>
</html>
