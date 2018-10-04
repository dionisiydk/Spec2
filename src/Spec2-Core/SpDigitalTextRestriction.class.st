"
I matches only strings with all digital characters
"
Class {
	#name : #SpDigitalTextRestriction,
	#superclass : #SpTextRestriction,
	#category : 'Spec2-Core-Models'
}

{ #category : #testing }
SpDigitalTextRestriction >> matchesString: aString [

	^aString isEmpty or: [aString isAllDigits]
]

{ #category : #testing }
SpDigitalTextRestriction >> validateInsertionOf: newString into: originalString from: startIndex to: endIndex [ 
	^self matchesString: newString
]
