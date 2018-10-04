tests
testCreationByBuilderWithDirectSlotGetter
	
	aspect := (2@3) aspect x useSlot build.
	
	self assert: aspect class equals: SpObjectPropertyAspect.
	self assert: aspect valueGetter equals: (Point slotNamed: #x).
	self assert: aspect valueSetter == aspect valueSetter.
	self assert: aspect name equals: #x