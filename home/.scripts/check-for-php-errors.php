#!/usr/bin/php
<?php
// Grab all added, copied or modified files into $output array
exec('git diff --cached --name-status --diff-filter=ACM', $output);
foreach ($output as $file) {
    $fileName = trim(substr($file, 1));
    // We only want to check PHP files
    if (pathinfo($fileName,PATHINFO_EXTENSION) == "php") {
        $lint_output = array();
        // Check syntax with PHP lint
        exec("php -l " . escapeshellarg($fileName), $lint_output, $return);
        if ($return == 0) {
            continue;
        } else {
            echo implode("\n", $lint_output), "\n";
            exit(1);
        }
    }
}
exit(0);
?>
