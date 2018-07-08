tests
testToggleSelectedItemWhenItIsAlreadyValueOfModel
	
	model value: optionDataset actualItems second.
	presenter optionSelection selectItemsAt: #(2).
	
	presenter toggleSelectedItems.
	
	self assert: model value isNil