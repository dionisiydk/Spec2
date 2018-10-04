tests
testSettingNewValue

	| holder baseHolder |
	baseHolder := 2 asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpNumberToStringConverter default.
	
	holder value: '10'.
	
	self assert: holder value equals: '10'.
	self assert: baseHolder value equals: 10