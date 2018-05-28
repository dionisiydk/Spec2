initialization
setNewItems: datasetItems

	| oldItems |
	oldItems := items.
	items := datasetItems.

	self analyzeAndAnnounceChangesOf: oldItems