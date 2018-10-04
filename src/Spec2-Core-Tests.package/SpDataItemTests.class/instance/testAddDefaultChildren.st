tests
testAddDefaultChildren

	| item children |
	item := 'test item' asDataItem.
	
	children := SpSimpleChildren items: #(1 2 3).
	item defaultChildren: children.
		
	self assert: item children size equals: 1.
	self assert: item defaultChildren equals: children.
	self assert: children name equals: #default