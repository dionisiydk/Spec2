tests
testSynchronizesAttachedModelWhenChangedInMultipleMode
	
	| actualModel newSelectedItem |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	selection attachToActualModel: actualModel.
	newSelectedItem := dataset actualItems first.
	selection selectItemsWith: {newSelectedItem}.
	
	self assert: actualModel value equals: {newSelectedItem}