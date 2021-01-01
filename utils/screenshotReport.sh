#!/bin/bash
# Generate gallery from screenshot files for easy review

generate_screenshot_report() {

domain=$1
title="Screenshots for $domain"
cd "webscreenshot"

if [ -e screenshotReport.html ]
then
    rm screenshotReport.html
fi

cat >> ../screenshotReport.html << HEADER
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>$title</title>
<style>
/* TODO some CSS-fu to make this mess nicer :) */

.screenshot img {
  height: 50%;
  width: 50%;
  border: 1px solid black;
}
</style>
</head>
<body>
<div align="center">
  <h2>$title</h2>
  <hr>
HEADER

for i in *.png
do 
caption="$i"
cat >> ../screenshotReport.html << HTML
<div id="img_$i" class="screenshot">
  <a href="./webscreenshot/$i">
  <p>$caption</p>
  <img src="./webscreenshot/$i" alt="$caption"/>
  </a>
  <br>
</div>
HTML

done

cat >> ../screenshotReport.html << FOOTER
</div>
<footer>
  <div align="center">
    <hr>
    <p>Report generated by <a href="https://github.com/chvancooten/BugBountyScanner">BugBountyScanner</a></p>
  </div>
</footer>
</body>
</html>
FOOTER

cd ..
}