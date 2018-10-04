tests
testComparingWithCopy

	self assert: restriction equals: restriction copy.
	self assert: restriction hash equals: restriction hash