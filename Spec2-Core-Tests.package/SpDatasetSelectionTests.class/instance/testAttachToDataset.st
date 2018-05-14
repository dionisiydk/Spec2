tests
testAttachToDataset
	
	| newDataset |
	newDataset := SpDataset new.
	
	selection attachToDataset: newDataset.
	
	self assert: selection rootDataset equals: newDataset