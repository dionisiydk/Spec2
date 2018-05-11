tests
testAttachesSelectionToView
	
	| selection |
	selection := SpManualSelection new.
	presenter addSelection: selection.
	presenter rebuild.

	self assert: selection presenter showsColumnHeader 