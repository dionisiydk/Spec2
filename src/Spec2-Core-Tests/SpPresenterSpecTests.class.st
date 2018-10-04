Class {
	#name : #SpPresenterSpecTests,
	#superclass : #TestCase,
	#instVars : [
		'spec'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpPresenterSpecTests >> setUp [
	super setUp.
	
	spec := SpPresenterSpec createFromMethod: self class >> #specMethodExample
]

{ #category : #running }
SpPresenterSpecTests >> specMethodExample [
	<viewSpec>
	
	^#exampleSpecApplied
]

{ #category : #tests }
SpPresenterSpecTests >> testApplying [

	| label |
	label := SpLabelPresenter forTest.
	spec := SpPresenterSpec createFromMethod: label class >> #setUpDefaultStubView.
	
	spec applyTo: label.
	
	self assert: label view class equals: SpLabelViewStub.
	self assert: label view name equals: #defaultLabel.
]

{ #category : #tests }
SpPresenterSpecTests >> testComparisonWithAnotherSpecWithDifferentMethod [
	
	| copy |
	copy := spec copy.
	spec definingMethod: self class >> testSelector.
	
	self deny: spec equals: copy
]

{ #category : #tests }
SpPresenterSpecTests >> testComparisonWithCopy [
	
	| copy |
	copy := spec copy.
	
	self assert: spec equals: copy.
	self assert: spec hash equals: copy hash
]

{ #category : #tests }
SpPresenterSpecTests >> testComparisonWithItself [

	self assert: spec equals: spec
]

{ #category : #tests }
SpPresenterSpecTests >> testCreationConcreteStyleSpecFromMethod [
	<forStyle: #specialStyle>
	
	spec := SpStyleSpec createFromMethod: self class >> testSelector.
	
	self assert: spec class equals: SpStyleSpec.
	self assert: spec definingMethod == (self class >> testSelector).
	self assert: spec contexts size equals: 1.
	self assert: spec contexts anyOne equals: (SpPresenterStyleContext style: #specialStyle)
]

{ #category : #tests }
SpPresenterSpecTests >> testCreationDefaultStyleSpecFromMethod [
	
	spec := SpStyleSpec createFromMethod: self class >> testSelector.
	
	self assert: spec class equals: SpStyleSpec.
	self assert: spec definingMethod == (self class >> testSelector).
	self assert: spec contexts isEmpty
]

{ #category : #tests }
SpPresenterSpecTests >> testCreationDefaultViewSpecFromMethod [
	
	spec := SpViewSpec createFromMethod: self class >> testSelector.
	
	self assert: spec class equals: SpViewSpec.
	self assert: spec definingMethod == (self class >> testSelector).
	self assert: spec contexts isEmpty
	
]

{ #category : #tests }
SpPresenterSpecTests >> testCreationSpecForStubUIFromMethod [
	<forStubUI>
	
	spec := SpPresenterSpec createFromMethod: self class >> testSelector.
	
	self assert: spec contexts size equals: 1.
	self assert: spec contexts anyOne equals: (SpBackendContext fromClass: SpStubUI)
]

{ #category : #tests }
SpPresenterSpecTests >> testCreationViewSpecForStyleFromMethod [
	<forStyle: #specialStyle>
	
	spec := SpViewSpec createFromMethod: self class >> testSelector.
	
	self assert: spec class equals: SpViewSpec.
	self assert: spec definingMethod == (self class >> testSelector).
	self assert: spec contexts size equals: 1.
	self assert: spec contexts anyOne equals: (SpPresenterStyleContext style: #specialStyle)
]

{ #category : #tests }
SpPresenterSpecTests >> testHasEmptyContextsByDefault [

	self assert: spec contexts isEmpty
]

{ #category : #tests }
SpPresenterSpecTests >> testHasPriorityByDefault [

	self assert: spec priority notNil
]

{ #category : #tests }
SpPresenterSpecTests >> testLocalizationLevel [
	
	self assert: spec localizationLevel equals: 0.
	
	spec backendUI: SpStubUI.
	
	self assert: spec localizationLevel equals: 1.
]

{ #category : #tests }
SpPresenterSpecTests >> testNotSuitableForPresenterWhichNotSatisfiesAllContexts [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #someStyle.
	
	spec addContext: (SpPresenterStyleContext style: #someStyle).
	spec backendUI: #someUIClass.
	
	self deny: (spec isSuitableFor: presenter)
]

{ #category : #tests }
SpPresenterSpecTests >> testSuitableForAnyPresenterWhenContextsAreNotSpecified [

	self assert: spec contexts isEmpty.
	
	self assert: (spec isSuitableFor: #anyPresenter)
]

{ #category : #tests }
SpPresenterSpecTests >> testSuitableForPresenterWhichSatisfiesAllContexts [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #someStyle.
	
	spec addContext: (SpPresenterStyleContext style: #someStyle).
	
	self assert: (spec isSuitableFor: presenter)
]
