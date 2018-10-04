tests
testModalConfirmation
	| started result modalProcess expectedResult |
	started := false.
	modalProcess := [started := true. result := presenter confirmModalFrom: #view] fork.
	[ started ] whileFalse: [ Processor yield ].
	self assert: result isNil.
	
	expectedResult := SpOkDialogResult new.
	presenter applyResult: expectedResult.
	[ modalProcess isTerminated ] whileFalse: [ Processor yield ].	
	self assert: result equals: expectedResult