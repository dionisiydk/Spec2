tests
testCreationFromBlockWithNameAndIcon

	presenter := SpCommandPresenter 
		buttonOn: [ commandWasExecuted := true ] named: 'test button' icon: #classIcon.
	
	self assert: presenter model class equals: SpPluggableCommand.
	self assert: presenter model name equals: 'test button'.
	self assert: presenter model iconName equals: #classIcon