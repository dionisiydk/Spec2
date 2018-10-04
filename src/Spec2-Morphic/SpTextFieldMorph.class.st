Class {
	#name : #SpTextFieldMorph,
	#superclass : #SpTextMorph,
	#category : 'Spec2-Morphic-Views'
}

{ #category : #initialization }
SpTextFieldMorph >> initializeTextMorph [
	super initializeTextMorph.
	
	textMorph scrollbarsShowNever
]
