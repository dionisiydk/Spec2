Class {
	#name : #SpAbsentChildren,
	#superclass : #SpDataItemChildren,
	#classInstVars : [
		'instance'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #accessing }
SpAbsentChildren class >> instance [
	^instance ifNil: [ instance := self new ]
]

{ #category : #testing }
SpAbsentChildren >> isEmpty [
	^true
]
