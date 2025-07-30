#!/bin/bash
echo "Hello, $USER. Your path is $PWD"
echo "$PATH"
export PATH=$PATH:/custom
echo "$PATH"
