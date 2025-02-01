#!/bin/bash

echo "Compiling $1..."
bibtex $(echo $1 | sed 's/\.[^.]*$//')
latex $1
pdflatex $1
echo "Done compile"
