tests
testUpdatesItemsWhenAttachedModelIsChangedInMultipleMode
	
	| actualModel newSelectedItem |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	selection attachToActualModel: actualModel.
	newSelectedItem := dataset actualItems first.
	actualModel value: { newSelectedItem }.
	
	self assert: selection actualItems equals: {newSelectedItem}