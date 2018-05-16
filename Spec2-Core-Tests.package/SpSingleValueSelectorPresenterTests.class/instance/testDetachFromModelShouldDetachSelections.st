tests
testDetachFromModelShouldDetachSelections

	presenter detachFromModel.
	
	model value: 10. "it will not update selection"
	
	self deny: presenter optionSelection actualItems = #(10)