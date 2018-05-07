initialization
attachToView
	
	view dataSource: model.
	selections do: [ :each | each attachToView: view ]