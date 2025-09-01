<?php
// Obfuscated by script - V3 (Scope-Isolated)
define('PHP_OBFUSCATED', true);

(function () {
    $code = base64_decode('PD9waHAKcmVxdWlyZV9vbmNlIHJlYWxwYXRoKF9fRElSX18gLiAnLy4uLy4uL2NvbmZpZy9kYXRhYmFzZS5waHAnKTsKCi8vIEdldCBhbGwgY3JvbiBqb2JzIGRhdGEgZm9yIEFKQVggcmVxdWVzdHMKJHF1ZXJ5ID0gIlNFTEVDVCAqIEZST00gY3Jvbl9qb2JzIE9SREVSIEJZIGxhc3RfcnVuIERFU0MiOwokc3RtdCA9ICRwZG8tPnByZXBhcmUoJHF1ZXJ5KTsKJHN0bXQtPmV4ZWN1dGUoKTsKJGNyb25Kb2JzID0gJHN0bXQtPmZldGNoQWxsKFBETzo6RkVUQ0hfQVNTT0MpOwoKaGVhZGVyKCdDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL2pzb24nKTsKZWNobyBqc29uX2VuY29kZSgkY3JvbkpvYnMpOw==');

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