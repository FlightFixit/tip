<?php print '<?xml version="1.0" encoding="utf-8"?>'; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Listing:</title></head>
<body>
<ol>
<?php
$dir = opendir(".");
$files = array();
while( $filename = readdir( $dir ) ) array_push($files, $filename);
sort($files);
foreach( $files as $filename ) {
if( ereg(".+([[:digit:]]{4})-([[:digit:]]+).*\\.pdf", $filename, $match)) {
            $name = date("F Y", strtotime("$match[1]/$match[2]/1"));
            echo "<li><a href=\"$filename\">$name</a></li>\n";
          }
        }
        closedir($dir);
      ?>
    </ul>
    <h1><i>Notes from the Underground</i> Archive</h1>
    <ul>
      <?php
        $dir = opendir(".");
        $files = array();
        while($filename = readdir($dir)) {
          array_push($files, $filename);
        }
        sort($files);
        foreach($files as $filename) {
          if(ereg ("underground_([[:digit:]]+)_([[:digit:]]+).*\\.pdf", $filename, $match)) {
            $name = date("F Y", strtotime("$match[1]/$match[2]/1"));
            echo "<li><a href=\"$filename\">$name</a></li>\n";
          }
        }
        closedir($dir);
      ?>
    </ul>
  </body>
</html>