accessing
itemsExtendingContextOf: aDatasetItem

	| existingItem reorderedItems |
	existingItem := indexCache at: aDatasetItem globalIndex.
	items last = existingItem ifTrue: [ ^items ].
	
	reorderedItems := items copy.
	reorderedItems at: (items indexOf: existingItem) put: items last.
	reorderedItems atLast: 1 put: existingItem.
	^reorderedItems