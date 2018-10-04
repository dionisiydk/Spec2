Class {
	#name : #SpNotRestrictionTests,
	#superclass : #SpValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpNotRestrictionTests >> createRestriction [

	^SpNotRestriction negate: SpNilValueRestriction new
]

{ #category : #tests }
SpNotRestrictionTests >> testMatches [

	self assert: (restriction matches: Object new).
	self deny: (restriction matches: nil)
]
