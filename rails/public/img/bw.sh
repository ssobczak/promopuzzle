#!/bin/bash
for i in `ls | grep gif | grep bw-`
do
   # convert $i -colorspace Gray bw-$i
   convert $i -blur 5x3  blur-$i
done