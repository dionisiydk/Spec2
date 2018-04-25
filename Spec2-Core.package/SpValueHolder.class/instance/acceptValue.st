controlling
acceptValue

	aspect isReadOnly ifFalse: [ 
		aspect writeValue: value ]