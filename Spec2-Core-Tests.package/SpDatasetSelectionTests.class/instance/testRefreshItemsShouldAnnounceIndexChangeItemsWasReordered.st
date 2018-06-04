tests
testRefreshItemsShouldAnnounceIndexChangeItemsWasReordered
	
	| executed |
	executed := false.
	selection selectItemsAt: #(1 3).
	
	selection whenIndexUpdatedSend: #value to: [ executed := true ].
	
	selection selectItemsAt: #(3 1).	
	self assert: executed