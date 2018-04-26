tests
testIsOptionalCheck

	| holder |
	holder := (1@3) aspect x asValueHolder.
	
	self deny: holder isOptional.
	
	holder valueAspect optional.
	self assert: holder isOptional.