tests
testCreatesOnlyButtonsForExistingResultOptions

	presenter useResultOf: [ #result ] for: SpCancelDialogCommand.
	presenter updateToolbar.

	self assert: presenter toolbar children size equals: 1