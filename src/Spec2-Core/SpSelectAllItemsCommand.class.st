Class {
	#name : #SpSelectAllItemsCommand,
	#superclass : #SpDatasetSelectionCommand,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #testing }
SpSelectAllItemsCommand class >> canBeExecutedInContext: aDatasetContext [
	(super canBeExecutedInContext: aDatasetContext) ifFalse: [ ^false ].
	
	^aDatasetContext manualSelection isMultiple
]

{ #category : #activation }
SpSelectAllItemsCommand class >> shortcutActivation [
	<classAnnotation>
	
	^CmdShortcutActivation by: $a meta for: SpDatasetPresenter
]

{ #category : #execution }
SpSelectAllItemsCommand >> execute [
	
	selection selectAllItems
]
