"
I implement default string convertion for any object.
I simply return #displayString as string representation for given objects. 
And I raise error if user asks me to parse object from string.
"
Class {
	#name : #SpObjectToStringConverter,
	#superclass : #SpValueToStringConverter,
	#category : 'Spec2-Core-Models'
}

{ #category : #operations }
SpObjectToStringConverter >> convertValueToString: anObject [
	^anObject displayString
]

{ #category : #operations }
SpObjectToStringConverter >> parseValueFromString: aString [
	self error: 'Not supported operation. Use concrete converter class for this'
]

{ #category : #testing }
SpObjectToStringConverter >> supportsConvertionFromString [
	^false
]
