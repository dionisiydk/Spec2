Class {
	#name : #SpDatasetMorph,
	#superclass : #FTTableMorph,
	#category : 'Spec2-Morphic-Dataset'
}

{ #category : #accessing }
SpDatasetMorph >> builtRowViews [

	^(container exposedRows associations sorted: #key ascending) collect: #value
]

{ #category : #accessing }
SpDatasetMorph >> dataset: aDataset [

	self dataSource: (SpTableMorphDataSourceAdapter on: aDataset)
]

{ #category : #accessing }
SpDatasetMorph >> defaultContainer [
	^ SpDatasetContainerMorph new 
]

{ #category : #controlling }
SpDatasetMorph >> enableManualSelection: aSelection [ 
	aSelection isSingle 
		ifTrue: [ self beSingleSelection ] ifFalse: [ self beMultipleSelection ].
	selectedRowIndexes := aSelection itemIndexes.
		
	self announcer when: FTSelectionChanged do: [ :ann | 
		aSelection selectItemsAt: selectedRowIndexes reversed ].
	aSelection whenChangedSend: #selectionUpdated: to: self.	
	aSelection whenIndexUpdatedSend: #selectionIndexUpdated: to: self
]

{ #category : #'command activation' }
SpDatasetMorph >> enableMouseClickForCommandsOf: aPresenter [
	container enableMouseClickForCommandsOf: aPresenter
]

{ #category : #'command activation' }
SpDatasetMorph >> enableShortcutsForCommandsOf: aPresenter [

	container enableShortcutsForCommandsOf: aPresenter
]

{ #category : #controlling }
SpDatasetMorph >> forceFullUpdate [

	container updateExposedRows 
]

{ #category : #controlling }
SpDatasetMorph >> selectionIndexUpdated: aSelectionIndexUpdate [
	"Fast table manage selection in reversed order"
	selectedRowIndexes := aSelectionIndexUpdate currentIndexes reversed.
	self refresh
]

{ #category : #controlling }
SpDatasetMorph >> selectionUpdated: aValueChanged [
	"Fast table manage selection in reversed order"
	selectedRowIndexes := aValueChanged newValue reversed collect: [ :each | each globalIndex ].
	self ensureVisibleFirstSelection.
	self refresh
]

{ #category : #testing }
SpDatasetMorph >> wantsUpdate [
	^container needsRefreshExposedRows
]
