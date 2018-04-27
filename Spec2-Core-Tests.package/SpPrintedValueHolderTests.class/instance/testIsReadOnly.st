tests
testIsReadOnly

	| holder baseHolder |
	baseHolder := 2 aspect itself asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	
	self deny: holder isReadOnly.
	
	baseHolder valueAspect readOnly.
	self assert: holder isReadOnly.