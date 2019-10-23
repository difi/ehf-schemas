#!/bin/sh

echo '<?xml version="1.0" encoding="UTF-8"?>'
echo '<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" targetNamespace="dummy">'

for qu in $@; do
  for f in $(find $qu -type f -name '*.xsd' | sort); do
    ns=$(cat $f | grep targetNamespace | head -1 | sed "s:(.*)targetNamespace=\"::" | cut -d '"' -f 2)

    echo -n "\t"
    echo -n '<xs:import schemaLocation="'
    echo -n $f
    echo -n '" namespace="'
    echo -n $ns
    echo '"/>'
  done
done

echo '</xs:schema>'
