tests
testToggleItemsInActualModelWhenInMultiModeAndTheyAreNotPartOfValue
	
	| actualModel |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	actualModel value: { dataset actualItems second }.

	selection selectItemsAt: #(1 3).
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: {dataset actualItems second}, selection actualItems