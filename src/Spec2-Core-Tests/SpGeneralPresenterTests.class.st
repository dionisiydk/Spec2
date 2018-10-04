Class {
	#name : #SpGeneralPresenterTests,
	#superclass : #SpPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpGeneralPresenterTests >> createPresenter [
	^SpMultiLabelPresenterExample new
]

{ #category : #running }
SpGeneralPresenterTests >> defaultModel [
	^nil
]

{ #category : #tests }
SpGeneralPresenterTests >> testChangesPropogation [

	| executed |
	presenter whenModelChangedDo: [ executed := true ].
	
	presenter label1 propogateChanges.
	
	self assert: executed
]

{ #category : #tests }
SpGeneralPresenterTests >> testChangesPropogationShouldDeliverSourcePresenter [

	| changes |
	presenter whenModelChangedDo: [:ann | changes := ann ].
	
	presenter label1 propogateChanges.
	
	self assert: changes class equals: SpModelChanged.
	self assert: changes sourcePresenter equals: presenter label1.
]

{ #category : #tests }
SpGeneralPresenterTests >> testCreationCommandContext [

	| context |
	context := presenter createCommandContext.
	
	self assert: context class equals: SpSimplePresenterContext.
	self assert: context tool equals: presenter
]

{ #category : #tests }
SpGeneralPresenterTests >> testHasNoUnsubmittedDataByDefault [

	self deny: presenter hasUnsubmittedData
]

{ #category : #tests }
SpGeneralPresenterTests >> testShowValidDataByDefault [

	self assert: presenter showsValidData
]
