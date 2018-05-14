tests
testAttachesSelectionToView
	
	| selection |
	selection := SpManualSelection new.
	presenter addSelection: selection.
	presenter rebuild.

	self assert: presenter view manualSelection equals: selection 