tests
testCreationFromBlockWithNameAndIcon

	presenter := SpCommandPresenter 
		buttonOn: [ commandWasExecuted := true ] named: 'test button' iconName: #classIcon.
	
	self assert: presenter model class equals: CmdCommandActivator.
	self assert: presenter model command class equals: SpPluggableCommand.
	self assert: presenter model menuItemName equals: 'test button'.
	self assert: presenter model menuItemIcon equals: (Smalltalk ui iconNamed: #classIcon)