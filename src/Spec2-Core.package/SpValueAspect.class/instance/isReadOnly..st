accessing
isReadOnly: aBoolean
	aBoolean not & self isAlwaysReadOnly ifTrue: [ 
		self error: 'Aspect does not support writable mode' ].
	
	isReadOnly := aBoolean