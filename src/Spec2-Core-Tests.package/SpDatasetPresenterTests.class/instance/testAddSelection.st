tests
testAddSelection
	
	| selection actual |
	selection := SpManualSelection new.
	actual := presenter addSelection: selection.

	self assert: actual == selection.
	self assert: selection rootDataset equals: model