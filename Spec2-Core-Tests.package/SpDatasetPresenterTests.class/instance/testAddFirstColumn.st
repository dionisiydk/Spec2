tests
testAddFirstColumn
	
	| newColumn |
	newColumn := SpItemNameColumn new.
	presenter addFirstColumn: newColumn.

	self assert: presenter columns size equals: 2.
	self assert: presenter columns first equals: newColumn.