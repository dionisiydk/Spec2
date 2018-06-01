controlling
refreshItems: datasetItems

	^self localItemsWith: (datasetItems collect: [ :each | each actualItem ])