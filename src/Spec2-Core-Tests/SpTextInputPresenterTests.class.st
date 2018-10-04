Class {
	#name : #SpTextInputPresenterTests,
	#superclass : #SpPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpTextInputPresenterTests >> createPresenter [
	^SpTextInputPresenter on: model
]

{ #category : #running }
SpTextInputPresenterTests >> defaultModel [
	^SpPrintedValueHolder 
		of: 10 aspect itself asValueHolder 
		stringConverter: SpNumberToStringConverter default
]

{ #category : #tests }
SpTextInputPresenterTests >> testConvertModelToPrintedValueHolder [

	| givenModel |
	givenModel := (2@3) aspect x asValueHolder.
	presenter model: givenModel.
	
	self assert: presenter model class equals: SpPrintedValueHolder.
	self assert: presenter model baseValueHolder equals: givenModel.
	self assert: presenter model stringConverter equals: givenModel valueAspect stringConverter.
]

{ #category : #tests }
SpTextInputPresenterTests >> testCreateTextView [
		
	| textInputView |
	textInputView := presenter view.
	
	self assert: textInputView class equals: SpTextInputViewStub 
]

{ #category : #tests }
SpTextInputPresenterTests >> testCreatesReadOnlyTextViewWhenModelIsReadOnly [

	| givenModel |
	givenModel := (2@3) aspect x readOnly asValueHolder.
	presenter model: givenModel.
	presenter rebuild.
	
	self assert: presenter view isReadOnly
]

{ #category : #tests }
SpTextInputPresenterTests >> testDetachingFromModel [
	
	presenter detachFromModel.	
	self deny: (presenter model announcer hasSubscriber: presenter)
]

{ #category : #tests }
SpTextInputPresenterTests >> testIsSubscribedOnModelChanges [
		
	| textInputView |
	presenter model value: '100'.
	
	textInputView := presenter view.
	self assert: textInputView contents equals: '100'
]

{ #category : #tests }
SpTextInputPresenterTests >> testIsSubscribedOnViewChangesOfText [
		
	| textInputView |
	textInputView := presenter view.
	
	textInputView simulateTextChange: '100'.	
	
	self assert: presenter model value equals: '100'
]

{ #category : #tests }
SpTextInputPresenterTests >> testPreventCircularUpdateOfViewWhenViewChangesModel [
		
	| textInputView |
	textInputView := presenter view.
	textInputView updateCount: 0. "reset any initial updates".
	
	textInputView simulateTextChange: '100'.	
	self assert: textInputView updateCount equals: 0 
]

{ #category : #tests }
SpTextInputPresenterTests >> testUpdateModelWithNativeTextConvertedByTextDecoration [
		
	| textInputView |
	presenter textDecoration: SpSmartNumberDecoration default.
	textInputView := presenter view.
	
	textInputView simulateTextChange: '1 000'. "It is decorated text visible to user due to given decoration"	
	
	self assert: presenter model value equals: '1000'
]
