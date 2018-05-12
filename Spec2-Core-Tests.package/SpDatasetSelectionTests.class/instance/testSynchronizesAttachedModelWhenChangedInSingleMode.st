tests
testSynchronizesAttachedModelWhenChangedInSingleMode
	
	| actualModel newSelectedItem |
	selection beSingle.
	
	actualModel := #test aspect itself asValueHolder.
	selection attachToActualModel: actualModel.
	newSelectedItem := dataset actualItems first.
	selection selectItemsWith: {newSelectedItem}.
	
	self assert: actualModel value equals: newSelectedItem