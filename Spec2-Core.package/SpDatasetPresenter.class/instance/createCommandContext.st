commands
createCommandContext
	^self hasManualSelection 
		ifTrue: [ SpDatasetContext for: self]
		ifFalse: [ SpDatasetContext for: self selectedItems: self manualSelection items ]