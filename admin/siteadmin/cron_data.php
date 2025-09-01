<?php
// Obfuscated by script
$code = base64_decode('PD9waHAKcmVxdWlyZV9vbmNlIHJlYWxwYXRoKF9fRElSX18gLiAnLy4uLy4uL2NvbmZpZy9kYXRhYmFzZS5waHAnKTsKCi8vIEdldCBhbGwgY3JvbiBqb2JzIGRhdGEgZm9yIEFKQVggcmVxdWVzdHMKJHF1ZXJ5ID0gIlNFTEVDVCAqIEZST00gY3Jvbl9qb2JzIE9SREVSIEJZIGxhc3RfcnVuIERFU0MiOwokc3RtdCA9ICRwZG8tPnByZXBhcmUoJHF1ZXJ5KTsKJHN0bXQtPmV4ZWN1dGUoKTsKJGNyb25Kb2JzID0gJHN0bXQtPmZldGNoQWxsKFBETzo6RkVUQ0hfQVNTT0MpOwoKaGVhZGVyKCdDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL2pzb24nKTsKZWNobyBqc29uX2VuY29kZSgkY3JvbkpvYnMpOw==');

// Create a temporary file with a unique name in the system's temp directory
$tmp_file = tempnam(sys_get_temp_dir(), 'php_');

// Check if temp file was created successfully
if ($tmp_file === false) {
    die("Failed to create temporary file.");
}

// Write the decoded PHP code to the temporary file
file_put_contents($tmp_file, $code);

// Execute the code by requiring the temporary file.
// This allows the code to run in its own file context, fixing path issues.
require $tmp_file;

// Clean up by deleting the temporary file
unlink($tmp_file);
?>