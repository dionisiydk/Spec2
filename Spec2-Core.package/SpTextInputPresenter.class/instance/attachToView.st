initialization
attachToView
	
	view inputRestriction: inputRestriction.
	view textDecoration: textDecoration.
	model isReadOnly ifTrue: [view beReadOnly].
	self updateView.
	
	view whenTextChangedSend: #updateModel to: self