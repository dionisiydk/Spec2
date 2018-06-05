controlling
refreshItems
	"It reloads actual items from their data sources.
	And it keeps current order of items (therefore dictionary logic for updatedItems)"
	| updatedItems groups liveItems newItems |
	updatedItems := Dictionary new.
	liveItems := items reject: [:each | each isRemoved ].
	groups := liveItems groupedBy: [ :each | each ownerDataset ].
	groups keysAndValuesDo: [ :dataset :localItems | 
		updatedItems addAll: (dataset refreshItems: localItems)].

	newItems := OrderedCollection new: items size.
	items do: [ :oldItem | updatedItems at: oldItem ifPresent: [ :new | newItems add: new] ].
	self setNewItems: newItems