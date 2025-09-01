<?php
// Obfuscated by script
$code = base64_decode('PD9waHAKLy8gQ2hlY2sgaWYgJ2luc3RhbGxlZC5sb2NrJyBleGlzdHMgaW4gdGhlIGN1cnJlbnQgZm9sZGVyCmlmICghZmlsZV9leGlzdHMoX19ESVJfXyAuICcvaW5zdGFsbGVkLmxvY2snKSkgewogICAgLy8gUmVkaXJlY3QgdG8gaW5zdGFsbC8gaWYgbm90IGluc3RhbGxlZAogICAgZWNobyAnPHNjcmlwdCB0eXBlPSJ0ZXh0L2phdmFzY3JpcHQiPgogICAgICAgIHdpbmRvdy5sb2NhdGlvbi5ocmVmID0gImluc3RhbGwvIjsKICAgIDwvc2NyaXB0Pic7CiAgICBleGl0Owp9CgovLyBJZiBpbnN0YWxsZWQsIHJlZGlyZWN0IHRvIGxvZ2luLnBocAplY2hvICc8c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCI+CiAgICB3aW5kb3cubG9jYXRpb24uaHJlZiA9ICJsb2dpbi5waHAiOwo8L3NjcmlwdD4nOwpleGl0Owo/Pgo=');

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