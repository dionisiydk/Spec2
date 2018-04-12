tests
testHasNoDisplayDecorationByDefault

	aspect := self aspectExample.
	
	self assert: aspect displayDecoration == SpNoTextDecoration default