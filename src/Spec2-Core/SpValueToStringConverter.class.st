"
My subclasses are resppnsible for converting given values to and from string.
They must implement following methods: 

- convertValueToString: anObject
- parseValueFromString: aString 

Users can use default instance:

	SpNumberToStringConverter default
"
Class {
	#name : #SpValueToStringConverter,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #accessing }
SpValueToStringConverter class >> default [
	^default ifNil: [ default := self new ]
]

{ #category : #operations }
SpValueToStringConverter >> convertValueToString: anObject [
	self subclassResponsibility 
]

{ #category : #operations }
SpValueToStringConverter >> parseValueFromString: aString [
	self subclassResponsibility 
]

{ #category : #testing }
SpValueToStringConverter >> supportsConvertionFromString [
	^true
]
