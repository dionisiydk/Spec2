running
createPresenter
	^SpComboBoxPresenter 
		on: model 
		options: (SpSimpleDataSource on: #(#value1 #value2 #value3))