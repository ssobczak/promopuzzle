#!/bin/bash
for i in `ls | grep gif`
do
   convert $i -colorspace Gray bw-$i
done