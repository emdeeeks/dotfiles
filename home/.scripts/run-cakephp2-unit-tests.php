#!/usr/bin/php
<?php

echo PHP_EOL;
echo '+ Starting unit tests'.PHP_EOL;

exec('Console/cake test app AllTests', $output, $returnCode);

if ($returnCode !== 0) {
    while (($minimalTestSummary = array_pop($output)) !== null) {
        if (strpos($minimalTestSummary, 'Tests:') !== false) {
            break;
        }
    }

    echo '+ Test suite failed:'.PHP_EOL;
    echo $minimalTestSummary;
    echo chr(27).'[0m'.PHP_EOL; // disable colors and add a line break
    echo PHP_EOL;
    exit(1);
}

echo '+ All tests passed.'.PHP_EOL;
echo PHP_EOL;
exit(0);
