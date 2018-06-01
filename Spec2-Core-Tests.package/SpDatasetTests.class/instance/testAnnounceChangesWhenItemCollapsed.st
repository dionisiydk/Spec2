tests
testAnnounceChangesWhenItemCollapsed
	| executed item |
	executed := false.
	
	item := dataset itemAt: 1.
	item dataSourceItem defaultChildren: #(a s d).
	item expand.
	dataset whenChangedSend: #value to: [ 
		self deny: item isExpanded.
		executed := true ].
	
	item collapse.
	
	self assert: executed.