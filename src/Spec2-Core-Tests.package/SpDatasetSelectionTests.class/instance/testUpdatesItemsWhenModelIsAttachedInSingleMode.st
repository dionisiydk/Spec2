tests
testUpdatesItemsWhenModelIsAttachedInSingleMode
	
	| actualModel selectedItem |
	selection beSingle.
	selectedItem := dataset actualItems first.
	actualModel := selectedItem aspect itself asValueHolder.
	
	selection attachToActualModel: actualModel.
	
	self assert: selection actualItems equals: {selectedItem}