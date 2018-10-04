tests
testAttachesOptionsSelectionToModel

	model value: optionDataset actualItems second.
	
	self assert: presenter optionSelection actualItems equals: {model value}