operations
convertDecoratedPosition: index toNativeOn: aString
	
	| stringBeforeIndex nativeString |
	stringBeforeIndex := aString copyFrom: 1 to: (index min: aString size).
	nativeString := self convertDecoratedTextToNative: stringBeforeIndex.
	
	^index - (stringBeforeIndex size - nativeString size)