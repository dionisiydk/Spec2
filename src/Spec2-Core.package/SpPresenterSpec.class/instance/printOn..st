printing
printOn: aStream
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: definingMethod name;
		nextPut: $)