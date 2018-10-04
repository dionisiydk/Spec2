controlling
datasetWasChanged

	selections do: [ :each | each refreshItems ].
	self refresh