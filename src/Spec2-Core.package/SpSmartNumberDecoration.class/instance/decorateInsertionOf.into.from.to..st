operations
decorateInsertionOf: newString into: originalString from: startIndex to: stopIndex
	| modifiedString |
	modifiedString := originalString copyReplaceFrom: startIndex to: stopIndex with: newString.
	^self convertNativeTextToDecorated: modifiedString