tests
testCreatesSubmitButtonForValidModel

	self assert: presenter toolbar children size equals: 0.
	self assert: presenter model showsValidData.
	
	presenter useResultOf: [ #test ] for: SpSubmitDialogCommand.
	presenter updateToolbar.
	
	self assert: presenter toolbar children size equals: 1