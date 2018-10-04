Class {
	#name : #SpDatasetSelectionCommand,
	#superclass : #SpDatasetCommand,
	#instVars : [
		'selection'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #testing }
SpDatasetSelectionCommand class >> canBeExecutedInContext: aDatasetContext [
	^aDatasetContext hasManualSelection and: [aDatasetContext hasSelectedItems]
]

{ #category : #execution }
SpDatasetSelectionCommand >> readParametersFromContext: aDatasetContext [
	super readParametersFromContext: aDatasetContext.
	
	selection := aDatasetContext manualSelection
]

{ #category : #accessing }
SpDatasetSelectionCommand >> selection [
	^ selection
]

{ #category : #accessing }
SpDatasetSelectionCommand >> selection: anObject [
	selection := anObject
]
