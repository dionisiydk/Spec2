Class {
	#name : #SpColumnBasedValueSelectorPresenterTests,
	#superclass : #SpFullListValueSelectorPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpColumnBasedValueSelectorPresenterTests >> createPresenter [
	^SpColumnBasedValueSelectorPresenter on: model options: optionDataset 
]

{ #category : #tests }
SpColumnBasedValueSelectorPresenterTests >> testAddsValueSelectorColumn [

	| firstColumn |
	firstColumn := presenter optionPresenter columns first.
	
	self assert: firstColumn class equals: SpValueSelectorColumn.
	self assert: firstColumn affectedModel equals: model.
	self assert: firstColumn selectionStrategy == presenter selectionStrategy
]

{ #category : #tests }
SpColumnBasedValueSelectorPresenterTests >> testToggleSelectedItemWhenItIsAlreadyValueOfModel [
	
	model value: optionDataset actualItems second.
	presenter optionSelection selectItemsAt: #(2).
	
	presenter toggleSelectedItems.
	
	self assert: model value isNil
]

{ #category : #tests }
SpColumnBasedValueSelectorPresenterTests >> testToggleSelectedItemWhenItIsNotValueOfModel [
	
	presenter optionSelection selectItemsAt: #(2).
	
	presenter toggleSelectedItems.
	
	self assert: model value equals: optionDataset actualItems second
]

{ #category : #tests }
SpColumnBasedValueSelectorPresenterTests >> testToggleSelectedItemWhenNothingIsSelected [
	
	model value: #testValue.
	presenter optionSelection reset.
	
	presenter toggleSelectedItems.
	
	self assert: model value equals: #testValue
]

{ #category : #tests }
SpColumnBasedValueSelectorPresenterTests >> testUpdatesSelectorColumnWhenModelChanged [
	| datasetView row |
	datasetView := presenter optionPresenter view.
	row := datasetView builtRowViews at: 1.
	self assert: (row cellViewAt: 1) specPresenter contentPresenter model value.
		
	model value: optionDataset actualItems second.
			
	row := datasetView builtRowViews at: 1.
	self deny: (row cellViewAt: 1) specPresenter contentPresenter model value.
	row := datasetView builtRowViews at: 2.
	self assert: (row cellViewAt: 1) specPresenter contentPresenter model value.

]
