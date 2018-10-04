initialize
markCellsAsRemoved
	
	submorphs do: [ :each | 
		each specPresenter ifNotNil: [ :presenter | presenter viewWasRemoved ]
	]