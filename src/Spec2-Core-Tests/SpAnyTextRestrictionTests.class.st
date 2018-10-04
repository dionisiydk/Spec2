Class {
	#name : #SpAnyTextRestrictionTests,
	#superclass : #SpTextValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpAnyTextRestrictionTests >> createRestriction [
	
	^SpAnyTextRestriction new
]

{ #category : #tests }
SpAnyTextRestrictionTests >> testMatchesAnyText [
	
	self assert: (restriction matches: '').
	self assert: (restriction matches: 'some string')
]

{ #category : #tests }
SpAnyTextRestrictionTests >> testValidatesAnyTextInsertion [

	| actual |
	actual := restriction validateInsertionOf: 'new text' into: 'some text' from: 1 to: 2.
	
	self assert: actual
]
