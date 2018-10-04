Class {
	#name : #SpDatasetPresenterTests,
	#superclass : #SpPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpDatasetPresenterTests >> createPresenter [
	^SpDatasetPresenter on: model
]

{ #category : #running }
SpDatasetPresenterTests >> defaultModel [
	^(SpSimpleDataSource on: #(1 2 3)) asSpecDataset
]

{ #category : #tests }
SpDatasetPresenterTests >> testAddFirstColumn [
	
	| newColumn |
	newColumn := SpItemNameColumn new.
	presenter addFirstColumn: newColumn.

	self assert: presenter columns size equals: 2.
	self assert: presenter columns first equals: newColumn.
	self assert: presenter columns first datasetPresenter equals: presenter.
]

{ #category : #tests }
SpDatasetPresenterTests >> testAddSelection [
	
	| selection actual |
	selection := SpManualSelection new.
	actual := presenter addSelection: selection.

	self assert: actual == selection.
	self assert: selection rootDataset equals: model
]

{ #category : #tests }
SpDatasetPresenterTests >> testAttachesSelectionToView [
	
	| selection |
	selection := SpManualSelection new.
	presenter addSelection: selection.
	presenter rebuild.

	self assert: presenter view manualSelection equals: selection 
]

{ #category : #tests }
SpDatasetPresenterTests >> testCreationCommandContextForGivenDatasetItem [

	| item context |
	item := model itemAt: 1.
	context := presenter createCommandContextFor: item.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: presenter.
	self assert: context selectedItems equals: {item}
]

{ #category : #tests }
SpDatasetPresenterTests >> testCreationCommandContextForGivenDatasetItemWhichIsPartOfSelection [

	| item context selection |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsAt: #(1 3).
	item := model itemAt: 1.
	context := presenter createCommandContextFor: item.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: presenter.
	self 
		assert: (context selectedItems collect: #actualItem) 
		equals: {(model itemAt: 3) actualItem. item actualItem}
]

{ #category : #tests }
SpDatasetPresenterTests >> testCreationCommandContextWhenCustomItemContextIsSpecified [

	| item context |
	presenter itemContextClass: SpDatasetContextExample.
	
	item := model itemAt: 1.
	context := presenter createCommandContextFor: item.
	
	self assert: context class equals: SpDatasetContextExample.
	self assert: context tool equals: presenter.
	self assert: context selectedItems equals: {item}
]

{ #category : #tests }
SpDatasetPresenterTests >> testCreationCommandContextWhenManualSelectionIsNotAdded [

	| context |
	context := presenter createCommandContext.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: presenter.
	self assert: context selectedItems isEmpty.
	
]

{ #category : #tests }
SpDatasetPresenterTests >> testCreationCommandContextWhenThereIsManualSelection [

	| context selection |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsAt: #(1 3).
	context := presenter createCommandContext.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: presenter.
	self deny: context selectedItems isEmpty.
	self assert: context selectedItems equals: selection items
]

{ #category : #tests }
SpDatasetPresenterTests >> testDetachingFromModel [
	
	presenter detachFromModel.
	
	self deny: (model hasSubscriber: presenter)
]

{ #category : #tests }
SpDatasetPresenterTests >> testDetachingFromModelShouldCloseIt [
	
	| dataSource |
	dataSource := SpDataSourceForTest on: #(1 2 3).
	presenter model: dataSource.
	
	presenter detachFromModel.
	
	self assert: dataSource wasClosed
]

{ #category : #tests }
SpDatasetPresenterTests >> testHasEmptySelectionsByDefault [

	self assert: presenter selections isEmpty
]

{ #category : #tests }
SpDatasetPresenterTests >> testHasItemContextByDefault [

	self assert: presenter itemContextClass equals: SpDatasetContext
]

{ #category : #tests }
SpDatasetPresenterTests >> testHasSingleNameColumnByDefault [

	self assert: presenter columns size equals: 1.
	self assert: presenter columns first class equals: SpItemNameColumn.
	self assert: presenter columns first datasetPresenter equals: presenter
]

{ #category : #tests }
SpDatasetPresenterTests >> testNotShowsColumnHeaderByDefault [

	self deny: presenter showsColumnHeader 
]

{ #category : #tests }
SpDatasetPresenterTests >> testOpensDatasetDuringBuild [
	
	| dataSource |
	dataSource := SpDataSourceForTest on: #(1 2 3).
	
	presenter := SpDatasetPresenter on: dataSource.
	self deny: dataSource wasOpened.
	
	presenter buildIn: ui.
	self assert: dataSource wasOpened
	
]

{ #category : #tests }
SpDatasetPresenterTests >> testRefreshesViewWhenDatasetIsChanged [
	
	| currentItems |
	currentItems := presenter view contents.
	
	model announceChanges. 
	
	self deny: presenter view contents = currentItems
]

{ #category : #tests }
SpDatasetPresenterTests >> testRestoresSelectionWhenDatasetIsChanged [
	
	| itemsBeforeUpdate selection |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsWith: { model dataSource actualItems second }.
	
	itemsBeforeUpdate := selection items.
	
	model announceChanges. 
	
	self deny: selection items = itemsBeforeUpdate.
	self assert: selection actualItems equals: { model dataSource actualItems second }
]

{ #category : #tests }
SpDatasetPresenterTests >> testRestoresSelectionWhenPreviousItemWasCollapsed [
	
	| selection expandedItem selectedItem |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsWith: { model dataSource actualItems second }.
	expandedItem := model itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a s d).
	presenter rebuild.
	
	expandedItem expand.
	expandedItem collapse.
	
	selectedItem := selection items first.
	self assert: selectedItem globalIndex equals: 2.
	self assert: presenter view selectedItemIndexes equals: #(2)
]

{ #category : #tests }
SpDatasetPresenterTests >> testRestoresSelectionWhenPreviousItemWasExpanded [
	
	| selection expandedItem selectedItem |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsWith: { model dataSource actualItems second }.
	expandedItem := model itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a s d).
	presenter rebuild.
	
	expandedItem expand.
	
	selectedItem := selection items first.
	self assert: selectedItem globalIndex equals: 5.
	self assert: presenter view selectedItemIndexes equals: #(5)
]

{ #category : #tests }
SpDatasetPresenterTests >> testRestoresSelectionWhichItemWasRemovedByParentCollapsing [
	
	| selection expandedItem |
	selection := presenter addSelection: SpManualSelection new.
	expandedItem := model itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a s d).
	presenter rebuild.
	
	expandedItem expand.
	selection selectItemsWith: { model dataSource actualItems second. #s }.
	self assert: selection actualItems equals: {  model dataSource actualItems second. #s  }.

	expandedItem collapse.
	
	self assert: selection actualItems equals: {model dataSource actualItems second}.
	self assert: presenter view selectedItemIndexes equals: #(2)
]
