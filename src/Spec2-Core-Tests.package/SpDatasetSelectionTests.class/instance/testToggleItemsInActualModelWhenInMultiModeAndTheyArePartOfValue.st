tests
testToggleItemsInActualModelWhenInMultiModeAndTheyArePartOfValue
	
	| actualModel |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	actualModel value: (dataset actualItems first: 3).

	selection selectItemsAt: #(1 3).
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: {dataset actualItems second}