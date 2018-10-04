Class {
	#name : #SpExpandSelectionCommand,
	#superclass : #SpDatasetSelectionCommand,
	#instVars : [
		'newSelectionLastItem'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #testing }
SpExpandSelectionCommand class >> canBeExecutedInContext: aDatasetContext [
	(super canBeExecutedInContext: aDatasetContext) ifFalse: [ ^false ].
	
	^aDatasetContext manualSelection isMultiple
]

{ #category : #activation }
SpExpandSelectionCommand class >> clickActivation [
	<classAnnotation>
	
	^CmdClickActivation with: KMModifier shift for: SpDatasetPresenter 
]

{ #category : #execution }
SpExpandSelectionCommand >> execute [

	selection expandUpToItem: newSelectionLastItem
]

{ #category : #accessing }
SpExpandSelectionCommand >> newSelectionLastItem [
	^ newSelectionLastItem
]

{ #category : #accessing }
SpExpandSelectionCommand >> newSelectionLastItem: anObject [
	newSelectionLastItem := anObject
]

{ #category : #execution }
SpExpandSelectionCommand >> readParametersFromContext: aDatasetContext [
	super readParametersFromContext: aDatasetContext.
	
	newSelectionLastItem := aDatasetContext selectedItems last
]
