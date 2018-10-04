Class {
	#name : #SpEmptyTextRestrictionTests,
	#superclass : #SpTextValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpEmptyTextRestrictionTests >> createRestriction [
	
	^SpEmptyTextRestriction new
]

{ #category : #tests }
SpEmptyTextRestrictionTests >> testAllowAllTextRemoval [

	| actual |
	actual := restriction validateInsertionOf: '' into: '12' from: 1 to: 2.
	self assert: actual
]

{ #category : #tests }
SpEmptyTextRestrictionTests >> testForbidAnyTextInsertion [

	| actual |
	actual := restriction validateInsertionOf: 'new text' into: '' from: 1 to: 0.
	self deny: actual
]

{ #category : #tests }
SpEmptyTextRestrictionTests >> testMatchesOnlyEmptyText [
	
	self assert: (restriction matches: '').
	self deny: (restriction matches: 'some string')
]
