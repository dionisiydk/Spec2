Class {
	#name : #SpFullListValueSelectorPresenterTestCase,
	#superclass : #SpValueSelectorPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpFullListValueSelectorPresenterTestCase class >> isAbstract [
	^self = SpFullListValueSelectorPresenterTestCase 
]

{ #category : #tests }
SpFullListValueSelectorPresenterTestCase >> testCreatesOptionPresenter [

	self assert: presenter optionPresenter class equals: SpDatasetPresenter.
	self assert: presenter optionPresenter model equals: optionDataset
]
