operations
decorateInsertionOf: newString into: originalString from: startIndex to: stopIndex
	
	^originalString copyReplaceFrom: startIndex to: stopIndex with: newString