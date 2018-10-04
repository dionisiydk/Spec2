tests
testCreationCommandContext

	| context |
	context := presenter createCommandContext.
	
	self assert: context class equals: SpSimplePresenterContext.
	self assert: context tool equals: presenter