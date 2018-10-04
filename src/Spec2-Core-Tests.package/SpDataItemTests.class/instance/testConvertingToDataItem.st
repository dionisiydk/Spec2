tests
testConvertingToDataItem

	| item |
	item := SpDataItem of: 10 named: 'test'.
	
	self assert: item asDataItem == item