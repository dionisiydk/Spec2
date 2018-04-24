tests
testModalConfirmationWhenDialogWasClosedWithoutResultButThereAreResultForCancelCommand
	| started result modalProcess |
	presenter useResult: SpCancelDialogResult new for: SpCancelDialogCommand.
	presenter updateToolbar.
	started := false.
	modalProcess := [started := true. result := presenter confirmModal] fork.
	[ started ] whileFalse: [ Processor yield ].
	self assert: result isNil.
	
	ui simulateModalClose.
	[ modalProcess isTerminated ] whileFalse: [ Processor yield ].	
	self assert: result class equals: SpCancelDialogResult