initialization
attachToModel
	model open.
	model whenChangedSend: #refresh to: self.
	selections do: [ :each | each attachToDataset: model ]