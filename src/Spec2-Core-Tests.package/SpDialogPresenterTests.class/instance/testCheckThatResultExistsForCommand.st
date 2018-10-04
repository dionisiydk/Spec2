tests
testCheckThatResultExistsForCommand

	presenter useResult: SpOkDialogResult new for: SpSubmitDialogCommand.
	
	self assert: (presenter hasResultFor: SpSubmitDialogCommand).
	self deny: (presenter hasResultFor: SpCancelDialogCommand)