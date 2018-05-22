controlling
collapse

	childrenDataset ifNil: [ ^self ].
	
	childrenDataset close.
	ownerDataset itemWasCollapsed: self.
	childrenDataset := nil