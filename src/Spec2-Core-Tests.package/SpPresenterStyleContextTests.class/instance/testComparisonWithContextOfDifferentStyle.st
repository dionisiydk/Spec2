tests
testComparisonWithContextOfDifferentStyle

	| anotherContext |
	anotherContext := uiContext copy.
	anotherContext presenterStyle: #anotherStyle.
	
	self deny: uiContext equals: anotherContext