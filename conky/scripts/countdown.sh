#!/bin/bash
let diff=$(($(date -d'2009-01-09 18:15' +%s) - $(date +%s)))
printf "%02dd %02dh %02dm %02ds" $((diff/86400)) $((diff/3600%24)) $((diff/60%60)) $((diff%60))
