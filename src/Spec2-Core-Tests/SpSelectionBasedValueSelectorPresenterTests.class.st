Class {
	#name : #SpSelectionBasedValueSelectorPresenterTests,
	#superclass : #SpFullListValueSelectorPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpSelectionBasedValueSelectorPresenterTests >> createPresenter [
	^SpSelectionBasedValueSelectorPresenter on: model options: optionDataset
]

{ #category : #tests }
SpSelectionBasedValueSelectorPresenterTests >> testAttachesOptionsSelectionToModel [

	model value: optionDataset actualItems second.
	
	self assert: presenter optionSelection actualItems equals: {model value}
]

{ #category : #tests }
SpSelectionBasedValueSelectorPresenterTests >> testCreatesOptionSelection [

	self assert: presenter optionSelection class equals: SpManualSelection.
	self assert: presenter optionSelection rootDataset equals: optionDataset.
	self assert: presenter optionSelection strategy notNil.
	self assert: presenter optionSelection strategy == presenter selectionStrategy
]

{ #category : #tests }
SpSelectionBasedValueSelectorPresenterTests >> testDetachFromModelShouldDetachSelections [

	presenter detachFromModel.
	
	model value: 10. "it will not update selection"
	
	self deny: presenter optionSelection actualItems = #(10)
]
