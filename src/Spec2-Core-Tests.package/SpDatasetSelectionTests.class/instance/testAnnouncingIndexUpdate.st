tests
testAnnouncingIndexUpdate

	| event |
	selection whenIndexUpdatedSend: #value: to: [:ann | event := ann].
	
	selection indexWasUpdated.
	
	self assert: event class equals: SpSelectionIndexUpdated.
	self assert: event selection equals: selection.
	self assert: event currentIndexes equals: selection itemIndexes.