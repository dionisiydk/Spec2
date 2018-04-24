tests
testCheckThatResultExistsForCommand

	presenter useResultOf: [#test] for: SpSubmitDialogCommand.
	
	self assert: (presenter hasResultFor: SpSubmitDialogCommand).
	self deny: (presenter hasResultFor: SpCancelDialogCommand)