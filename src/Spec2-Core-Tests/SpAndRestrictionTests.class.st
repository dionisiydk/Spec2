Class {
	#name : #SpAndRestrictionTests,
	#superclass : #SpValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpAndRestrictionTests >> createRestriction [

	^SpAndRestriction 
		option1: (SpNumberRestriction minValue: 10 maxValue: 30) 
		option2: (SpNumberRestriction minValue: 20 maxValue: 50)
]

{ #category : #tests }
SpAndRestrictionTests >> testMatches [

	self assert: (restriction matches: 25).
	self deny: (restriction matches: 14).
	self deny: (restriction matches: 35)
]
