tests
testConvertingToTextValueHolder

	| holder converted |
	holder := SpPrintedValueHolder 
		of: 1 asValueHolder stringConverter: SpNumberToStringConverter default.
	
	converted := holder asTextValueHolder.
	
	self assert: converted equals: holder