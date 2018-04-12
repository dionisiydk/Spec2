tests
testNotReadOnlyByDefault

	aspect := SpObjectPropertyAspect new.
	
	self deny: aspect isReadOnly