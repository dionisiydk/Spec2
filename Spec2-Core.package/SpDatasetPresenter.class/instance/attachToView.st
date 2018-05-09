initialization
attachToView
	
	view columns: columns.
	view dataset: model.	
	selections do: [ :each | each attachToView: view ]