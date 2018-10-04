Class {
	#name : #SpPresenterStyleContextTests,
	#superclass : #SpUIContextTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpPresenterStyleContextTests >> createUIContext [
	^SpPresenterStyleContext style: #someStyle 
]

{ #category : #tests }
SpPresenterStyleContextTests >> testComparisonWithContextOfDifferentStyle [

	| anotherContext |
	anotherContext := uiContext copy.
	anotherContext presenterStyle: #anotherStyle.
	
	self deny: uiContext equals: anotherContext
]

{ #category : #tests }
SpPresenterStyleContextTests >> testComparisonWithContextOfSameStyle [

	| anotherContext |
	uiContext presenterStyle: #someStyle.
	anotherContext := uiContext copy.
	
	self assert: uiContext equals: anotherContext.
	self assert: uiContext hash equals: anotherContext hash
]

{ #category : #tests }
SpPresenterStyleContextTests >> testSuitableForPresenter [

	| presenter |
	presenter := SpLabelPresenter forTest.
	self assert: presenter currentStyle isNil.
	self deny: (uiContext isSuitableFor: presenter).
	
	presenter currentStyle: #someAnotherStyle.
	self deny: (uiContext isSuitableFor: presenter).
	
	presenter currentStyle: uiContext presenterStyle.
	self assert: (uiContext isSuitableFor: presenter)
]
