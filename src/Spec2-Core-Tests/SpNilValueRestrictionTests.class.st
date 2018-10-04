Class {
	#name : #SpNilValueRestrictionTests,
	#superclass : #SpValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpNilValueRestrictionTests >> createRestriction [

	^SpNilValueRestriction new
]

{ #category : #tests }
SpNilValueRestrictionTests >> testMatchesOnlyNil [
	
	self assert: (restriction matches: nil).
	self deny: (restriction matches: Object new)
]
