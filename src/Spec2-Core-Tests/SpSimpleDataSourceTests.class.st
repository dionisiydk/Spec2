Class {
	#name : #SpSimpleDataSourceTests,
	#superclass : #TestCase,
	#instVars : [
		'dataSource',
		'actualItems'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #helpers }
SpSimpleDataSourceTests >> assertItems: actualDataItems equals: expectedDataItems [

	| expectedItems actualObjects |
	actualObjects := actualDataItems collect: [ :each | each ifNotNil: [each actualItem] ] as: Array.
	expectedItems := expectedDataItems collect: [ :each | each ifNotNil: [each actualItem] ] as: Array.
	
	self assert: actualObjects equals: expectedItems
]

{ #category : #running }
SpSimpleDataSourceTests >> setUp [
	super setUp.
	
	actualItems := #(1 2 3).
	dataSource := SpSimpleDataSource on: actualItems.
]

{ #category : #tests }
SpSimpleDataSourceTests >> testConvertingToDataset [
	
	| dataset |
	dataset := dataSource asSpecDataset.
	
	self assert: dataset class equals: SpDataset.
	self assert: dataset dataSource equals: dataSource.
]

{ #category : #tests }
SpSimpleDataSourceTests >> testFindActualItems [

	| result |
	result := dataSource itemsWith: {actualItems first}.
	
	self assertItems: result equals: {dataSource itemAt: 1}
]

{ #category : #tests }
SpSimpleDataSourceTests >> testFindActualItemsShouldReturnResultInGivenOrder [

	| result |
	result := dataSource itemsWith: {actualItems last. actualItems first}.
	
	self assertItems: result equals: {dataSource itemAt: actualItems size. dataSource itemAt: 1}
]

{ #category : #tests }
SpSimpleDataSourceTests >> testFindActualItemsWhenSomeIsMissing [

	| result |
	result := dataSource itemsWith: {actualItems first. #missingItem. actualItems last}.
	
	self assertItems: result equals: {dataSource itemAt: 1. nil. dataSource itemAt: actualItems size}
]

{ #category : #tests }
SpSimpleDataSourceTests >> testGettingItemByIndex [

	| dataItem actualObject |
	dataItem := dataSource itemAt: 2.
	actualObject :=  actualItems second.
	
	self assert: dataItem class equals: SpDataItem.
	self assert: dataItem actualItem equals: actualObject.
	self assert: dataItem name equals: actualObject displayString.
	self assert: dataItem index equals: 2.
]

{ #category : #tests }
SpSimpleDataSourceTests >> testItemCount [

	self assert: dataSource itemCount equals: actualItems size
]
