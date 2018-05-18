tests
testAttachesOptionsSelectionToModel

	model value: presenter optionDataset actualItems second.
	
	self assert: presenter optionSelection actualItems equals: {model value}