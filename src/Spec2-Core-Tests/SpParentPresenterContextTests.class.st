Class {
	#name : #SpParentPresenterContextTests,
	#superclass : #SpUIContextTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpParentPresenterContextTests >> createUIContext [
	^SpParentPresenterContext fromClass: SpMultiLabelPresenterExample 
]

{ #category : #tests }
SpParentPresenterContextTests >> testNotSuitableForPresenterWithoutParent [

	| presenter |
	presenter := SpLabelPresenter forTest.
	self assert: presenter parent isNil.
	
	self deny: (uiContext isSuitableFor: presenter)
]

{ #category : #tests }
SpParentPresenterContextTests >> testSuitableForPresenterWhichGrandParentIsKindOfSpecifiedClass [

	| presenter parent grandParent |
	grandParent := SpMultiLabelPresenterExample new.
	parent := SpLabelPresenter textual: 'another parent'.
	parent parent: grandParent.
	presenter := SpLabelPresenter forTest.
	presenter parent: parent.
	
	self assert: (uiContext isSuitableFor: presenter)
]

{ #category : #tests }
SpParentPresenterContextTests >> testSuitableForPresenterWhichParentIsKindOfSpecifiedClass [

	| presenter parent |
	parent := SpMultiLabelPresenterExample new.
	presenter := SpLabelPresenter forTest.
	presenter parent: parent.
	
	self assert: (uiContext isSuitableFor: presenter)
]
