tests
testToggleItemsInActualModelWhenInMultiModeAndSomeOfThemArePartOfValue
	
	| actualModel |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	actualModel value: (dataset actualItems first: 2).

	selection selectItemsAt: #(1 3).
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: (#(2 1 3) collect: [:i | dataset actualItems at: i])