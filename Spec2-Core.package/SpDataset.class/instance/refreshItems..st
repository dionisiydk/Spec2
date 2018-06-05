controlling
refreshItems: datasetItems
	"It reloads actual items from data source
	and returns result as dictionary of oldItem->updatedItem (removed items are not returned)"
	| result actualItems updatedItems |
	result := Dictionary new.
	actualItems := datasetItems collect: [ :each | each actualItem ].
	updatedItems := dataSource itemsWith: actualItems.
	datasetItems with: updatedItems do: [ :oldItem :newItem | 
		newItem ifNotNil: [
			result at: oldItem put: (SpDatasetItem of: self item: newItem)]].
	^result