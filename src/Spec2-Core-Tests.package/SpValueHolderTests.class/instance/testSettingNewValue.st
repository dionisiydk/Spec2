tests
testSettingNewValue

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot asValueHolder.
	
	holder value: 10.
	
	self assert: holder value equals: 10.
	self assert: point x equals: 2.
	