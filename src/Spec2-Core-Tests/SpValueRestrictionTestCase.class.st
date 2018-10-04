Class {
	#name : #SpValueRestrictionTestCase,
	#superclass : #TestCase,
	#instVars : [
		'restriction'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpValueRestrictionTestCase class >> isAbstract [
	^self = SpValueRestrictionTestCase
]

{ #category : #running }
SpValueRestrictionTestCase >> createRestriction [
	self subclassResponsibility 
]

{ #category : #running }
SpValueRestrictionTestCase >> setUp [
	super setUp.
	
	restriction := self createRestriction
]

{ #category : #tests }
SpValueRestrictionTestCase >> testComparingWithCopy [

	self assert: restriction equals: restriction copy.
	self assert: restriction hash equals: restriction hash
]

{ #category : #tests }
SpValueRestrictionTestCase >> testComparingWithSelf [

	self assert: restriction equals: restriction
]

{ #category : #tests }
SpValueRestrictionTestCase >> testComposingWithAnotherRestrictionByAnd [

	| actual restriction2 |
	restriction2 := self createRestriction.
	
	actual := restriction & restriction2.
	
	self assert: actual class equals: SpAndRestriction.
	self assert: actual option1 equals: restriction.
	self assert: actual option2 equals: restriction2.
]

{ #category : #tests }
SpValueRestrictionTestCase >> testComposingWithAnotherRestrictionByOr [

	| actual restriction2 |
	restriction2 := self createRestriction.
	
	actual := restriction | restriction2.
	
	self assert: actual class equals: SpOrRestriction.
	self assert: actual option1 equals: restriction.
	self assert: actual option2 equals: restriction2.
]

{ #category : #tests }
SpValueRestrictionTestCase >> testCreationNegatedRestriction [

	| actual |
	actual := restriction class not.
	
	self assert: actual class equals: SpNotRestriction.
	self assert: actual actualRestriction equals: restriction class new.
]

{ #category : #tests }
SpValueRestrictionTestCase >> testNegatingRestriction [

	| actual |
	actual := restriction not.
	
	self assert: actual class equals: SpNotRestriction.
	self assert: actual actualRestriction equals: restriction.
]
