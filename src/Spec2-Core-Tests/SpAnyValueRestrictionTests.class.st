Class {
	#name : #SpAnyValueRestrictionTests,
	#superclass : #SpValueRestrictionTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpAnyValueRestrictionTests >> createRestriction [

	^SpAnyValueRestriction new
]

{ #category : #tests }
SpAnyValueRestrictionTests >> testMatchesAnyObject [
	
	self assert: (restriction matches: Object new).
	self assert: (restriction matches: nil).
]
