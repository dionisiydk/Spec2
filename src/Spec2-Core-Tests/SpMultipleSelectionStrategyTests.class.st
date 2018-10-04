Class {
	#name : #SpMultipleSelectionStrategyTests,
	#superclass : #SpSelectionStrategyTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpMultipleSelectionStrategyTests >> createStrategy [
	^SpMultipleSelectionStrategy new
]

{ #category : #tests }
SpMultipleSelectionStrategyTests >> testConvertingItemsToSelectionModel [
	
	| actualValue |
	
	actualValue := selectionStrategy convertItemsToSelectionModel: #(10).
	
	self assert: actualValue equals: #(10)
]

{ #category : #tests }
SpMultipleSelectionStrategyTests >> testConvertingSelectionModelToItems [
	
	| items |
	
	items := selectionStrategy convertSelectionModelToItems: #(10).
	
	self assert: items equals: #(10)
]
