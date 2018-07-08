tests
testToggleSelectedItemWhenNothingIsSelected
	
	model value: #testValue.
	presenter optionSelection reset.
	
	presenter toggleSelectedItems.
	
	self assert: model value equals: #testValue