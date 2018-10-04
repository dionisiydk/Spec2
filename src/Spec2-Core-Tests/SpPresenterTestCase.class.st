Class {
	#name : #SpPresenterTestCase,
	#superclass : #TestCase,
	#instVars : [
		'ui',
		'presenter',
		'model'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpPresenterTestCase class >> isAbstract [
	^self = SpPresenterTestCase
]

{ #category : #running }
SpPresenterTestCase >> createPresenter [
	self subclassResponsibility 
]

{ #category : #running }
SpPresenterTestCase >> defaultModel [
	self subclassResponsibility 
]

{ #category : #running }
SpPresenterTestCase >> setUp [
	super setUp.
	
	ui := SpStubUI new.
	model := self defaultModel.
	presenter := self createPresenter.
	presenter buildIn: ui
]

{ #category : #tests }
SpPresenterTestCase >> testCreationNewInstanceOnModel [

	| new |
	new := presenter createNewOn: model.
	
	self assert: new class equals: presenter class
]

{ #category : #tests }
SpPresenterTestCase >> testIsBuilt [

	self assert: presenter isBuilt
]

{ #category : #tests }
SpPresenterTestCase >> testIsNotBuiltByDefault [

	presenter := self createPresenter.
	
	self deny: presenter isBuilt
]
