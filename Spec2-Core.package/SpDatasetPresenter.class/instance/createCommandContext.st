commands
createCommandContext
	| activeSelection |
	activeSelection := selections 
		detect: [ :each | each providesItemsForContext ]  
		ifNone: [ ^itemContextClass for: self].
		
	 ^itemContextClass for: self selectedItems: activeSelection items 