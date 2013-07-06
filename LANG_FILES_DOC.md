LANG files documentation
========================
LANG files are written in a little lightweight
markup language for statistical linguistics.

Any basic LANG file can be divided in two parts:
* Groups of phonemes (each phoneme has a weight).
* A grammatical expression.

These files can be interpreted to generate
random words.

Phonetical groups (symbolsets)
------------------------------
All phonemes must be grouped into logical units.
Each phoneme has its own statistical weight.

For example, here's a group of vowels:

	symbols for a vowel:
	   a: 50
	   e: 60
	   i: 40
	   o: 45
	   u: 40

Anything between the keyword "for" and
the last word is ignored, so these forms
are all allowed:

	symbols for vowel:

	symbols for each vowel:

	symbols for any vowel:

You can also use "=" instead ":" when
defining a phoneme.

A phoneme's statistical weight gives
a priority to the symbol. It must be an
integer greater than 0 and less than 100.

Expression and operators
------------------------
Each LANG file has an expression at the end.

The expression most be at the end, starting in
the next line, after:

	expression:

An expression is composed of operators that
may be nested.

 * **Maybe(weight, A)**: A symbol from the **A**
   SymbolSet may appear or not (empty string).
   The weight states the possibility of **A**
   to appear.

 * **Maybe(A)**: Same operator, but with default
   50 weight.

 * **Or(weight, A, B)**: A symbol from SymbolSet
   A or B may appear. The weight specifies the
   possibility of a symbol from **A** for
   appearing, and the complement (100 - A) must
   be the possibility of a symbol from **B**
   to appear.

 * A **+** B: The plus sign to append A and
   B results.