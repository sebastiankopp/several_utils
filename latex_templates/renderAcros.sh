#!/bin/bash

infile="$1"
outfile="$2"

if ! [ -f "$infile" ]
then
	>&2 echo 'Missing input file. Aborting'
	exit 42
fi

if [ "$outfile" = "" ]
then
	>&2 echo 'No output file given. Aborting'
	exit 43
fi

	
if [ -f "$outfile" ]
then
	>&2 echo "Output file $outfile exists and will be overwritten."
fi

# Compute max width
widest_abbrev=$(grep '\S\+' "$infile" | grep -v '^#' | awk -F= '{print length($1)" "$1}' | sort -n | tail -n 1 | awk '{print $2}') || exit 44

echo "Widest abbrevation: $widest_abbrev"

echo "\\begin{acronym}[${widest_abbrev}]" > "$outfile" || exit 44
grep '\S\+' "$infile" | grep -v '^#' | sort | awk -F= '{print "\\acro{"$1"}["$1"]{"$2"}"}' >> "$outfile" || exit 44
echo '\end{acronym}' >> "$outfile" || exit 44

