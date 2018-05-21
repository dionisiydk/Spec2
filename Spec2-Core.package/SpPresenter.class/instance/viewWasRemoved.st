controlling
viewWasRemoved

	self detachFromModel.
	parent ifNotNil: [ parent removeChild: self ]