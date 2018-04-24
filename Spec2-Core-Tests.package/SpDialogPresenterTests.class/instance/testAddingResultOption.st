tests
testAddingResultOption

	| resultBlock |
	resultBlock := [ #result ].
	presenter useResultOf: resultBlock for: SpSubmitDialogCommand.
	
	self assert: presenter resultOptions size equals: 1.
	self assert: (presenter resultBlockFor: SpSubmitDialogCommand) == resultBlock