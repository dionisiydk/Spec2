tests
testCellPresenterForListValueModel
	
	| datasetItem model column cell |
	datasetItem := SpDatasetItem of: #dataset item: (SpDataItem of: 100 named: 'test item').
	model := #(10) aspect itself asValueHolder.	
	column := SpValueSelectorColumn for: model strategy: SpMultipleSelectionStrategy new.
		
	cell := column createCellPresenterFor: datasetItem.
	
	self assert: cell class equals: SpBooleanPresenter.
	self assert: cell currentStyle equals: #checkbox