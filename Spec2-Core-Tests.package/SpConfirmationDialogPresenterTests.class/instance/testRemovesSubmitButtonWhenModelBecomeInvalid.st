tests
testRemovesSubmitButtonWhenModelBecomeInvalid
	| invalidValue field |
	invalidValue := 10 aspect itself restriction: (SpNumberRestriction minValue: 9); asValueHolder.
	field := SpValuePresenter on: invalidValue.
	presenter := SpConfirmationDialogPresenter on: field.
	presenter buildIn: ui.
	self assert: presenter showsValidData.
	self assert: presenter toolbar children size equals: 2.
	
	invalidValue value: 0.
	self deny: invalidValue isValid.
	self deny: presenter showsValidData.	
	self assert: presenter toolbar children size equals: 1.