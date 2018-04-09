tests
testConvertingToTextValueHolder

	| holder textHolder |
	holder := (1@3) aspect x asValueHolder.
	textHolder := holder asTextValueHolder.
	
	self assert: textHolder class equals: SpValueHolder.
	self assert: textHolder aspect class equals: SpPrintedValueAspect.
	self assert: textHolder aspect actualValueHolder equals: holder.