Class {
	#name : #SpToggleItemSelectionCommand,
	#superclass : #SpDatasetSelectionCommand,
	#instVars : [
		'targetItem'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #testing }
SpToggleItemSelectionCommand class >> canBeExecutedInContext: aDatasetContext [
	(super canBeExecutedInContext: aDatasetContext) ifFalse: [ ^false ].
	
	^aDatasetContext manualSelection isMultiple
]

{ #category : #activation }
SpToggleItemSelectionCommand class >> clickActivation [
	<classAnnotation>
	
	^CmdClickActivation with: KMModifier meta for: SpDatasetPresenter 
]

{ #category : #execution }
SpToggleItemSelectionCommand >> execute [

	selection toggleItem: targetItem
]

{ #category : #execution }
SpToggleItemSelectionCommand >> readParametersFromContext: aDatasetContext [
	super readParametersFromContext: aDatasetContext.
	
	targetItem := aDatasetContext selectedItems last
]

{ #category : #accessing }
SpToggleItemSelectionCommand >> targetItem [
	^ targetItem
]

{ #category : #accessing }
SpToggleItemSelectionCommand >> targetItem: anObject [
	targetItem := anObject
]
