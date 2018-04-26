tests
testIsReadOnly

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot asValueHolder.
	
	self deny: holder isReadOnly.
	
	holder valueAspect readOnly.
	self assert: holder isReadOnly. 
	