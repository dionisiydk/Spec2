tests
testWritingValue
	
	| ass |
	ass := 1->3.
	aspect := ass aspect key build.
	
	aspect writeValue: 10.
	
	self assert: ass key equals: 10