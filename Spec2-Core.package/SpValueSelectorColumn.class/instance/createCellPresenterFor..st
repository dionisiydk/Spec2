building cells
createCellPresenterFor: aDataItem

	| cellModel |
	cellModel := selectionStrategy prepareBooleanModelItem: aDataItem actualItem in: affectedModel.
	^cellModel createInputPresenter