tests
testComparisonWithAnotherItem

	| item equalItem differentItem |
	item := SpDataItem of: 1 named: 'one'.
	equalItem := SpDataItem of: 1 named: 'one2'.
	differentItem := SpDataItem of: 2 named: 'two'.
	
	self assert: (item isEqualTo: equalItem).
	self deny: (item isEqualTo: differentItem).