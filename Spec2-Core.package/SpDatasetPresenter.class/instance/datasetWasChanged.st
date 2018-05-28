controlling
datasetWasChanged

	selections do: [ :each | each indexWasUpdated ].
	self refresh