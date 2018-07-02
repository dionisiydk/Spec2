commands
createCommandContext
	| activeSelection |
	activeSelection := selections 
		detect: [ :each | each providesItemsForContext ]  
		ifNone: [ ^SpDatasetContext for: self].
		
	 ^SpDatasetContext for: self selectedItems: activeSelection items 