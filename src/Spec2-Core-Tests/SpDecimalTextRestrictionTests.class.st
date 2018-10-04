Class {
	#name : #SpDecimalTextRestrictionTests,
	#superclass : #SpTextValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpDecimalTextRestrictionTests >> createRestriction [
	
	^SpDecimalTextRestriction new
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testDigitalStringWithDecimalSeparatorShouldBeNotValidWhenZeroDecimalDigitsCount [

	| actual |
	restriction decimalDigitsCount: 0.
	
	actual := restriction matches: '1.3'.
	
	self deny: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testDigitalStringWithFirstDecimalSeparatorShouldBeValid [

	| actual |
	actual := restriction matches: '.1'.
	
	self assert: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testDigitalStringWithLastDecimalSeparatorShouldBeValid [

	| actual |
	actual := restriction matches: '123.'.
	
	self assert: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testDigitalStringWithSecondDecimalSeparatorShouldBeValid [

	| actual |
	restriction decimalSeparators: '.,'.
	
	actual := restriction matches: '1,3'.
	
	self assert: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testDigitalStringWithTooMuchDecimalDigitsShouldBeNotValid [

	| actual |
	restriction decimalDigitsCount: 1.
	actual := restriction matches: '123.34'.
	
	self deny: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testDigitalStringWithTwoDecimalSeparatorsShouldBeNotValid [

	| actual |
	actual := restriction matches: '12.3.3'.
	
	self deny: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testDigitalStringWithTwoDifferentDecimalSeparatorsShouldBeNotValid [

	| actual |
	restriction decimalSeparators: ',.'.
	
	actual := restriction matches: '1,23.'.
	
	self deny: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testEmptyStringShouldBeValid [

	| actual |
	actual := restriction matches: ''.
	
	self assert: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testHasDecimalSeparatorsByDefault [

	self assert: restriction decimalSeparators equals: '.,'
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testHasInfiniteDecimalDigitsByDefault [

	self assert: restriction decimalDigitsCount equals: Float infinity
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testNotValidatesAlphaCharactersInsertion [

	| actual |
	actual := restriction validateInsertionOf: 'aa' into: '1234' from: 1 to: 2.
	
	self deny: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testOnlyDecimalSeparatorShouldBeValid [

	| actual |
	actual := restriction matches: '.'.
	
	self assert: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testStringWithAllDigitsShouldBeValid [

	| actual |
	actual := restriction matches: '123'.
	
	self assert: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testStringWithAlmostOneNotDigitalCharacterShouldBeNotValid [

	| actual |
	actual := restriction matches: '123.2 3'.
	
	self deny: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testStringWithDecimalDigitsShouldBeValid [

	| actual |
	actual := restriction matches: '123.23'.
	
	self assert: actual
]

{ #category : #tests }
SpDecimalTextRestrictionTests >> testValidatesNewDigitsInsertion [

	| actual |
	actual := restriction validateInsertionOf: '99' into: '1234' from: 1 to: 2.
	
	self assert: actual
]
