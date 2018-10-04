validation
validateInsertionOf: newString into: originalString from: startIndex to: endIndex 
	^self matchesString: (originalString copyReplaceFrom: startIndex to: endIndex with: newString)