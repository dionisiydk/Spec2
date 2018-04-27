tests
testIsReadOnlyWhenStringConvertionDoesNotSupported

	| holder baseHolder |
	baseHolder := 2 aspect itself asValueHolder.
	self deny: baseHolder isReadOnly.
	
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpObjectToStringConverter default.
	
	self assert: holder isReadOnly