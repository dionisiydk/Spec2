tests
testCellModelForSingleValueModel
	| dataItem model column cell |
	dataItem := SpDataItem of: 100 named: 'test item'.
	model := 10 aspect itself asValueHolder.
	column := SpValueSelectorColumn for: model strategy: SpSingleSelectionStrategy new.
	cell := column createCellPresenterFor: dataItem.
	self deny: cell model value.
	
	cell model value: true.	
	self assert: model value equals: dataItem actualItem.
	
	cell model value: false.	
	self assert: model value equals: nil