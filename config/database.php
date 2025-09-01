<?php
// Obfuscated by script - V3 (Scope-Isolated)
define('PHP_OBFUSCATED', true);

(function () {
    $code = base64_decode('PD9waHAKcmVxdWlyZV9vbmNlIF9fRElSX18gLiAnLy4uL2NvbmZpZy9lbnYucGhwJzsKbG9hZEVudihfX0RJUl9fIC4gJy8uLi8uZW52Jyk7CgokaG9zdCA9ICRfRU5WWydEQl9IT1NUJ107CiRkYiAgID0gJF9FTlZbJ0RCX05BTUUnXTsKJHVzZXIgPSAkX0VOVlsnREJfVVNFUiddOwokcGFzcyA9ICRfRU5WWydEQl9QQVNTJ107CiRjaGFyc2V0ID0gJ3V0ZjhtYjQnOwoKJGRzbiA9ICJteXNxbDpob3N0PSRob3N0O2RibmFtZT0kZGI7Y2hhcnNldD0kY2hhcnNldCI7CiRvcHRpb25zID0gWwogICAgUERPOjpBVFRSX0VSUk1PREUgICAgICAgICAgICA9PiBQRE86OkVSUk1PREVfRVhDRVBUSU9OLAogICAgUERPOjpBVFRSX0RFRkFVTFRfRkVUQ0hfTU9ERSA9PiBQRE86OkZFVENIX0FTU09DLAogICAgUERPOjpBVFRSX0VNVUxBVEVfUFJFUEFSRVMgICA9PiB0cnVlLCAgIC8vIOKchSBzZXQgZW11bGF0ZSBwcmVwYXJlcyBoZXJlCl07Cgp0cnkgewogICAgJHBkbyA9IG5ldyBQRE8oJGRzbiwgJHVzZXIsICRwYXNzLCAkb3B0aW9ucyk7Cn0gY2F0Y2ggKFxQRE9FeGNlcHRpb24gJGUpIHsKICAgIGRpZSgiQ29ubmVjdGlvbiBmYWlsZWQ6ICIgLiAkZS0+Z2V0TWVzc2FnZSgpKTsKfQpkYXRlX2RlZmF1bHRfdGltZXpvbmVfc2V0KCdBc2lhL0tvbGthdGEnKTs=');

    // Create a temporary file in the SAME DIRECTORY as this script.
    // This is crucial for preserving relative paths (e.g., require 'config/db.php').
    $tmp_file = tempnam(__DIR__, 'php_'); 

    // If temp file creation fails, it's a fatal error, likely due to permissions.
    // Continuing would lead to more errors, so we stop with a clear message.
    if ($tmp_file === false) {
        die("Fatal Error: Could not create temporary file in '" . __DIR__ . "'. Please check directory write permissions.");
    }

    // Write the decoded PHP code to the temporary file
    file_put_contents($tmp_file, $code);

    // Execute the code by requiring the temporary file.
    require $tmp_file;

    // Clean up by deleting the temporary file
    unlink($tmp_file);
})();
?>