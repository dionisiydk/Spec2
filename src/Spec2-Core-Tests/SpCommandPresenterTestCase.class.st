Class {
	#name : #SpCommandPresenterTestCase,
	#superclass : #SpPresenterTestCase,
	#instVars : [
		'commandWasExecuted'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpCommandPresenterTestCase class >> isAbstract [
	^self = SpCommandPresenterTestCase
]

{ #category : #running }
SpCommandPresenterTestCase >> setUp [
	super setUp.
	
	commandWasExecuted := false
]

{ #category : #tests }
SpCommandPresenterTestCase >> testConvertsCommandModelToActivator [

	self assert: presenter model class equals: CmdCommandActivator.
	self assert: presenter model activationStrategy class equals: CmdManualActivationStrategy.
]
