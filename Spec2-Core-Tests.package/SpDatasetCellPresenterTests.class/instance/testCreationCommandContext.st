tests
testCreationCommandContext

	| context |
	context := presenter createCommandContext.
	
	self assert: (context isKindOf: CmdToolContext).
	self assert: context tool equals: datasetPresenter 
	