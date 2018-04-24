tests
testAddingResultOption

	| result |
	result := SpOkDialogResult new.
	presenter useResult: result for: SpSubmitDialogCommand.
	
	self assert: presenter resultOptions size equals: 1.
	self assert: (presenter resultOptionFor: SpSubmitDialogCommand) == result