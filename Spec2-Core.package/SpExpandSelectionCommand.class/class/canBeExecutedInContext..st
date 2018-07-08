testing
canBeExecutedInContext: aDatasetContext
	(super canBeExecutedInContext: aDatasetContext) ifFalse: [ ^false ].
	
	^aDatasetContext manualSelection isMultiple