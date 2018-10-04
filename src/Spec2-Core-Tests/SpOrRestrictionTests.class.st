Class {
	#name : #SpOrRestrictionTests,
	#superclass : #SpValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpOrRestrictionTests >> createRestriction [

	^SpOrRestriction option1: SpEmptyTextRestriction new option2: SpDigitalTextRestriction new
]

{ #category : #tests }
SpOrRestrictionTests >> testMatches [

	self assert: (restriction matches: '').
	self assert: (restriction matches: '1234').
	self deny: (restriction matches: Object new)
]

{ #category : #tests }
SpOrRestrictionTests >> testValidationTextInsertion [

	| actual |
	actual := restriction validateInsertionOf: '99' into: '1234' from: 1 to: 2.
	
	self assert: actual
]
