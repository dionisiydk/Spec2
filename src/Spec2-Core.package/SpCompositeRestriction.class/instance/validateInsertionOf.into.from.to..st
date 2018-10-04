text validation
validateInsertionOf: newString into: originalString from: startIndex to: endIndex 
	^self matches: (originalString copyReplaceFrom: startIndex to: endIndex with: newString)