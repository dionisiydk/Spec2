Class {
	#name : #SpBackendContextTests,
	#superclass : #SpUIContextTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpBackendContextTests >> createUIContext [
	^SpBackendContext fromClass: SpStubUI 
]

{ #category : #tests }
SpBackendContextTests >> testSuitableForPresenter [

	| presenter |
	presenter := SpLabelPresenter forTest.
	
	presenter ui: uiContext uiClass new.
	self assert: (uiContext isSuitableFor: presenter).
	
	presenter ui: #anotherUI.
	self deny: (uiContext isSuitableFor: presenter).
]
