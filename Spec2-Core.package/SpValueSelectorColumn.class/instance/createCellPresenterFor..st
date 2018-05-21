building cells
createCellPresenterFor: aDataItem

	| cellModel |
	cellModel := selectionStrategy prepareExistanceModelOfItem: aDataItem actualItem in: affectedModel.
	^cellModel createInputPresenter