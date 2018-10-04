Class {
	#name : #SpResetSelectionCommand,
	#superclass : #SpDatasetSelectionCommand,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #testing }
SpResetSelectionCommand class >> canBeExecutedInContext: aDatasetContext [
	^aDatasetContext hasManualSelection and: [aDatasetContext hasSelectedItems not]
]

{ #category : #activation }
SpResetSelectionCommand class >> clickActivation [
	<classAnnotation>
	
	^CmdClickActivation for: SpDatasetPresenter 
]

{ #category : #execution }
SpResetSelectionCommand >> execute [
	selection reset
]
