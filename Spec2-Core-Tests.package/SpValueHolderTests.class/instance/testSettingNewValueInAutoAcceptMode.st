tests
testSettingNewValueInAutoAcceptMode

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot autoAcceptValues asValueHolder.
	
	holder value: 10.
	
	self assert: point x equals: 10.
	self assert: holder value equals: 10