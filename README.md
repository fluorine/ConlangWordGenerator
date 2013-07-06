ConlangWordGenerator, 0.1.3 beta.
=================================

Description
-----------
This script takes a .lang file to generate random words for
constructed languages evaluating a regular grammar expression.

The .lang file is a little markup languages that must contain
a collection of phonemes with their probability weight, 
and a grammatical expression to generate words.

You don't need to know programming to write .lang files!

Instructions
------------
Usage:

	ruby generator.rb <quantity> "<file_name>.lang"

This command generates a list of words on the file "output-[file-name].txt"

Example
-------
The "tokipona.lang" file must be at root.

This command generates 7 Tokipona-like words:

	ruby generator.rb 7 "tokipona.lang"

The output-tokipona.txt file will include 7 
tokipona-like words:

	pison
	se
	nala
	pose
	lopi
	o
	ele

There are other example .lang files at "lang-examples" 
directory.

Custom .lang files
------------------
You must create your own .lang files to generate
random words for your constructed languages.

It's a simple syntax to describe phonemes, 
their probability and a simple regular grammatical
expression to generate words.

Examples can help you.
