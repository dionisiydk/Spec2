Class {
	#name : #SpDatasetCellPresenterTests,
	#superclass : #SpPresenterTestCase,
	#instVars : [
		'datasetPresenter',
		'dataset'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpDatasetCellPresenterTests >> createPresenter [
	^SpDatasetCellPresenter on: model column: datasetPresenter columns first
]

{ #category : #running }
SpDatasetCellPresenterTests >> defaultModel [
	^SpDatasetItem of: SpDataset new item: (SpDataItem of: #actualItem named: 'test item')
]

{ #category : #running }
SpDatasetCellPresenterTests >> setUp [
	
	dataset := (SpSimpleDataSource on: #(1 2 3)) asSpecDataset.
	datasetPresenter := SpDatasetPresenter on: dataset.
	 
	super setUp.
	
	
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testCreatesCellContent [

	self assert: (presenter children includes: presenter contentPresenter)
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testCreatesCollapseButtonForExpandedItemWhenColumnIsExpandable [
	
	| button |
	presenter column beExpandable.
	self assert: presenter column isExpandable.
	model dataSourceItem defaultChildren: #(4 5 6).
	model expand.
	presenter rebuild.
	
	button := presenter children detect: [ :each | each class = SpCommandPresenter ].
	self assert: button command class equals: SpCollapseDatasetCommand.
	self assert: button command datasetItem equals: model.
	self assert: button currentStyle equals: #iconic.
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testCreatesExpandButtonForExpandableColumnWhenItemHasChildren [
	
	| button |
	presenter column beExpandable.
	self assert: presenter column isExpandable.
	model dataSourceItem defaultChildren: #(4 5 6).
	presenter rebuild.
	
	button := presenter children detect: [ :each | each class = SpCommandPresenter ].
	self assert: button command class equals: SpExpandDatasetCommand.
	self assert: button command datasetItem equals: model.
	self assert: button currentStyle equals: #iconic.
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testCreatesExtraPaneToFillSpaceOfExpansionButtonWhenItemHasNoChildren [
	
	| extraPane |
	presenter column beExpandable.
	self assert: presenter column isExpandable.
	self deny: model isExpandable.
	presenter rebuild.
	
	extraPane := presenter view contents first.
	
	self assert: extraPane specPresenter isNil "it is just a pane".
	self assert: presenter view contents second specPresenter equals: presenter contentPresenter.
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testCreatesIdentationElementToIndicateDepth [
	
	| identationPane |
	model dataSourceItem depth: 101.
	presenter rebuild.
	
	identationPane := presenter view contents first.
	
	self assert: identationPane specPresenter isNil "it is just a pane".
	self assert: presenter view contents second specPresenter equals: presenter contentPresenter.
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testCreationCommandContext [

	| context |
	context := presenter createCommandContext.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: datasetPresenter.
	self assert: context selectedItems equals: {model}.
	
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testDoesNotCreateExpansionButtonForExpandableColumnWhenItemHasNoChildren [
	
	presenter column beExpandable.
	self assert: presenter column isExpandable.
	self deny: model isExpandable.
	presenter rebuild.
	
	self deny: (presenter children anySatisfy: [ :each | each class = SpCommandPresenter ])
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testDoesNotCreateExpansionButtonWhenColumnIsNotExpandable [
	
	self deny: presenter column isExpandable.
	model dataSourceItem defaultChildren: #(4 5 6).	
	presenter rebuild.
	
	self deny: (presenter children anySatisfy: [ :each | each class = SpCommandPresenter ])
]

{ #category : #tests }
SpDatasetCellPresenterTests >> testDoesNotCreatesCollapseButtonForExpandedItemWhenColumnIsNotExpandable [
	
	self deny: presenter column isExpandable.
	model dataSourceItem defaultChildren: #(4 5 6).
	model expand.
	presenter rebuild.
	
	self deny: (presenter children anySatisfy: [ :each | each class = SpCommandPresenter ])
]
