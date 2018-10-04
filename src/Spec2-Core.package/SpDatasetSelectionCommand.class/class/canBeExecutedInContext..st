testing
canBeExecutedInContext: aDatasetContext
	^aDatasetContext hasManualSelection and: [aDatasetContext hasSelectedItems]