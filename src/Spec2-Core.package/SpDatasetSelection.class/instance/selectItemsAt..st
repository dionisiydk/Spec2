controlling
selectItemsAt: indexes 
	
	| newItems |
	newItems := indexes collect: [:each | rootDataset itemAt: each].
	self setNewItems: newItems