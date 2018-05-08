initialization
attachToView
	
	view dataset: model.
	selections do: [ :each | each attachToView: view ]