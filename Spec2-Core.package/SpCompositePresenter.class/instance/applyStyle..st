controlling
applyStyle: newStyle
	self detachChildrenFromModel.
	children removeAll.
	
	super applyStyle: newStyle