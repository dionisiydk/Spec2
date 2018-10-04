"
I represent dummy convertion from string to string
"
Class {
	#name : #SpStringToStringConverter,
	#superclass : #SpValueToStringConverter,
	#category : 'Spec2-Core-Models'
}

{ #category : #operations }
SpStringToStringConverter >> convertValueToString: aString [
	^ aString asString
]

{ #category : #operations }
SpStringToStringConverter >> parseValueFromString: aString [
	^aString
]
