tests
testGettingName

	| holder |
	holder := ((1@3) aspect x name: 'aspect name') asValueHolder.
	
	self assert: holder name equals: 'aspect name'