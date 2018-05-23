tests
testCellModelForListValueModel
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