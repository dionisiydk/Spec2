tests
testAddItemsForAllDefinedCommands

	| expected |
	expected := SpToolbarActivation activeInstancesInContext: presenter parent createCommandContext.
	self assert: expected notEmpty. "There are command examples"
	
	self assert: presenter children size equals: expected size.
	self assert: (presenter children allSatisfy: [:each | each class = SpCommandPresenter]).
	self 
		assert: (presenter children collect: [:each | each command class] as: Set) 
		equals: (expected collect: [:each | each commandClass] as: Set).