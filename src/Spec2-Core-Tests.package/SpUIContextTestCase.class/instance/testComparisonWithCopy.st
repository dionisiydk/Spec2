tests
testComparisonWithCopy

	| copy |
	copy := uiContext copy.
	
	self assert: uiContext equals: copy.
	self assert: uiContext hash equals: copy hash