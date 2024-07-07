#!/bin/bash
awk '/^l/ {print $0}' text.txt
awk '/x$/{print $0}' text.txt
awk '/^l.*n$/{print $0}' text.txt

