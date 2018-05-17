running
createPresenter
	^SpSelectionBasedValueSelectorPresenter 
		on: model 
		options: (SpSimpleDataSource on: #(#value1 #value2 #value3))