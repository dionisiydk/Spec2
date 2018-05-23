tests
testCellModelForSingleValueModel
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