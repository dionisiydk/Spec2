private
setNewItems: datasetItems

	| oldItems |
	oldItems := indexCache.
	items := datasetItems asArray.
	indexCache := Dictionary new: items size.
	items do: [ :each | indexCache at: each globalIndex put: each ].
	
	self analyzeAndAnnounceChangesOf: oldItems