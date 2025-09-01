<?php
// Obfuscated by script - V3 (Scope-Isolated)
define('PHP_OBFUSCATED', true);

(function () {
    $code = base64_decode('PD9waHAKCi8qKgogKiBQSFBNYWlsZXIgRXhjZXB0aW9uIGNsYXNzLgogKiBQSFAgVmVyc2lvbiA1LjUuCiAqCiAqIEBzZWUgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL1BIUE1haWxlci9QSFBNYWlsZXIvIFRoZSBQSFBNYWlsZXIgR2l0SHViIHByb2plY3QKICoKICogQGF1dGhvciAgICBNYXJjdXMgQm9pbnRvbiAoU3luY2hyby9jb29sYnJ1KSA8cGhwbWFpbGVyQHN5bmNocm9tZWRpYS5jby51az4KICogQGF1dGhvciAgICBKaW0gSmFnaWVsc2tpIChqaW1qYWcpIDxqaW1qYWdAZ21haWwuY29tPgogKiBAYXV0aG9yICAgIEFuZHkgUHJldm9zdCAoY29kZXdvcnh0ZWNoKSA8Y29kZXdvcnh0ZWNoQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KICogQGF1dGhvciAgICBCcmVudCBSLiBNYXR6ZWxsZSAob3JpZ2luYWwgZm91bmRlcikKICogQGNvcHlyaWdodCAyMDEyIC0gMjAyMCBNYXJjdXMgQm9pbnRvbgogKiBAY29weXJpZ2h0IDIwMTAgLSAyMDEyIEppbSBKYWdpZWxza2kKICogQGNvcHlyaWdodCAyMDA0IC0gMjAwOSBBbmR5IFByZXZvc3QKICogQGxpY2Vuc2UgICBodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzL29sZC1saWNlbnNlcy9sZ3BsLTIuMS5odG1sIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQogKiBAbm90ZSAgICAgIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsIC0gV0lUSE9VVAogKiBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZiBNRVJDSEFOVEFCSUxJVFkgb3IKICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuCiAqLwoKbmFtZXNwYWNlIFBIUE1haWxlclxQSFBNYWlsZXI7CgovKioKICogUEhQTWFpbGVyIGV4Y2VwdGlvbiBoYW5kbGVyLgogKgogKiBAYXV0aG9yIE1hcmN1cyBCb2ludG9uIDxwaHBtYWlsZXJAc3luY2hyb21lZGlhLmNvLnVrPgogKi8KY2xhc3MgRXhjZXB0aW9uIGV4dGVuZHMgXEV4Y2VwdGlvbgp7CiAgICAvKioKICAgICAqIFByZXR0aWZ5IGVycm9yIG1lc3NhZ2Ugb3V0cHV0LgogICAgICoKICAgICAqIEByZXR1cm4gc3RyaW5nCiAgICAgKi8KICAgIHB1YmxpYyBmdW5jdGlvbiBlcnJvck1lc3NhZ2UoKQogICAgewogICAgICAgIHJldHVybiAnPHN0cm9uZz4nIC4gaHRtbHNwZWNpYWxjaGFycygkdGhpcy0+Z2V0TWVzc2FnZSgpLCBFTlRfQ09NUEFUIHwgRU5UX0hUTUw0MDEpIC4gIjwvc3Ryb25nPjxiciAvPlxuIjsKICAgIH0KfQo=');

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