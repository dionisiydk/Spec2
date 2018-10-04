tests
testSynchronizeWithInvalidBaseValue

	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	baseHolder value: (SpInvalidValue with: 'test invalid value').
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpStringToStringConverter default.
	
	self assert: holder value equals: 'test invalid value'