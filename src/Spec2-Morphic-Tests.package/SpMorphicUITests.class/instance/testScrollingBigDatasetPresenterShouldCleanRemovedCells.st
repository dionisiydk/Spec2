tests-dataset
testScrollingBigDatasetPresenterShouldCleanRemovedCells

	| presenter dataset selection builtChildren1 |
	dataset := (SpSimpleDataSource on: (1 to: 1000) asArray) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.
	presenter buildIn: ui.
	
	presenter view forceFullUpdate. "Normally table morphs are updated during draw cicle"
		
	builtChildren1 := presenter children copy.	
	selection selectItemsWith: #(1000).
	presenter view forceFullUpdate. "Normally table morphs are updated during draw cicle"
	
	self deny: (presenter children includesAny: builtChildren1).
	"presenter children collect: [ :each | each model value actualItem ]"