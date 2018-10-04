Class {
	#name : #SpFormFieldPresenterTests,
	#superclass : #SpPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpFormFieldPresenterTests >> createPresenter [
	^SpFormFieldPresenter on: model
]

{ #category : #running }
SpFormFieldPresenterTests >> defaultModel [
	^(2@3) aspect x useSlot asValueHolder
]

{ #category : #tests }
SpFormFieldPresenterTests >> testConvertModelToValueHolder [

	presenter model: (2@3) aspect x.
	
	self assert: presenter model class equals: SpValueHolder.
	self assert: presenter model valueAspect class equals: SpObjectPropertyAspect.
]

{ #category : #tests }
SpFormFieldPresenterTests >> testCreatesLabelWithAspectName [
		
	| aspect labelContainer |
	aspect := presenter model valueAspect.
	
	labelContainer := presenter view contents first.
	self assert: labelContainer class equals: SpCompositeViewStub.
	self assert: labelContainer contents first class equals: SpLabelViewStub.
	self assert: labelContainer contents first contents equals: aspect name.
	self assert: labelContainer contents second class equals: SpLabelViewStub.
	self assert: labelContainer contents second contents equals: ':'.
]

{ #category : #tests }
SpFormFieldPresenterTests >> testCreatesTextInputForNumberValue [
		
	| aspect textInputView |
	aspect := presenter model valueAspect.
	textInputView := presenter view contents detect: [ :each | each class = SpTextInputViewStub].
	self assert: textInputView contents equals: aspect readValue asString.
	self 
		assert: textInputView textDecoration 
		equals: aspect inputPresenter textDecoration.
	self 
		assert: textInputView inputRestriction 
		equals: aspect inputPresenter inputRestriction
]

{ #category : #tests }
SpFormFieldPresenterTests >> testCreatesTextInputSubscribedOnAspectValueChange [
		
	| textInputView |
	presenter model value: 100.
	
	textInputView := presenter view contents detect: [ :each | each class = SpTextInputViewStub].
	self assert: textInputView contents equals: '100'
]

{ #category : #tests }
SpFormFieldPresenterTests >> testCreatesTextInputWhichAffectGivenModel [
		
	| textInputView |
	textInputView := presenter view contents detect: [ :each | each class = SpTextInputViewStub].
	
	textInputView simulateTextChange: '5'.
	
	self assert: textInputView contents equals: '5'.
	self assert: presenter model value equals: 5
]

{ #category : #tests }
SpFormFieldPresenterTests >> testCreationOnInvalidModelShouldForceInvalidStyle [
		
	| model |
	model := (2@3) aspect x 
		restriction: (SpNumberRestriction minValue: 100 maxValue: 1000); 
		asValueHolder.
	self deny: model isValid.
	
	presenter := SpFormFieldPresenter on: model.
	
	self assert: presenter currentStyle equals: #invalid
]

{ #category : #tests }
SpFormFieldPresenterTests >> testDetachingFromModel [
	
	presenter detachFromModel.	
	self deny: (presenter model announcer hasSubscriber: presenter).

	self deny: (presenter valuePresenter model announcer hasSubscriber: presenter valuePresenter)
]

{ #category : #tests }
SpFormFieldPresenterTests >> testHasUnsubmittedDataWhenModelWasNotAccepted [
	
	| point |
	point := 2@3.
	presenter model: point aspect x useSlot.
	presenter model value: 1000.
	
	self assert: point x equals: 2.
	self assert: presenter hasUnsubmittedData
]

{ #category : #tests }
SpFormFieldPresenterTests >> testPropogatesModelChanges [
	| parent executed |
	executed := false.
	parent := SpMultiLabelPresenterExample new.
	presenter parent: parent.
	parent whenModelChangedDo: [ executed := true ].
	
	presenter model value: 100.
	
	self assert: executed
]

{ #category : #tests }
SpFormFieldPresenterTests >> testSettingInvalidValueShouldApplyInvalidStyle [
		
	presenter model valueAspect restriction: (SpNumberRestriction minValue: 500).
	presenter model value: 100.
	self deny: presenter model isValid.
	
	self assert: presenter currentStyle equals: #invalid
]

{ #category : #tests }
SpFormFieldPresenterTests >> testShowsValidData [
		
	self assert: presenter showsValidData.
	
	presenter model valueAspect restriction: (SpNumberRestriction minValue: 500).
	presenter model value: 100.
	
	self deny: presenter model isValid.
	self deny: presenter showsValidData
]

{ #category : #tests }
SpFormFieldPresenterTests >> testSubmittingData [
	
	| point |
	point := 2@3.
	presenter model: point aspect x useSlot.
	presenter model value: 1000.
	
	self assert: point x equals: 2.
	presenter submitData.
	self assert: point x equals: 1000.
]
