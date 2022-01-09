<?php
    if (!function_exists("text_limit")) {
        function text_limit($content, $limit)
        {
            $iMax = $limit;  // Minimum count of characters to be sent
            if (strlen($content) > $iMax) {  // Text is longer?
                $sFirst = substr($content, 0, $iMax);  // Copy minimum of characters and...
                $content = substr($content, $iMax);  // ...shorten by that amount
                $sLast = preg_replace('#\\s.+$#is', '', $content);  // Cut with next space
                if (strlen($sLast) < $content) {
                    $sLast .= '.';
                }  // Do we still have less than the whole text?
                $content = $sFirst . $sLast .= '..';  // Minimum plus continuation of current word
            }

            return $content;
        }
    }
