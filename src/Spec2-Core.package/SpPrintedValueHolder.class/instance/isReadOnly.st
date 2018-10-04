testing
isReadOnly
	^baseValueHolder isReadOnly or: [ stringConverter supportsConvertionFromString not ]