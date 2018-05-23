building cells
buildCellFor: aDatasetItem
	| cell |
	cell := SpDatasetCellPresenter on: aDatasetItem column: self. 
	datasetPresenter buildChild: cell.
	^cell