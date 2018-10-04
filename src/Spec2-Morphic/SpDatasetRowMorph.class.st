Class {
	#name : #SpDatasetRowMorph,
	#superclass : #FTTableRowMorph,
	#category : 'Spec2-Morphic-Dataset'
}

{ #category : #initialize }
SpDatasetRowMorph >> markCellsAsRemoved [
	
	submorphs do: [ :each | 
		each specPresenter ifNotNil: [ :presenter | presenter viewWasRemoved ]
	]
]
