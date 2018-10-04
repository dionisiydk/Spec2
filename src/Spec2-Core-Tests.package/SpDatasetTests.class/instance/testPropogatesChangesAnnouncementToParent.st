tests
testPropogatesChangesAnnouncementToParent
	| executed item |
	executed := false.
	
	item := dataset itemAt: 1.
	item dataSourceItem defaultChildren: #(a s d).
	item expand.
	dataset whenChangedSend: #value to: [ executed := true ].
	
	item childrenDataset announceChanges.
	self assert: executed.