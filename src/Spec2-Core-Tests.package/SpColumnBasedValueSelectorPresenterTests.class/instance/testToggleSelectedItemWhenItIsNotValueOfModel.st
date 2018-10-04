tests
testToggleSelectedItemWhenItIsNotValueOfModel
	
	presenter optionSelection selectItemsAt: #(2).
	
	presenter toggleSelectedItems.
	
	self assert: model value equals: optionDataset actualItems second