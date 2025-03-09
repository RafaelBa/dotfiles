#!/usr/bin/env bash

for dir in /Library/Java/JavaVirtualMachines/*
do
    jenv add $dir/Contents/Home
done