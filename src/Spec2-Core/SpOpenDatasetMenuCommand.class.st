Class {
	#name : #SpOpenDatasetMenuCommand,
	#superclass : #SpDatasetCommand,
	#instVars : [
		'datasetPresenter',
		'targetItems'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #activation }
SpOpenDatasetMenuCommand class >> datasetYellowClickActivation [
	<classAnnotation>
	
	^CmdClickActivation byYellowButtonFor: SpDatasetPresenter 
]

{ #category : #'context menu' }
SpOpenDatasetMenuCommand >> createContextMenu [ 

	^CmdContextMenuActivation buildMenuInContext: datasetPresenter createCommandContext
]

{ #category : #accessing }
SpOpenDatasetMenuCommand >> datasetPresenter [
	^ datasetPresenter
]

{ #category : #accessing }
SpOpenDatasetMenuCommand >> datasetPresenter: anObject [
	datasetPresenter := anObject
]

{ #category : #accessing }
SpOpenDatasetMenuCommand >> defaultMenuItemName [
	^'Open context menu'
]

{ #category : #execution }
SpOpenDatasetMenuCommand >> execute [
	
	| menu |
	menu := self createContextMenu.
	menu isEmpty ifTrue: [^self].
	
	datasetPresenter openContextMenu: menu
]

{ #category : #execution }
SpOpenDatasetMenuCommand >> prepareFullExecutionInContext: aDatasetContext [
	super prepareFullExecutionInContext: aDatasetContext.
	
	datasetPresenter := aDatasetContext tool.
	targetItems := aDatasetContext selectedItems
]

{ #category : #accessing }
SpOpenDatasetMenuCommand >> targetItems [
	^ targetItems
]

{ #category : #accessing }
SpOpenDatasetMenuCommand >> targetItems: anObject [
	targetItems := anObject
]
