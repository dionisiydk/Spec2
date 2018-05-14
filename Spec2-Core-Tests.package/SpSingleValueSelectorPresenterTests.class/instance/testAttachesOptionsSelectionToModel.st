tests
testAttachesOptionsSelectionToModel

	model value: presenter optionsDataset actualItems second.
	
	self assert: presenter optionSelection actualItems equals: {model value}