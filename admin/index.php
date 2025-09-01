<?php
// Obfuscated by script
$code = base64_decode('PD9waHAKcmVxdWlyZV9vbmNlIF9fRElSX18gLiAnLy4uL2luY2x1ZGVzL2ltcC5waHAnOwovLyBQSFAgY29kZSB0byBpbmNsdWRlIEphdmFTY3JpcHQgZm9yIHJlZGlyZWN0aW9uCmVjaG8gJzxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0Ij4KICAgIHdpbmRvdy5sb2NhdGlvbi5ocmVmID0gImxvZ2luLnBocCI7CiAgICAgIDwvc2NyaXB0Pic7CmV4aXQ7Cj8+');

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