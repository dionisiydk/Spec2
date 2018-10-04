tests
testGettingShownCommands

	self assert: presenter commands equals: (presenter children collect: #command)