initialization
attachToView
	
	view inputRestriction: inputRestriction.
	view textDecoration: textDecoration.
	self updateView.
	
	view whenTextChangedSend: #updateModel to: self