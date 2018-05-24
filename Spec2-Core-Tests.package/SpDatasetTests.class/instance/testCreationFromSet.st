tests
testCreationFromSet

	| set |
	set := #(1 2 3) asSet.
	
	dataset := set asSpecDataset.
	
	self assert: dataset class equals: SpDataset.
	self assert: dataset dataSource class equals: SpSimpleDataSource.
	self assert: dataset dataSource actualItems equals: set asArray.