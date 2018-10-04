tests
testIsSynchronizedWithBaseValueByDefault

	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	
	self assert: holder value equals: '2'