tests
testRefreshItemsShouldNotAnnounceIndexChangeWhenThereWasRemovedItemToo
	
	| actualSelectedItems indexChangeAnnounced generalChangeAnnounced |
	indexChangeAnnounced := generalChangeAnnounced := false.
	actualSelectedItems := {dataset actualItems first. dataset actualItems third}.
	selection selectItemsWith: actualSelectedItems.
	dataset dataSource actualItems: #(-100), dataset actualItems allButFirst.
	
	selection whenIndexUpdatedSend: #value to: [ indexChangeAnnounced := true ].
	selection whenChangedDo: [ generalChangeAnnounced := true ].
	selection refreshItems.
	
	self deny: indexChangeAnnounced.
	self assert: generalChangeAnnounced