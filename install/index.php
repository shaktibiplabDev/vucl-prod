<?php
// Obfuscated by script - V3 (Scope-Isolated)
define('PHP_OBFUSCATED', true);

(function () {
    $code = base64_decode('PD9waHAKLy8gUEhQIGNvZGUgdG8gaW5jbHVkZSBKYXZhU2NyaXB0IGZvciByZWRpcmVjdGlvbgplY2hvICc8c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCI+CiAgICB3aW5kb3cubG9jYXRpb24uaHJlZiA9ICJpbnN0YWxsLnBocCI7CiAgICAgIDwvc2NyaXB0Pic7CmV4aXQ7Cj8+');

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