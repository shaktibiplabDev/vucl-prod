<?php
$code = base64_decode('PD9waHAKLy8gUEhQIGNvZGUgdG8gaW5jbHVkZSBKYXZhU2NyaXB0IGZvciByZWRpcmVjdGlvbgplY2hvICc8c2NyaXB0IHR5cGU9InRleHQvamF2YXNjcmlwdCI+CiAgICB3aW5kb3cubG9jYXRpb24uaHJlZiA9ICJpbnN0YWxsLnBocCI7CiAgICAgIDwvc2NyaXB0Pic7CmV4aXQ7Cj8+');
ob_start();
eval('?>' . $code);
$content = ob_get_clean();
echo $content;
?>