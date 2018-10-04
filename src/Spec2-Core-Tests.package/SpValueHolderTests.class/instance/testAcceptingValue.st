tests
testAcceptingValue

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot asValueHolder.
	
	holder value: 10.
	self assert: point x equals: 2.
	
	holder acceptValue.
	self assert: point x equals: 10