accessing
valueSetter
	^ valueSetter ifNil: [ 
		isReadOnly 
			ifTrue: [ nil ] 
			ifFalse: [ valueSetter := valueGetter asAspectValueSetterOrNil ] ]