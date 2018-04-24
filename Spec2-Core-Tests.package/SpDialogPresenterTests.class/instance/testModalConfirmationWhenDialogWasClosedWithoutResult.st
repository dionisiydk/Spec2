tests
testModalConfirmationWhenDialogWasClosedWithoutResult
	| started result modalProcess |
	started := false.
	modalProcess := [started := true. result := presenter confirmModal] fork.
	[ started ] whileFalse: [ Processor yield ].
	self assert: result isNil.
	
	ui simulateModalClose.
	[ modalProcess isTerminated ] whileFalse: [ Processor yield ].	
	self assert: result isNil