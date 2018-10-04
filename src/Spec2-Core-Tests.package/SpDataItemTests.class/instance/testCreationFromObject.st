tests
testCreationFromObject

	| item |
	item := 10 asDataItem.
	
	self assert: item class equals: SpDataItem.
	self assert: item actualItem equals: 10.
	self assert: item name equals: '10'.