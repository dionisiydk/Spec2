tests
testCreationFromOrderedCollection

	| array |
	array := #(1 2 3) asOrderedCollection.
	
	dataset := array asSpecDataset.
	
	self assert: dataset class equals: SpDataset.
	self assert: dataset dataSource class equals: SpSimpleDataSource.
	self assert: dataset dataSource actualItems equals: array.