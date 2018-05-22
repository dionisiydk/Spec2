tests
testCreationFromString

	| item |
	item := 'test item' asDataItem.
	
	self assert: item class equals: SpDataItem.
	self assert: item actualItem equals: 'test item'.
	self assert: item name equals: 'test item'.