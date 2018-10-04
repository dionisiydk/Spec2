"
I represent invalid value.
I am used when actual object can't be parsed from string.
For example presenter for number aspect shows text input to get number from string.
User can type unparsable value. In that case value holder for number should be set to some invalid value. And I am used for that purpose. I allow lead to ""mopde isValid => false"" in such cases.
"
Class {
	#name : #SpInvalidValue,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpInvalidValue class >> with: anObject [
	^self new 
		contents: anObject
]

{ #category : #comparing }
SpInvalidValue >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ contents = anObject contents
]

{ #category : #accessing }
SpInvalidValue >> contents [
	^ contents
]

{ #category : #accessing }
SpInvalidValue >> contents: anObject [
	contents := anObject
]

{ #category : #converting }
SpInvalidValue >> convertValueToStringBy: aValueToStringConverter [

	^self displayString
]

{ #category : #displaying }
SpInvalidValue >> displayString [
	^contents asString 
]

{ #category : #comparing }
SpInvalidValue >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ contents hash
]
