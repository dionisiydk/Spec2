initialization
attachToModel
	model open.
	model whenChangedSend: #datasetWasChanged to: self.
	selections do: [ :each | each attachToDataset: model ]