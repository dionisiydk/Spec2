tests
testGettingAspectName

	| holder |
	holder := ((1@3) aspect x name: 'aspect name') asValueHolder.
	
	self assert: holder aspectName equals: 'aspect name'