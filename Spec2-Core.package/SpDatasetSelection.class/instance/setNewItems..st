controlling
setNewItems: datasetItems

	| oldIndex oldItems |
	oldIndex := indexCache.
	oldItems := items.
	items := datasetItems asArray.
	indexCache := Dictionary new: items size.
	items do: [ :each | indexCache at: each globalIndex put: each ].
	
	self analyzeAndAnnounceChangesOf: oldItems indexedWith: oldIndex