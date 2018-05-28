tests
testRefreshItemsShouldAnnounceChangesWhenSelectedItemWasRemoved
	
	| executed |
	selection selectItemsWith: { dataset actualItems first. dataset actualItems third}.
	dataset dataSource actualItems: dataset actualItems allButFirst.
	
	selection whenChangedDo: [ executed := true ].
	selection refreshItems.
	
	self assert: executed