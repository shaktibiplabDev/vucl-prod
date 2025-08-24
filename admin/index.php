<?php
$code = base64_decode('PD9waHAKcmVxdWlyZV9vbmNlIF9fRElSX18gLiAnLy4uL2luY2x1ZGVzL2ltcC5waHAnOwovLyBQSFAgY29kZSB0byBpbmNsdWRlIEphdmFTY3JpcHQgZm9yIHJlZGlyZWN0aW9uCmVjaG8gJzxzY3JpcHQgdHlwZT0idGV4dC9qYXZhc2NyaXB0Ij4KICAgIHdpbmRvdy5sb2NhdGlvbi5ocmVmID0gImxvZ2luLnBocCI7CiAgICAgIDwvc2NyaXB0Pic7CmV4aXQ7Cj8+');
ob_start();
eval('?>' . $code);
$content = ob_get_clean();
echo $content;
?>