initialization
createRubTextMorph
	^(SpAdoptedRubTextMorph on: textModel) 
		getSelectionSelector: #primarySelectionInterval; 
		yourself