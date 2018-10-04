Class {
	#name : #SpTextValueRestrictionTestCase,
	#superclass : #SpConcreteValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpTextValueRestrictionTestCase class >> isAbstract [
	^self = SpTextValueRestrictionTestCase 
]

{ #category : #tests }
SpTextValueRestrictionTestCase >> testNotMatchesNotTextualObject [

	self deny: (restriction matches: Object new)
]
