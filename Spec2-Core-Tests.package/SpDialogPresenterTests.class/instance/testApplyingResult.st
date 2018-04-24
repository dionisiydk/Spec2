tests
testApplyingResult

	presenter useResultOf: [#cancelResult] for: SpCancelDialogCommand.
	presenter useResultOf: [#submitResult] for: SpSubmitDialogCommand.
	
	presenter applyResultOf: SpSubmitDialogCommand.
	
	self assert: presenter result equals: #submitResult