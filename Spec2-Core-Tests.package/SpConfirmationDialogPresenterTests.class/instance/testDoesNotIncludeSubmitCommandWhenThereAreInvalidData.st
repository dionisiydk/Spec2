tests
testDoesNotIncludeSubmitCommandWhenThereAreInvalidData
	| invalidValue field |
	invalidValue := 10 aspect itself restriction: (SpNumberRestriction minValue: 1000); asValueHolder.
	self deny: invalidValue isValid.
	field := SpValuePresenter on: invalidValue.
	
	presenter := SpConfirmationDialogPresenter on: field.
	presenter buildIn: ui.
	
	self deny: presenter showsValidData.
	self assert: presenter toolbar children size equals: 1.
	self assert: presenter toolbar children anyOne model name equals: 'Cancel'