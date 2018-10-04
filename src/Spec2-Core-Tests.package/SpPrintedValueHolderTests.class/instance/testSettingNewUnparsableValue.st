tests
testSettingNewUnparsableValue

	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	
	holder value: 'abc'.
	
	self assert: holder value equals: 'abc'.
	self assert: baseHolder value equals: (SpInvalidValue with: 'abc')