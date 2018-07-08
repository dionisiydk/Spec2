tests
testToggleItemsInActualModelWhenInMultiModeAndOnlyLastItemIsPartOfValue
	
	| actualModel |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	actualModel value: (dataset actualItems first: 2).

	selection selectItemsAt: #(3 2).
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: {dataset actualItems first}