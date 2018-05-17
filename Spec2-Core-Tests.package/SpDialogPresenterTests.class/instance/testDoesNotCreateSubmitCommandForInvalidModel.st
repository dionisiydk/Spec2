tests
testDoesNotCreateSubmitCommandForInvalidModel
	| invalidValue field |
	invalidValue := 10 aspect itself restriction: (SpNumberRestriction minValue: 1000); asValueHolder.
	self deny: invalidValue isValid.
	field := SpFormFieldPresenter on: invalidValue.
	
	presenter := SpDialogPresenter on: field.
	presenter useResult: SpOkDialogResult for: SpSubmitDialogCommand.
	presenter buildIn: ui.
	
	self deny: presenter showsValidData.
	self assert: presenter toolbar children isEmpty