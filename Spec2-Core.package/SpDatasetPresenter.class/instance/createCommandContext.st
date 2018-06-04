commands
createCommandContext
	^self hasManualSelection 
		ifTrue: [ SpDatasetContext for: self selectedItems: self manualSelection items ]
		ifFalse: [ SpDatasetContext for: self]