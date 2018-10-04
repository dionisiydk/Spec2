tests
testCreatesOnlyButtonsForExistingResultOptions

	presenter useResult: SpOkDialogResult new for: SpCancelDialogCommand.
	presenter updateToolbar.

	self assert: presenter toolbar commands size equals: 1.
	self assert: presenter toolbar commands anyOne class equals: SpCancelDialogCommand.