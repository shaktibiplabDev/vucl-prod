<?php
// Obfuscated by script
$code = base64_decode('PD9waHAKPGZvb3RlciBjbGFzcz0iY29udGVudC1mb290ZXIgZm9vdGVyIGJnLWZvb3Rlci10aGVtZSI+CiAgPGRpdiBjbGFzcz0iY29udGFpbmVyLXh4bCI+CiAgICA8ZGl2CiAgICAgIGNsYXNzPSJmb290ZXItY29udGFpbmVyIGQtZmxleCBhbGlnbi1pdGVtcy1jZW50ZXIganVzdGlmeS1jb250ZW50LWJldHdlZW4gcHktNCBmbGV4LW1kLXJvdyBmbGV4LWNvbHVtbiI+CiAgICAgIDxkaXYgY2xhc3M9InRleHQtYm9keSI+CiAgICAgICAgwqkgPHNjcmlwdD5kb2N1bWVudC53cml0ZShuZXcgRGF0ZSgpLmdldEZ1bGxZZWFyKCkpOzwvc2NyaXB0PiwKICAgICAgICBtYWRlIHdpdGgg4p2k77iPIGJ5IDxhIGhyZWY9IiIgdGFyZ2V0PSJfYmxhbmsiIGNsYXNzPSJmb290ZXItbGluayI+Vi1VQ0w8L2E+CiAgICAgICAgPHNwYW4gY2xhc3M9Im1zLTIiPnwgVmVyc2lvbjogPHN0cm9uZz48Pz0gaHRtbHNwZWNpYWxjaGFycygkY29kZVZlcnNpb24pID8+PC9zdHJvbmc+PC9zcGFuPgogICAgICA8L2Rpdj4KICAgICAgPGRpdiBjbGFzcz0iZC1ub25lIGQtbGctaW5saW5lLWJsb2NrIj4KICAgICAgICA8YSBocmVmPSJkb2N1bWVudGF0aW9uLnBocCIgdGFyZ2V0PSJfYmxhbmsiIGNsYXNzPSJmb290ZXItbGluayBtZS00Ij5Eb2N1bWVudGF0aW9uPC9hPgogICAgICAgIDxhIGhyZWY9IiIgdGFyZ2V0PSJfYmxhbmsiIGNsYXNzPSJmb290ZXItbGluayBkLW5vbmUgZC1zbS1pbmxpbmUtYmxvY2siPlN1cHBvcnQ8L2E+CiAgICAgIDwvZGl2PgogICAgPC9kaXY+CiAgPC9kaXY+CjwvZm9vdGVyPgo=');

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