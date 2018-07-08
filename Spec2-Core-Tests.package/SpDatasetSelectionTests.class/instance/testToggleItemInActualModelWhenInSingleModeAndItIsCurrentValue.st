tests
testToggleItemInActualModelWhenInSingleModeAndItIsCurrentValue
	
	| actualModel |
	selection beSingle.
	
	actualModel := #test aspect itself asValueHolder.
	actualModel value: dataset actualItems second.

	selection selectItemsWith: {dataset actualItems second}.
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value isNil