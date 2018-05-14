accessing
addSelection: aDatasetSelection
	selections add: aDatasetSelection.
	model ifNotNil: [ aDatasetSelection attachToDataset: model ].
	^aDatasetSelection 
	