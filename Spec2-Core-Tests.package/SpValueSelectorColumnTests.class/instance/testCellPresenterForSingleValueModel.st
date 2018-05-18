tests
testCellPresenterForSingleValueModel
	
	| dataItem model column cell |
	dataItem := SpDataItem of: 100 named: 'test item'.	
	model := 10 aspect itself asValueHolder.	
	column := SpValueSelectorColumn for: model strategy: SpSingleSelectionStrategy new.
		
	cell := column createCellPresenterFor: dataItem.
	
	self assert: cell class equals: SpBooleanPresenter.
	self assert: cell currentStyle equals: #radioButton