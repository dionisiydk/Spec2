testing
extendsContextOf: aDatasetItem
	"When users selects item in dataset which is part of selection 
	the selection can force context to include all selected items.
	By default selection does not affect contexts"
	^self providesItemsForContext and: [self includesItem: aDatasetItem]