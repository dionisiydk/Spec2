operations
convertNativeTextToDecorated: aString 
	
	| decimalSeparator integerPart stream decimalPart integerStream result |
	decimalSeparator := aString detect: [ :each | each = $. or: [each = $,] ] ifNone: [ nil ].
	decimalSeparator 
		ifNil: [ integerPart := aString ]
		ifNotNil: [ stream := aString readStream.
			integerPart := stream upTo: decimalSeparator.
			decimalPart := stream upToEnd].
	
	integerPart := self convertDecoratedTextToNative: integerPart.
	result := String streamContents: [ :s |
		decimalSeparator ifNotNil: [ s nextPutAll: decimalPart reversed; nextPut: decimalSeparator].
		integerStream := integerPart reversed readStream.
		[integerStream atEnd] whileFalse: [
			s nextPutAll: (integerStream next: 3).
			integerStream atEnd ifFalse: [ s nextPutAll: thousandsSeparator].
		 ]		
	 ].

	^result reversed