Class {
	#name : #SpSingleLineTextRestrictionTests,
	#superclass : #SpTextValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpSingleLineTextRestrictionTests >> createRestriction [
	^SpSingleLineTextRestriction new
]

{ #category : #tests }
SpSingleLineTextRestrictionTests >> testMatchesEmptyString [

	self assert: (restriction matches: '')
]

{ #category : #tests }
SpSingleLineTextRestrictionTests >> testMatchesSingleLineString [

	self assert: (restriction matches: 'some string')
]

{ #category : #tests }
SpSingleLineTextRestrictionTests >> testNotMatchesStringWithCr [

	self deny: (restriction matches: 'line1', String cr, 'line2')
]

{ #category : #tests }
SpSingleLineTextRestrictionTests >> testNotMatchesStringWithLf [

	self deny: (restriction matches: 'line1', String lf, 'line2')
]

{ #category : #tests }
SpSingleLineTextRestrictionTests >> testNotValidatesNewLineInsertion [

	| actual |
	actual := restriction validateInsertionOf: String cr into: 'some text' from: 1 to: 2.
	
	self deny: actual
]

{ #category : #tests }
SpSingleLineTextRestrictionTests >> testValidatesNewCharactersInsertion [

	| actual |
	actual := restriction validateInsertionOf: 'new text' into: 'some text' from: 1 to: 2.
	
	self assert: actual
]
