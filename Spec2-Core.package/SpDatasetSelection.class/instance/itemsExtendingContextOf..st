accessing
itemsExtendingContextOf: aDatasetItem

	| existingItem reorderedItems |
	existingItem := indexCache at: aDatasetItem globalIndex.
	items last = existingItem ifTrue: [ ^items ].
	
	reorderedItems := items copy.
	reorderedItems swap: (items indexOf: existingItem) with: reorderedItems size.
	^reorderedItems