tests
testReadingComputedValue
	
	aspect := (-1@2) aspect computedBy: [ :p | p abs ]; build.
	
	self assert: aspect readValue equals: 1@2