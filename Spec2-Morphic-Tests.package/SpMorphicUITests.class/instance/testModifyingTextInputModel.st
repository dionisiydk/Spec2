tests
testModifyingTextInputModel

	| presenter model |
	model := ('key' -> 'value') aspect key asValueHolder.
	presenter := SpTextInputPresenter on: model.
	presenter buildIn: ui.
	
	presenter view showNewText: 'newKey'.
		
	self assert: model value equals: 'newKey'