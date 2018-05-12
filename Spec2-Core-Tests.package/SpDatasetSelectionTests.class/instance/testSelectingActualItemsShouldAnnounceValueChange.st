tests
testSelectingActualItemsShouldAnnounceValueChange
	
	| change newItems |
	selection whenChangedDo: [ :ann | change := ann ].
	
	newItems := { dataset actualItems first }.
	selection selectItemsWith: newItems.
	
	self assert: change class equals: ValueChanged.
	self assert: change oldValue equals: #().
	self assert: (change newValue collect: #actualItem) equals: newItems.