Extension { #name : #FTTableRowMorph }

{ #category : #'*Spec2-Morphic' }
FTTableRowMorph >> cellViewAt: columnIndex [ 
	^submorphs at: columnIndex
]
