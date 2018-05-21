tests-text input
testBuildingTextInputPresenter

	| presenter model |
	model := (2@3) aspect x asValueHolder.
	presenter := SpTextInputPresenter on: model.
	
	presenter buildIn: ui.
	
	self assert: presenter view notNil.
	self assert: presenter view contents equals: '2'.