tests
testRefreshItemsShouldAnnounceIndexChangeWhenSelectedItemChangedIndex
	
	| actualSelectedItems executed |
	executed := false.
	actualSelectedItems := {dataset actualItems first. dataset actualItems third}.
	selection selectItemsWith: actualSelectedItems.
	dataset dataSource actualItems: #(-100), dataset actualItems.
	
	selection whenIndexUpdatedSend: #value to: [ executed := true ].
	selection refreshItems.
	
	self assert: executed