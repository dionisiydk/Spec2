tests
testCellPresenterForSingleValueModel
	
	| datasetItem model column cell |
	datasetItem := SpDatasetItem of: #dataset item: (SpDataItem of: 10 named: 'test item').
	model := 10 aspect itself asValueHolder.	
	column := SpValueSelectorColumn for: model strategy: SpSingleSelectionStrategy new.
		
	cell := column createCellPresenterFor: datasetItem.
	
	self assert: cell class equals: SpBooleanPresenter.
	self assert: cell currentStyle equals: #radioButton