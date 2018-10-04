tests
testComparisonWithContextOfSameStyle

	| anotherContext |
	uiContext presenterStyle: #someStyle.
	anotherContext := uiContext copy.
	
	self assert: uiContext equals: anotherContext.
	self assert: uiContext hash equals: anotherContext hash