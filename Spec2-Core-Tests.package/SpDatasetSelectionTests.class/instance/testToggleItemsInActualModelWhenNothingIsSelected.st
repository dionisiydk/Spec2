tests
testToggleItemsInActualModelWhenNothingIsSelected
	
	| actualModel |
	
	actualModel := #testValue aspect itself asValueHolder.

	selection reset.
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: #testValue