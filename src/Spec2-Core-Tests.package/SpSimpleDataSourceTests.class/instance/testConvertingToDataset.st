tests
testConvertingToDataset
	
	| dataset |
	dataset := dataSource asSpecDataset.
	
	self assert: dataset class equals: SpDataset.
	self assert: dataset dataSource equals: dataSource.