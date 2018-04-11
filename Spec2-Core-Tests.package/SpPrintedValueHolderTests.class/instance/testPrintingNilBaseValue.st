tests
testPrintingNilBaseValue

	| holder baseHolder |
	baseHolder := nil asValueHolder.
	holder := SpPrintedValueHolder of: baseHolder stringConverter: SpStringToStringConverter default.
	
	self assert: holder value equals: ''