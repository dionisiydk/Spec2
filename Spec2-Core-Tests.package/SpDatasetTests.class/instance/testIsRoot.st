tests
testIsRoot

	self assert: dataset isRoot.
	
	dataset parentItem: #parentItem.
	
	self deny: dataset isRoot