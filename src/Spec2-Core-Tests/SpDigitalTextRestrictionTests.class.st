Class {
	#name : #SpDigitalTextRestrictionTests,
	#superclass : #SpTextValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpDigitalTextRestrictionTests >> createRestriction [
	^SpDigitalTextRestriction new
]

{ #category : #tests }
SpDigitalTextRestrictionTests >> testMatchesEmptyString [

	self assert: (restriction matches: '')
]

{ #category : #tests }
SpDigitalTextRestrictionTests >> testMatchesStringWithAllDigits [

	self assert: (restriction matches: '123')
]

{ #category : #tests }
SpDigitalTextRestrictionTests >> testNotMatchesStringWithAlmostOneNotDigitCharater [

	self deny: (restriction matches: '12 3')
]

{ #category : #tests }
SpDigitalTextRestrictionTests >> testNotValidatesAlphaCharactersInsertion [

	| actual |
	actual := restriction validateInsertionOf: 'new text' into: '1234' from: 1 to: 2.
	
	self deny: actual
]

{ #category : #tests }
SpDigitalTextRestrictionTests >> testValidatesNewDigitsInsertion [

	| actual |
	actual := restriction validateInsertionOf: '99' into: '1234' from: 1 to: 2.
	
	self assert: actual
]
