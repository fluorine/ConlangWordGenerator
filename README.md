ConlangWordGenerator, 0.2.0 beta.
=================================
**Now it's a gem!**

Description
-----------
This gem allows the user to generate words for
constructed languages, given a LANG file that
describes the language. It can also be useful
for linguistics to study and generate words from
a given language.

The `*.lang` file must include sets of phonemes with 
their individual probability weight, and a grammatical
expression, to describe how to generate words for the
described language.

Instructions
------------
Usage as **command line executable**:

	conlang <words count> '<LANG file>'

This command produces an `output-<name>.txt`
file that includes a list of the generated words,
separated by newlines.

Usage as **gem**:

	require 'conlang'

	# Path to LANG file, as constructor.
	x = WordGenerator.new("tokipona.lang")

	# Print ten generated words as
	# an array of strings.
	p x.get_words(10)


There are `*.lang` files as examples at `lang-examples` 
directory of this [project's source](https://github.com/fluorine/ConlangWordGenerator).

Custom .lang files
------------------
You must create your own .lang files to generate random 
words for your constructed languages.

There files include a simple lightweight markup language
to describe sets of phonemes, their probability, and a 
simple regular grammatical expression.

You can learn how to create LANG files [**here**](LANG_FILES_DOC.md).
Again, examples at `lang-examples` directory can help you a lot.

The class `WordGenerator` takes a path to a valid `*.lang`
file to produce a generator of words, as described previously
in the **Instructions** section.
