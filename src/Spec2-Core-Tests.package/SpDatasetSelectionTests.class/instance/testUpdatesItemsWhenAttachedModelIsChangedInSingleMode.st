tests
testUpdatesItemsWhenAttachedModelIsChangedInSingleMode
	
	| actualModel newSelectedItem |
	selection beSingle.
	
	actualModel := #test aspect itself asValueHolder.
	selection attachToActualModel: actualModel.
	newSelectedItem := dataset actualItems first.
	actualModel value: newSelectedItem.
	
	self assert: selection actualItems equals: {newSelectedItem}