Class {
	#name : #SpComputedValueAspect,
	#superclass : #SpValueAspect,
	#instVars : [
		'block'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #accessing }
SpComputedValueAspect class >> block: aBlock [
	^self new 
		block: aBlock
]

{ #category : #accessing }
SpComputedValueAspect >> block [
	^ block
]

{ #category : #accessing }
SpComputedValueAspect >> block: anObject [
	block := anObject
]

{ #category : #initialization }
SpComputedValueAspect >> isAlwaysReadOnly [
	^true
]

{ #category : #operations }
SpComputedValueAspect >> readValue [
	^block value
]

{ #category : #operations }
SpComputedValueAspect >> writeValue: anObject [
	"It is readonly aspect"
	self shouldNotImplement 
]
