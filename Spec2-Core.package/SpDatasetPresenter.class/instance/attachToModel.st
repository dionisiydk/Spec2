initialization
attachToModel
	
	model whenChangedSend: #listChanged: to: self.
	selections do: [ :each | each attachToDataSource: model ]