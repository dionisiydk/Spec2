Class {
	#name : #SpCompboBoxPresenterTests,
	#superclass : #SpValueSelectorPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpCompboBoxPresenterTests >> createPresenter [
	^SpComboBoxPresenter 
		on: model 
		options: (SpSimpleDataSource on: #(#value1 #value2 #value3))
]

{ #category : #running }
SpCompboBoxPresenterTests >> defaultModel [
	^#value1 aspect itself asValueHolder
]

{ #category : #tests }
SpCompboBoxPresenterTests >> testCreatesOptionButton [

	self assert: (presenter children includes: presenter optionButton)

]

{ #category : #tests }
SpCompboBoxPresenterTests >> testCreatesValuePresenter [

	| valuePresenter valueModel |
	valuePresenter := presenter valuePresenter.
	self assert: (presenter children includes: valuePresenter).
	self assert: valuePresenter class equals: SpTextInputPresenter.
	self assert: valuePresenter textDecoration equals: model valueAspect displayDecoration.
	valueModel := valuePresenter model.
	self assert: valueModel class equals: SpPrintedValueHolder.
	self assert: valueModel baseValueHolder equals: model.
	self assert: valueModel stringConverter equals: model valueAspect stringConverter.
]
