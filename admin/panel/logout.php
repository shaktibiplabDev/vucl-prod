<?php
// Obfuscated by script - V3 (Scope-Isolated)
define('PHP_OBFUSCATED', true);

(function () {
    $code = base64_decode('PD9waHAKc2Vzc2lvbl9zdGFydCgpOwoKLy8gRGVzdHJveSBzZXNzaW9uIGNvbXBsZXRlbHkKJF9TRVNTSU9OID0gYXJyYXkoKTsKaWYgKGluaV9nZXQoInNlc3Npb24udXNlX2Nvb2tpZXMiKSkgewogICAgJHBhcmFtcyA9IHNlc3Npb25fZ2V0X2Nvb2tpZV9wYXJhbXMoKTsKICAgIHNldGNvb2tpZSgKICAgICAgICBzZXNzaW9uX25hbWUoKSwgCiAgICAgICAgJycsIAogICAgICAgIHRpbWUoKSAtIDQyMDAwLAogICAgICAgICRwYXJhbXNbInBhdGgiXSwKICAgICAgICAkcGFyYW1zWyJkb21haW4iXSwKICAgICAgICAkcGFyYW1zWyJzZWN1cmUiXSwKICAgICAgICAkcGFyYW1zWyJodHRwb25seSJdCiAgICApOwp9CnNlc3Npb25fZGVzdHJveSgpOwo/PgoKPCFET0NUWVBFIGh0bWw+CjxodG1sIGxhbmc9ImVuIj4KPGhlYWQ+CiAgICA8bWV0YSBjaGFyc2V0PSJVVEYtOCI+CiAgICA8bWV0YSBuYW1lPSJ2aWV3cG9ydCIgY29udGVudD0id2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEuMCI+CiAgICA8dGl0bGU+TG9nZ2luZyBvdXQuLi48L3RpdGxlPgogICAgPHNjcmlwdD4KICAgICAgICAvLyBJbW1lZGlhdGUgcmVkaXJlY3QgYWZ0ZXIgc2Vzc2lvbiBpcyBkZXN0cm95ZWQKICAgICAgICB3aW5kb3cubG9jYXRpb24uaHJlZiA9ICIuLi8uLi9sb2dpbi5waHAiOwogICAgPC9zY3JpcHQ+CjwvaGVhZD4KPGJvZHk+CiAgICA8IS0tIEZhbGxiYWNrIGluIGNhc2UgSmF2YVNjcmlwdCBpcyBkaXNhYmxlZCAtLT4KICAgIDxub3NjcmlwdD4KICAgICAgICA8cD5Zb3UgaGF2ZSBiZWVuIGxvZ2dlZCBvdXQuIDxhIGhyZWY9Ii4uLy4uL2xvZ2luLnBocCI+Q2xpY2sgaGVyZTwvYT4gdG8gY29udGludWUuPC9wPgogICAgPC9ub3NjcmlwdD4KPC9ib2R5Pgo8L2h0bWw+');

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