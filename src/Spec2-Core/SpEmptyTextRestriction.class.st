"
I require value to be always empty string. 
I am used in composition with other text restrictions to represent optional text values
"
Class {
	#name : #SpEmptyTextRestriction,
	#superclass : #SpTextRestriction,
	#category : 'Spec2-Core-Models'
}

{ #category : #testing }
SpEmptyTextRestriction >> matchesString: aString [
	^aString isEmpty
]
