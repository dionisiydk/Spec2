private
setNewItems: datasetItems

	| oldItems |
	oldItems := indexCache.
	items := datasetItems.
	indexCache := Dictionary new: items size.
	items do: [ :each | indexCache at: each globalIndex put: each ].
	
	self analyzeAndAnnounceChangesOf: oldItems