tests
testAddDefaultChildrenTwice

	| item children children2 |
	item := 'test item' asDataItem.
	
	children := SpSimpleChildren items: #(1 2 3).
	item defaultChildren: children.
	
	children2 := SpSimpleChildren items: #(5 6 7).
	item defaultChildren: children2.	
		
	self assert: item children size equals: 1.
	self assert: item defaultChildren equals: children2