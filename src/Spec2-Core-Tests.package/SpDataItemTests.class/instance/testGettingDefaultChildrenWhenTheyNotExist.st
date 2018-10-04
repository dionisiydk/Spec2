tests
testGettingDefaultChildrenWhenTheyNotExist

	| item children |
	item := 'test item' asDataItem.
	
	children := item defaultChildren.
	
	self assert: children equals: SpAbsentChildren instance