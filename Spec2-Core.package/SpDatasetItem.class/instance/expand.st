controlling
expand

	childrenDataset := dataSourceItem defaultChildren createDataset.
	childrenDataset 
		parentItem: self;
		depth: ownerDataset depth + 1;
		open.
	
	ownerDataset itemWasExpanded: self