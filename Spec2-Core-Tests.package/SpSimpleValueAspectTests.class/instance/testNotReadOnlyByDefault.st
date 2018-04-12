tests
testNotReadOnlyByDefault

	aspect := SpSimpleValueAspect new.
	
	self deny: aspect isReadOnly