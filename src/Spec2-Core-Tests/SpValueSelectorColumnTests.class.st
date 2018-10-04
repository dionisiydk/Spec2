Class {
	#name : #SpValueSelectorColumnTests,
	#superclass : #SpDatasetColumnTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpValueSelectorColumnTests >> testCellModelForListValueModel [
	| datasetItem model column cell |
	datasetItem := SpDatasetItem of: #dataset item: (SpDataItem of: 100 named: 'test item').
	model := #(10) aspect itself asValueHolder.
	column := SpValueSelectorColumn for: model strategy: SpMultipleSelectionStrategy new.
	cell := column createCellPresenterFor: datasetItem.
	self deny: cell model value.
	
	cell model value: true.	
	self assert: model value equals: { 10. datasetItem actualItem}.
	
	cell model value: false.	
	self assert: model value equals: { 10 }
]

{ #category : #tests }
SpValueSelectorColumnTests >> testCellModelForSingleValueModel [
	| datasetItem model column cell |
	datasetItem := SpDatasetItem of: #dataset item: (SpDataItem of: 100 named: 'test item').
	model := 10 aspect itself asValueHolder.
	column := SpValueSelectorColumn for: model strategy: SpSingleSelectionStrategy new.
	cell := column createCellPresenterFor: datasetItem.
	self deny: cell model value.
	
	cell model value: true.	
	self assert: model value equals: datasetItem actualItem.
	
	cell model value: false.	
	self assert: model value equals: nil
]

{ #category : #tests }
SpValueSelectorColumnTests >> testCellPresenterForListValueModel [
	
	| datasetItem model column cell |
	datasetItem := SpDatasetItem of: #dataset item: (SpDataItem of: 100 named: 'test item').
	model := #(10) aspect itself asValueHolder.	
	column := SpValueSelectorColumn for: model strategy: SpMultipleSelectionStrategy new.
		
	cell := column createCellPresenterFor: datasetItem.
	
	self assert: cell class equals: SpBooleanPresenter.
	self assert: cell currentStyle equals: #checkbox
]

{ #category : #tests }
SpValueSelectorColumnTests >> testCellPresenterForSingleValueModel [
	
	| datasetItem model column cell |
	datasetItem := SpDatasetItem of: #dataset item: (SpDataItem of: 10 named: 'test item').
	model := 10 aspect itself asValueHolder.	
	column := SpValueSelectorColumn for: model strategy: SpSingleSelectionStrategy new.
		
	cell := column createCellPresenterFor: datasetItem.
	
	self assert: cell class equals: SpBooleanPresenter.
	self assert: cell currentStyle equals: #radioButton
]
