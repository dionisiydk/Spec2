tests
testCreatesSubmitButtonForValidModel

	self assert: presenter toolbar children size equals: 0.
	self assert: presenter model showsValidData.
	
	presenter useResult: SpOkDialogResult new for: SpSubmitDialogCommand.
	presenter updateToolbar.
	
	self assert: presenter toolbar children size equals: 1