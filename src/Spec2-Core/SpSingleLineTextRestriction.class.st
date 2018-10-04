"
I match any single line string and reject any multiline strings (including eigther cr or lf)
"
Class {
	#name : #SpSingleLineTextRestriction,
	#superclass : #SpTextRestriction,
	#category : 'Spec2-Core-Models'
}

{ #category : #testing }
SpSingleLineTextRestriction >> matchesString: aString [
	^(aString includesAny: { Character cr. Character lf }) not
]
