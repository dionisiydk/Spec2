Class {
	#name : #SpSelectionStrategyTestCase,
	#superclass : #TestCase,
	#instVars : [
		'selectionStrategy'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpSelectionStrategyTestCase class >> isAbstract [
	^self = SpSelectionStrategyTestCase 
		
]

{ #category : #running }
SpSelectionStrategyTestCase >> createStrategy [
	self subclassResponsibility 
]

{ #category : #running }
SpSelectionStrategyTestCase >> setUp [
	super setUp.
	
	selectionStrategy := self createStrategy
]
