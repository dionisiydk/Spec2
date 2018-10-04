printing
printOn: aStream
	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		nextPutAll: presenterStyle;
		nextPut: $)