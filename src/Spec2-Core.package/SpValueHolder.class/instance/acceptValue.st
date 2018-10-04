controlling
acceptValue

	self isReadOnly ifFalse: [ 
		valueAspect writeValue: value ]