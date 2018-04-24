tests
testRemovesSubmitButtonWhenModelBecomeInvalid
	| invalidValue field |
	invalidValue := 10 aspect itself restriction: (SpNumberRestriction minValue: 9); asValueHolder.
	field := SpValuePresenter on: invalidValue.
	presenter := SpDialogPresenter on: field.
	presenter useResult: SpOkDialogResult for: SpSubmitDialogCommand.
	presenter buildIn: ui.
	self assert: presenter showsValidData.
	self assert: presenter toolbar children size equals: 1.
	
	invalidValue value: 0.
	self deny: invalidValue isValid.
	self deny: presenter showsValidData.	
	self assert: presenter toolbar children isEmpty