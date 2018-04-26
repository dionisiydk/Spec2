tests
testConvertingToTextValueHolder

	| holder textHolder |
	holder := (1@3) aspect x asValueHolder.
	textHolder := holder asTextValueHolder.
	
	self assert: textHolder class equals: SpPrintedValueHolder.
	self assert: textHolder baseValueHolder equals: holder.
	self assert: textHolder stringConverter equals: holder valueAspect stringConverter