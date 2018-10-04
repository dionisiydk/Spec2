operations
decorateInsertionOf: newString into: decoratedString from: startIndex to: stopIndex
	
	| cleanedString |
	cleanedString := self deleteCharactersFrom: decoratedString startingAt: startIndex to: stopIndex.
	^self overrideCharactersFrom: cleanedString by: newString startingAt: startIndex