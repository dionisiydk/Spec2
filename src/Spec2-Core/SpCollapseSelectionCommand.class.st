Class {
	#name : #SpCollapseSelectionCommand,
	#superclass : #SpDatasetSelectionCommand,
	#instVars : [
		'targetItem'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #activation }
SpCollapseSelectionCommand class >> clickActivation [
	<classAnnotation>
	
	^CmdClickActivation for: SpDatasetPresenter 
]

{ #category : #execution }
SpCollapseSelectionCommand >> execute [

	selection collapseAtItem: targetItem
]

{ #category : #execution }
SpCollapseSelectionCommand >> readParametersFromContext: aDatasetContext [
	super readParametersFromContext: aDatasetContext.
	
	targetItem := aDatasetContext selectedItems last
]

{ #category : #accessing }
SpCollapseSelectionCommand >> targetItem [
	^ targetItem
]

{ #category : #accessing }
SpCollapseSelectionCommand >> targetItem: anObject [
	targetItem := anObject
]
