Class {
	#name : #SpTextDecorationTestCase,
	#superclass : #TestCase,
	#instVars : [
		'decoration'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpTextDecorationTestCase class >> isAbstract [
	^self = SpTextDecorationTestCase
]

{ #category : #running }
SpTextDecorationTestCase >> createTextDecoration [
	self subclassResponsibility 
]

{ #category : #running }
SpTextDecorationTestCase >> setUp [
	super setUp.
	
	decoration := self createTextDecoration
]
