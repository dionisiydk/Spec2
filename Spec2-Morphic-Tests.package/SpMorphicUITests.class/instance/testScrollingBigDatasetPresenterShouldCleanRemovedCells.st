tests
testScrollingBigDatasetPresenterShouldCleanRemovedCells

	| presenter dataset selection builtChildren1 |
	dataset := (SpSimpleDataSource on: (1 to: 1000) asArray) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.
	presenter buildIn: ui.
	
	builtChildren1 := presenter children.	
	selection selectItemsWith: #(1000).
	presenter view forceRowsUpdate. "Normally table morphs updates during draw cicle"
	
	self deny: (presenter children includesAny: builtChildren1).
	"presenter children collect: [ :each | each model value actualItem ]"