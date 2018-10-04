Class {
	#name : #SpSimpleValueAspect,
	#superclass : #SpValueAspect,
	#instVars : [
		'value'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpSimpleValueAspect class >> of: anObject [
	^self new 
		value: anObject
]

{ #category : #operations }
SpSimpleValueAspect >> readValue [
	^value
]

{ #category : #accessing }
SpSimpleValueAspect >> value [
	^ value
]

{ #category : #accessing }
SpSimpleValueAspect >> value: anObject [
	value := anObject
]

{ #category : #operations }
SpSimpleValueAspect >> writeValue: anObject [
	value := anObject
]
