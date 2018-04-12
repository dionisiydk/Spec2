printing
printOn: aStream
	super printOn: aStream.
	
	aStream nextPut: $(.
	aspect 
		ifNil: [ aStream nextPutAll: 'undefined on ', object printString ]
		ifNotNil: [ aStream nextPutAll: aspect name, ' of ', object printString ].
	aStream nextPut: $).