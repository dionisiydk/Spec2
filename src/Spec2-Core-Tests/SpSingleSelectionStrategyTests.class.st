Class {
	#name : #SpSingleSelectionStrategyTests,
	#superclass : #SpSelectionStrategyTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpSingleSelectionStrategyTests >> createStrategy [
	^SpSingleSelectionStrategy new
]

{ #category : #tests }
SpSingleSelectionStrategyTests >> testConvertingEmptyItemsToSelectionModel [
	
	| actualValue |
	
	actualValue := selectionStrategy convertItemsToSelectionModel: #().
	
	self assert: actualValue equals: nil
]

{ #category : #tests }
SpSingleSelectionStrategyTests >> testConvertingItemsToSelectionModel [
	
	| actualValue |
	
	actualValue := selectionStrategy convertItemsToSelectionModel: #(10).
	
	self assert: actualValue equals: 10
]

{ #category : #tests }
SpSingleSelectionStrategyTests >> testConvertingSelectionModelToItems [

	| items |
	
	items := selectionStrategy convertSelectionModelToItems: 10.
	
	self assert: items equals: #(10)
]
