controlling
enableManualSelection: aSelection 
	aSelection isSingle 
		ifTrue: [ self beSingleSelection ] ifFalse: [ self beMultipleSelection ].
	selectedRowIndexes := aSelection itemIndexes.
		
	self announcer when: FTSelectionChanged do: [ :ann | 
		aSelection selectItemsAt: selectedRowIndexes ].
	aSelection whenChangedSend: #selectionUpdated: to: self.	
	aSelection whenIndexUpdatedSend: #selectionIndexUpdated: to: self