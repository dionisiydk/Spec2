tests
testAddItemsForAllDefinedCommands

	| commands |
	commands := SpToolbarActivation activeInstancesInContext: presenter parent createCommandContext.
	self assert: commands notEmpty. "There are command examples"
	
	self assert: presenter children size equals: commands size