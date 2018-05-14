tests
testGettingAllItems

	| allItems |
	allItems := dataset items.
	
	self assert: allItems size equals: dataSource itemCount.
	
	allItems withIndexDo: [ :each :i | 
		self assert: each class equals: SpDatasetItem.
		self assert: each actualItem equals: (dataSource actualItems at: i) ].