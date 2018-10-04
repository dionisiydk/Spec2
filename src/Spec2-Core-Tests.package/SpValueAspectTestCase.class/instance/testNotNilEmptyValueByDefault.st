tests
testNotNilEmptyValueByDefault

	aspect := self aspectExample.
	
	self assert: aspect emptyValues equals: #(nil)