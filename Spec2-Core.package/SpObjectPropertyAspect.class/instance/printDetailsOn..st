printing
printDetailsOn: aStream
	super printDetailsOn: aStream.
	
	aStream nextPutAll: ' of '; print: object
	