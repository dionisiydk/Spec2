tests
testDoesNotCreateSubmitCommandForInvalidModel
	| invalidValue field |
	invalidValue := 10 aspect itself restriction: (SpNumberRestriction minValue: 1000); asValueHolder.
	self deny: invalidValue isValid.
	field := SpValuePresenter on: invalidValue.
	
	presenter := SpDialogPresenter on: field.
	presenter useResultOf: [ #test ] for: SpSubmitDialogCommand.
	presenter buildIn: ui.
	
	self deny: presenter showsValidData.
	self assert: presenter toolbar children isEmpty