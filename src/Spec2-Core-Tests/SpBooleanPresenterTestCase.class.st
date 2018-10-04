Class {
	#name : #SpBooleanPresenterTestCase,
	#superclass : #SpValueInputPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpBooleanPresenterTestCase class >> isAbstract [
	^self = SpBooleanPresenterTestCase 
]

{ #category : #running }
SpBooleanPresenterTestCase >> defaultModel [
	^true aspect itself autoAcceptValues asValueHolder
]

{ #category : #running }
SpBooleanPresenterTestCase >> newValueForModel [
	^model value not
]

{ #category : #tests }
SpBooleanPresenterTestCase >> testCreatesIconPresenter [

	| icon |
	icon := presenter children anyOne.
	self assert: icon class equals: SpIconicLabelPresenter.
	self assert: icon model notNil
]

{ #category : #tests }
SpBooleanPresenterTestCase >> testDoNotReactOnMouseClicksWhenModelIsReadOnly [

	| currentValue |
	model valueAspect readOnly.
	presenter rebuild.
	currentValue := model value.
	
	ui simulate: SpMouseClick on: presenter view.
	self assert: model value equals: currentValue
]

{ #category : #tests }
SpBooleanPresenterTestCase >> testToggleModelValueOnMouseClick [

	| currentValue |
	currentValue := model value.
	
	ui simulate: SpMouseClick on: presenter view.
	self assert: model value equals: currentValue not.
	
	ui simulate: SpMouseClick on: presenter view.
	self assert: model value equals: currentValue.
]

{ #category : #tests }
SpBooleanPresenterTestCase >> testUpdatesIconWhenModelIsChanged [

	| currentIcon newIcon |
	currentIcon := presenter children anyOne model.
	
	presenter model value: false.
	newIcon := presenter children anyOne model.
	
	self deny: newIcon = currentIcon
]
