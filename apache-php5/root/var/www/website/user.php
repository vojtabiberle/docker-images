<?php
$processUser = posix_getpwuid( posix_geteuid() );
print $processUser['name'];