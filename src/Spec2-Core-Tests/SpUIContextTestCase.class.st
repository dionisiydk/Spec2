Class {
	#name : #SpUIContextTestCase,
	#superclass : #TestCase,
	#instVars : [
		'uiContext'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpUIContextTestCase class >> isAbstract [
	^self == SpUIContextTestCase
]

{ #category : #running }
SpUIContextTestCase >> createUIContext [
	self subclassResponsibility 
]

{ #category : #running }
SpUIContextTestCase >> setUp [
	super setUp.
	
	uiContext := self createUIContext
]

{ #category : #tests }
SpUIContextTestCase >> testComparisonWithCopy [

	| copy |
	copy := uiContext copy.
	
	self assert: uiContext equals: copy.
	self assert: uiContext hash equals: copy hash
]

{ #category : #tests }
SpUIContextTestCase >> testComparisonWithItself [

	self assert: uiContext equals: uiContext
]
