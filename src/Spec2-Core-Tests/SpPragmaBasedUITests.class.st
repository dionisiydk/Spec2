Class {
	#name : #SpPragmaBasedUITests,
	#superclass : #TestCase,
	#instVars : [
		'ui'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpPragmaBasedUITests >> setUp [
	super setUp.
	
	ui := SpStubUI new
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingChildPresenter [

	| presenter child |
	presenter := SpMultiLabelPresenterExample new.
	presenter ui: ui.
	
	child := SpLabelPresenter textual: 'test label'.
	presenter buildChild: child.
	
	self assert: child view class equals: SpLabelViewStub.
	self assert: child view name equals: #defaultLabel.
	self assert: child ui equals: ui.
	self assert: child parent equals: presenter.
	self assert: (presenter children includes: child).
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingChildPresenterTwice [

	| presenter child childView |
	presenter := SpMultiLabelPresenterExample new.
	presenter ui: ui.
	
	child := SpLabelPresenter textual: 'test label'.
	presenter buildChild: child.
	childView := child view.	
	presenter buildChild: child.
	
	self assert: child view == childView.
	self assert: (presenter children includes: child).
	self assert: presenter children size equals: 1
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingCompositePresenter [

	| presenter label1 label2 |
	presenter := SpMultiLabelPresenterExample new.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpCompositeViewStub.
	self assert: presenter view contents size equals: 2.
	
	label1 := presenter view contents first.
	self assert: label1 class equals: SpLabelViewStub.
	self assert: label1 name equals: #defaultLabel.
	
	label2 := presenter view contents last.
	self assert: label2 class equals: SpLabelViewStub.
	self assert: label2 name equals: #specialLabel.
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingCompositePresenterWithComplexLayout [

	| presenter container1 container2 |
	presenter := SpMultiLabelPresenterExample on: #testModel withStyle: #complexLayout.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpCompositeViewStub.
	self assert: presenter view contents size equals: 2.
	
	container1 := presenter view contents first.
	self assert: container1 class equals: SpCompositeViewStub.
	self assert: container1 contents first class equals: SpLabelViewStub.
	self assert: container1 contents first name equals: #defaultLabel.
	
	container2 := presenter view contents last.
	self assert: container2 class equals: SpCompositeViewStub.
	self assert: container2 contents first class equals: SpLabelViewStub.
	self assert: container2 contents first name equals: #specialLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingPresenter [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #defaultLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingPresenterShouldAnnotateViewWithIt [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.
	
	self assert: presenter view specPresenter equals: presenter
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingPresenterWhichHasNoViewDefined [

	| presenter |
	presenter := SpPresenterStub new. 
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpViewStub.
	self assert: presenter view name equals: #undefinedView
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingPresenterWithSpecialStyle [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #specialStyle.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #specialLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingPresenterWithUndefinedStyle [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #undefinedStyle.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #defaultLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testBuildingPresenterWithUndefinedStyleWhenDefaultViewExists [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #undefinedStyle.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #defaultLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testHasEmptySpecsByDefault [

	self assert: ui presenterSpecs isEmpty
]

{ #category : #tests }
SpPragmaBasedUITests >> testRebuildingCompositePresenterShouldReinitializeChildren [

	| presenter originalChildren |
	presenter := SpMultiLabelPresenterExample new.
	presenter buildIn: ui.
	originalChildren := presenter children.
	self assert: originalChildren size equals: 2.
	
	presenter currentStyle: #singleLabel. "to ensure single children after rebuild"
	presenter rebuild.
	
	self assert: presenter children size equals: 1
]

{ #category : #tests }
SpPragmaBasedUITests >> testRebuldingPresenter [

	| presenter currentView |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.
	currentView := presenter view.
	
	presenter rebuild.
	
	self deny: presenter view = currentView.
	self assert: presenter view class equals: SpLabelViewStub
]

{ #category : #tests }
SpPragmaBasedUITests >> testResetModifiedPresenterStyle [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #existingStyle.
	presenter buildIn: ui.
	presenter applyStyle: #specialStyle.
	
	presenter resetStyle.
	
	self assert: presenter currentStyle equals: #existingStyle.
	self assert: presenter mainStyle equals: #existingStyle.
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #defaultLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testResetPresenterStyleWhenItWasNotSet [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.
	presenter applyStyle: #specialStyle.
	
	presenter resetStyle.
	
	self assert: presenter currentStyle isNil.
	self assert: presenter mainStyle isNil.
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #defaultLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testStylingCompositePresenterShouldReinitializeChildren [

	| presenter originalChildren |
	presenter := SpMultiLabelPresenterExample new.
	presenter buildIn: ui.
	originalChildren := presenter children.
	self assert: originalChildren size equals: 2.
	
	presenter applyStyle: #singleLabel.
	
	self assert: presenter children size equals: 1
]

{ #category : #tests }
SpPragmaBasedUITests >> testStylingPresenter [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.

	presenter applyStyle: #specialStyle.
	
	self assert: presenter currentStyle equals: #specialStyle.
	self assert: presenter mainStyle isNil.
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #specialLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testStylingPresenterWhichWasCreatedWithSomeStyle [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #existingStyle.
	presenter buildIn: ui.

	presenter applyStyle: #specialStyle.
	
	self assert: presenter currentStyle equals: #specialStyle.
	self assert: presenter mainStyle equals: #existingStyle.
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #specialLabel
]

{ #category : #tests }
SpPragmaBasedUITests >> testSubclassSpecsShouldOverrideSuperclassSpecs [

	| presenter specs |
	presenter := SpPresenterStubSubclass new.
	specs := ui specs: SpStyleSpec of: presenter.
	
	self assert: specs size equals: 1.
	self assert: specs first definingMethod == (SpPresenterStubSubclass >> #overriddenStyle)
]
