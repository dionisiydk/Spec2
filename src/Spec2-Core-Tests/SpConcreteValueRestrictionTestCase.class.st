Class {
	#name : #SpConcreteValueRestrictionTestCase,
	#superclass : #SpValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpConcreteValueRestrictionTestCase class >> isAbstract [
	^self = SpConcreteValueRestrictionTestCase
]

{ #category : #tests }
SpConcreteValueRestrictionTestCase >> testNotMatchesNil [

	self deny: (restriction matches: nil)
]
