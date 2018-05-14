queries
itemAt: globalIndex
	| dataItem |
	dataItem := dataSource itemAt: globalIndex.
	^SpDatasetItem of: self item: dataItem