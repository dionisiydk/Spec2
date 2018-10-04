tests
testWritingValueUsingBlockSetter
	
	| point |
	point := 2@3.
	aspect := point aspect x; valueSetter: [ :p :value | p setX: value setY: p y ]; build.
	
	aspect writeValue: 10.
	
	self assert: point x equals: 10