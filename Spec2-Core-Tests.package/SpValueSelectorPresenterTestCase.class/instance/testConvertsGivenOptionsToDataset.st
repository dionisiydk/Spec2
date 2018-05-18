tests
testConvertsGivenOptionsToDataset

	| compatibleObject |
	compatibleObject := SpSimpleDataSource on: #(1 2 3).
	presenter optionDataset: compatibleObject.
	
	self assert: presenter optionDataset class equals: SpDataset.
	self assert: presenter optionDataset dataSource equals: compatibleObject.