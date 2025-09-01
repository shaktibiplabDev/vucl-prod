<?php
// Obfuscated by script
$code = base64_decode('PD9waHAKZnVuY3Rpb24gbG9hZEVudigkcGF0aCkgewogICAgaWYgKCFmaWxlX2V4aXN0cygkcGF0aCkpIHJldHVybjsKCiAgICAkbGluZXMgPSBmaWxlKCRwYXRoLCBGSUxFX0lHTk9SRV9ORVdfTElORVMgfCBGSUxFX1NLSVBfRU1QVFlfTElORVMpOwogICAgZm9yZWFjaCAoJGxpbmVzIGFzICRsaW5lKSB7CiAgICAgICAgaWYgKHN0cl9zdGFydHNfd2l0aCh0cmltKCRsaW5lKSwgJyMnKSB8fCAhc3RyX2NvbnRhaW5zKCRsaW5lLCAnPScpKSBjb250aW51ZTsKICAgICAgICBsaXN0KCRrZXksICR2YWx1ZSkgPSBleHBsb2RlKCc9JywgJGxpbmUsIDIpOwogICAgICAgICRrZXkgPSB0cmltKCRrZXkpOwogICAgICAgICR2YWx1ZSA9IHRyaW0oJHZhbHVlLCAiIFx0XG5cclwwXHgwQlwiJyIpOwoKICAgICAgICBwdXRlbnYoIiRrZXk9JHZhbHVlIik7CiAgICAgICAgJF9FTlZbJGtleV0gPSAkdmFsdWU7CiAgICAgICAgJF9TRVJWRVJbJGtleV0gPSAkdmFsdWU7CiAgICB9Cn0KPz4=');

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