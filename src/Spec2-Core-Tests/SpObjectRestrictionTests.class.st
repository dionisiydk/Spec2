Class {
	#name : #SpObjectRestrictionTests,
	#superclass : #SpConcreteValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpObjectRestrictionTests >> createRestriction [
	^SpObjectRestriction baseClass: Boolean
]

{ #category : #tests }
SpObjectRestrictionTests >> testComparisonWithAnotherObjectRestrictionWithDifferentBaseClass [

	| restriction2 |
	restriction2 := SpObjectRestriction baseClass: Number.
	
	self deny: restriction = restriction2
]

{ #category : #tests }
SpObjectRestrictionTests >> testMatches [

	self assert: (restriction matches: true).
	self assert: (restriction matches: false).
	self assert: (restriction matches: Boolean basicNew).
	
	self deny: (restriction matches: 1)
	
]
