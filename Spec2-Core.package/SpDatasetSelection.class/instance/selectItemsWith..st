controlling
selectItemsWith: actualItems 
	
	| newItems |
	newItems := rootDataset itemsWith: actualItems.
	self setNewItems: newItems