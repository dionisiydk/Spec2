testing
hasChildAt: ownerDatasetIndex
	
	childrenDataset ifNil: [ ^false ].
	
	^ownerDatasetIndex > self dataSourceIndex and: [
		ownerDatasetIndex <= (self dataSourceIndex + self childrenCount)]