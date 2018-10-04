tests
testSelectingItemsByIndexShouldAnnounceValueChange
	
	| change |
	selection whenChangedDo: [ :ann | change := ann ].
	
	selection selectItemsAt: #(1).
	
	self assert: change class equals: ValueChanged.
	self assert: change oldValue equals: #().
	self assert: (change newValue collect: #actualItem) equals: {dataset actualItems at: 1}.