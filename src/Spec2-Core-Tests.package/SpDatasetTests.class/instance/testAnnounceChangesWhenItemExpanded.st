tests
testAnnounceChangesWhenItemExpanded
	| executed item |
	executed := false.
	dataset whenChangedSend: #value to: [ executed := true ].
	
	item := dataset itemAt: 1.
	item dataSourceItem defaultChildren: #(a s d).
	item expand.
	
	self assert: executed.