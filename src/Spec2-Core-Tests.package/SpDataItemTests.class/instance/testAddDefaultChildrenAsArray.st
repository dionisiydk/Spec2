tests
testAddDefaultChildrenAsArray

	| item children |
	item := 'test item' asDataItem.
	
	children := #(1 2 3).
	item defaultChildren: children.
		
	self assert: item defaultChildren class equals: SpSimpleChildren.
	self assert: item defaultChildren items equals: children