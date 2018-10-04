Class {
	#name : #SpCheckboxPresenterTests,
	#superclass : #SpBooleanPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpCheckboxPresenterTests >> createPresenter [
	^SpBooleanPresenter checkboxOn: model
]

{ #category : #tests }
SpCheckboxPresenterTests >> testHasCheckboxStyle [

	self assert: presenter currentStyle equals: #checkbox
]

{ #category : #tests }
SpCheckboxPresenterTests >> testRepresentsFalseWithCheckboxUnselectedIcon [

	| icon |
	model value: false.
	
	icon := presenter children anyOne.
	self assert: icon model equals: #checkboxUnselected
]

{ #category : #tests }
SpCheckboxPresenterTests >> testRepresentsTrueWithCheckboxSelectedIcon [

	| icon |
	model value: true.
	
	icon := presenter children anyOne.
	self assert: icon model equals: #checkboxSelected
]
