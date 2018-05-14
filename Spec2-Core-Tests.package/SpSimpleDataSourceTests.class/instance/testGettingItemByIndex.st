tests
testGettingItemByIndex

	| dataItem actualObject |
	dataItem := dataSource itemAt: 2.
	actualObject :=  actualItems second.
	
	self assert: dataItem class equals: SpDataItem.
	self assert: dataItem actualItem equals: actualObject.
	self assert: dataItem name equals: actualObject displayString.
	self assert: dataItem index equals: 2.