Class {
	#name : #SpNumberRestrictionTests,
	#superclass : #SpConcreteValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpNumberRestrictionTests >> createRestriction [
	^SpNumberRestriction new
]

{ #category : #tests }
SpNumberRestrictionTests >> testComparisonWithAnotherNumberRestrictionWithDifferentParameters [

	| restriction2 |
	restriction2 := SpNumberRestriction minValue: 10 maxValue: 20.
	
	self deny: restriction = restriction2
]

{ #category : #tests }
SpNumberRestrictionTests >> testHasInfiniteBoundsByDefault [
	
	self assert: restriction minValue equals: Float negativeInfinity.
	self assert: restriction maxValue equals: Float infinity.
]

{ #category : #tests }
SpNumberRestrictionTests >> testMatchingNumbers [

	restriction := SpNumberRestriction minValue: 10 maxValue: 20.
	
	self assert: (restriction matches: 12).
	self assert: (restriction matches: 20).
	self assert: (restriction matches: 10).
	self deny: (restriction matches: 5).
	self deny: (restriction matches: 40)
]

{ #category : #tests }
SpNumberRestrictionTests >> testNotMatchesNotNumberObject [

	self deny: (restriction matches: Object new)
]
