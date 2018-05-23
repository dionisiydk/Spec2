building cells
createCellPresenterFor: aDatasetItem

	| cellModel |
	cellModel := selectionStrategy 
		prepareExistenceModelOfItem: aDatasetItem actualItem in: affectedModel.
	^cellModel createInputPresenter