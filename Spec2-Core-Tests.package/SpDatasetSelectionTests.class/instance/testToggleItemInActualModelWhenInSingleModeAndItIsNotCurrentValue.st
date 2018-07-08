tests
testToggleItemInActualModelWhenInSingleModeAndItIsNotCurrentValue
	
	| actualModel |
	selection beSingle.
	
	actualModel := #test aspect itself asValueHolder.

	selection selectItemsWith: {dataset actualItems second}.

	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: dataset actualItems second