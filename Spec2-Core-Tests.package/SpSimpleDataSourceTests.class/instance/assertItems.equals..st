tests
assertItems: actualDataItems equals: expectedDataItems

	| expectedItems actualObjects |
	actualObjects := actualDataItems collect: [ :each | each ifNotNil: [each actualItem] ] as: Array.
	expectedItems := expectedDataItems collect: [ :each | each ifNotNil: [each actualItem] ] as: Array.
	
	self assert: actualObjects equals: expectedItems