controlling
acceptValue

	self isReadOnly ifFalse: [ 
		aspect writeValue: value ]