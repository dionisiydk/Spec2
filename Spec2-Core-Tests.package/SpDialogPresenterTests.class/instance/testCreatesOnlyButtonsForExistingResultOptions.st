tests
testCreatesOnlyButtonsForExistingResultOptions

	presenter useResult: SpOkDialogResult new for: SpCancelDialogCommand.
	presenter updateToolbar.

	self assert: presenter toolbar children size equals: 1