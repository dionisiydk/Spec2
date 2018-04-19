tests
testCreationCommandContext

	| context |
	context := presenter createCommandContext.
	
	self assert: context class equals: CmdSimpleToolContext.
	self assert: context tool equals: presenter