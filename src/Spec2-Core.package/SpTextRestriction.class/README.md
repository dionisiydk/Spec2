My subclasses describes expected text restriction.
They should implement #matches: method to validate given strings: 

	- matches: aString

In addition they can validate insertion operation into strings. I provide default implementation:

	- validateInsertionOf: newString into: originalString from: startIndex to: stopIndex