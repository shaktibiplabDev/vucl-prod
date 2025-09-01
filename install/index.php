<?php
// Obfuscated by script
$code = base64_decode('PD9waHAKLy8gUEhQIGNvZGUgdG8gaW5jbHVkZSBKYXZhU2NyaXB0IGZvciByZWRpcmVjdGlvbgplY2hvICc8c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCI+CiAgICB3aW5kb3cubG9jYXRpb24uaHJlZiA9ICJpbnN0YWxsLnBocCI7CiAgICAgIDwvc2NyaXB0Pic7CmV4aXQ7Cj8+');

// Create a temporary file in the SAME DIRECTORY as this script.
// This is crucial for preserving relative paths (e.g., require 'config/db.php').
$tmp_file = tempnam(__DIR__, 'php_'); 

// Check if temp file was created successfully
if ($tmp_file === false) {
    // Fallback to system temp dir if the script's directory is not writable
    $tmp_file = tempnam(sys_get_temp_dir(), 'php_');
    if ($tmp_file === false) {
        die("Failed to create any temporary file.");
    }
}

// Write the decoded PHP code to the temporary file
file_put_contents($tmp_file, $code);

// Execute the code by requiring the temporary file.
require $tmp_file;

// Clean up by deleting the temporary file
unlink($tmp_file);
?>