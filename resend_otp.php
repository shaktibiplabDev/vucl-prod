<?php
// Obfuscated by script - V3 (Scope-Isolated)
define('PHP_OBFUSCATED', true);

(function () {
    $code = base64_decode('PD9waHAKc2Vzc2lvbl9zdGFydCgpOwpyZXF1aXJlX29uY2UgX19ESVJfXyAuICcvY29uZmlnL2RhdGFiYXNlLnBocCc7CnJlcXVpcmVfb25jZSBfX0RJUl9fIC4gJy9pbmNsdWRlcy9lbWFpbC5waHAnOwoKaGVhZGVyKCdDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL2pzb24nKTsKCmlmICgkX1NFUlZFUlsnUkVRVUVTVF9NRVRIT0QnXSA9PT0gJ1BPU1QnKSB7CiAgICAkZGF0YSA9IGpzb25fZGVjb2RlKGZpbGVfZ2V0X2NvbnRlbnRzKCdwaHA6Ly9pbnB1dCcpLCB0cnVlKTsKICAgICR1c2VyX2lkID0gJGRhdGFbJ3VzZXJfaWQnXSA/PyAwOwogICAgCiAgICBpZiAoJHVzZXJfaWQgJiYgaXNzZXQoJF9TRVNTSU9OWycyZmFfdXNlcl9pZCddKSAmJiAkX1NFU1NJT05bJzJmYV91c2VyX2lkJ10gPT0gJHVzZXJfaWQpIHsKICAgICAgICAvLyBHZW5lcmF0ZSBuZXcgT1RQCiAgICAgICAgJG90cCA9IGdlbmVyYXRlT1RQKCk7CiAgICAgICAgJG90cF9leHBpcnkgPSB0aW1lKCkgKyAzMDA7IC8vIDUgbWludXRlcyBleHBpcnkKICAgICAgICAKICAgICAgICAvLyBTdG9yZSBpbiBzZXNzaW9uCiAgICAgICAgJF9TRVNTSU9OWydvdHBfY29kZSddID0gJG90cDsKICAgICAgICAkX1NFU1NJT05bJ290cF9leHBpcnknXSA9ICRvdHBfZXhwaXJ5OwogICAgICAgIAogICAgICAgIC8vIEdldCB1c2VyIGVtYWlsCiAgICAgICAgJHN0bXQgPSAkcGRvLT5wcmVwYXJlKCJTRUxFQ1QgZW1haWwgRlJPTSB1c2VycyBXSEVSRSBpZCA9ID8iKTsKICAgICAgICAkc3RtdC0+ZXhlY3V0ZShbJHVzZXJfaWRdKTsKICAgICAgICAkdXNlciA9ICRzdG10LT5mZXRjaCgpOwogICAgICAgIAogICAgICAgIGlmICgkdXNlcikgewogICAgICAgICAgICAvLyBTZW5kIE9UUCB2aWEgZW1haWwKICAgICAgICAgICAgJHN1YmplY3QgPSAiWW91ciBOZXcgVmVyaWZpY2F0aW9uIENvZGUiOwogICAgICAgICAgICAkbWVzc2FnZSA9ICJZb3VyIG5ldyB2ZXJpZmljYXRpb24gY29kZSBpczogJG90cFxuXG5UaGlzIGNvZGUgd2lsbCBleHBpcmUgaW4gNSBtaW51dGVzLiI7CiAgICAgICAgICAgIGlmIChzZW5kRW1haWwoJHVzZXJbJ2VtYWlsJ10sICRzdWJqZWN0LCAkbWVzc2FnZSkpIHsKICAgICAgICAgICAgICAgIGVjaG8ganNvbl9lbmNvZGUoWydzdWNjZXNzJyA9PiB0cnVlXSk7CiAgICAgICAgICAgICAgICBleGl0OwogICAgICAgICAgICB9CiAgICAgICAgfQogICAgfQogICAgCiAgICBlY2hvIGpzb25fZW5jb2RlKFsnc3VjY2VzcycgPT4gZmFsc2UsICdtZXNzYWdlJyA9PiAnRmFpbGVkIHRvIHJlc2VuZCBPVFAnXSk7CiAgICBleGl0Owp9Cj8+');

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