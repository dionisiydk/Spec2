initialization
attachToView
	super attachToView.
	
"	view tooltip: model description."
	ui when: SpMouseClick on: view do: [ self executeCommand ]