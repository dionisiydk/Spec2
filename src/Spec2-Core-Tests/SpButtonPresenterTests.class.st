Class {
	#name : #SpButtonPresenterTests,
	#superclass : #SpCommandPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpButtonPresenterTests >> createPresenter [
	^SpCommandPresenter buttonOn: model
]

{ #category : #running }
SpButtonPresenterTests >> defaultModel [
	^[ commandWasExecuted := true ] asSpecCommand: 'test button'
]

{ #category : #tests }
SpButtonPresenterTests >> testApplyPressEffect [

	ui simulate: SpMouseDown on: presenter view.
	self assert: presenter currentStyle equals: #pressedButton.
	
	ui simulate: SpMouseUp on: presenter view.
	self assert: presenter currentStyle equals: #button.
]

{ #category : #tests }
SpButtonPresenterTests >> testCreationFromBlockWithNameAndIcon [

	presenter := SpCommandPresenter 
		buttonOn: [ commandWasExecuted := true ] named: 'test button' iconName: #classIcon.
	
	self assert: presenter model class equals: CmdCommandActivator.
	self assert: presenter model command class equals: SpPluggableCommand.
	self assert: presenter model menuItemName equals: 'test button'.
	self assert: presenter model menuItemIcon equals: (Smalltalk ui iconNamed: #classIcon)
]

{ #category : #tests }
SpButtonPresenterTests >> testExecuteCommandByClick [

	ui simulate: SpMouseClick on: presenter view.
	
	self assert: commandWasExecuted 
]

{ #category : #tests }
SpButtonPresenterTests >> testResetPressEffectWhenLeaveButton [

	ui simulate: SpMouseDown on: presenter view.
	self assert: presenter currentStyle equals: #pressedButton.
	
	ui simulate: SpMouseLeave on: presenter view.
	self assert: presenter currentStyle equals: #button
]
