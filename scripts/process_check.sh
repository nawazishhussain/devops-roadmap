#!/bin/bash

echo "Running SSH processes:"
ps aux | grep ssh | grep -v grep

echo "Top disk usage:"
df -h | awk '{print $5 " " $6}'
