Class {
	#name : #SpRadioButtonPresenterTests,
	#superclass : #SpBooleanPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpRadioButtonPresenterTests >> createPresenter [
	^SpBooleanPresenter radioButtonOn: model
]

{ #category : #tests }
SpRadioButtonPresenterTests >> testHasRadioButtonStyle [

	self assert: presenter currentStyle equals: #radioButton
]

{ #category : #tests }
SpRadioButtonPresenterTests >> testRepresentsFalseWithRadioButtonUnselectedIcon [

	| icon |
	model value: false.
	
	icon := presenter children anyOne.
	self assert: icon model equals: #radioButtonUnselected
]

{ #category : #tests }
SpRadioButtonPresenterTests >> testRepresentsTrueWithRadioButtonSelectedIcon [

	| icon |
	model value: true.
	
	icon := presenter children anyOne.
	self assert: icon model equals: #radioButtonSelected
]
