initialization
attachToModel
	model open.
	model whenChangedSend: #datasetChanged: to: self.
	selections do: [ :each | each attachToDataset: model ]