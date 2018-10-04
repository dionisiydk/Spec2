accessing
addFirstColumn: aColumn 
	aColumn datasetPresenter: self.
	
	columns := {aColumn}, columns