Class {
	#name : #SpMorphicUITests,
	#superclass : #TestCase,
	#instVars : [
		'ui'
	],
	#category : 'Spec2-Morphic-Tests'
}

{ #category : #running }
SpMorphicUITests >> setUp [
	super setUp.
	
	ui := SpMorphicUI new
]

{ #category : #'tests-general' }
SpMorphicUITests >> testAnnotatesMorphsWithPresenter [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	
	presenter buildIn: ui.
	
	self assert: presenter view specPresenter equals: presenter.
	self assert: (presenter view externalName includesSubstring: presenter printString)
]

{ #category : #'tests-dataset' }
SpMorphicUITests >> testBuildingDatasetPresenter [

	| presenter dataset |
	dataset := (SpSimpleDataSource on: #(1 2 3)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpDatasetMorph.
	self assert: presenter view dataSource class equals: SpTableMorphDataSourceAdapter.
	self assert: presenter view dataSource dataset equals: dataset.
]

{ #category : #'tests-dataset' }
SpMorphicUITests >> testBuildingDatasetPresenterWithManualSelection [

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection multiple.
	selection selectItemsWith: #(one three).
	
	presenter buildIn: ui.
	
	self assert: presenter view selectedRowIndexes equals: #(1 3).
	self assert: presenter view isMultipleSelection
]

{ #category : #'tests-dataset' }
SpMorphicUITests >> testBuildingDatasetPresenterWithSingleSelection [

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection single.
	selection selectItemsWith: #(one).
	
	presenter buildIn: ui.
	
	self assert: presenter view selectedRowIndexes equals: #(1).
	self deny: presenter view isMultipleSelection
]

{ #category : #'tests-general' }
SpMorphicUITests >> testBuildingIconicLabelPresenter [

	| presenter |
	presenter := SpLabelPresenter iconic: #classIcon.
	
	presenter buildIn: ui.
	
	self assert: presenter view notNil.
	self assert: presenter view form equals: (Smalltalk ui iconNamed: #classIcon)
]

{ #category : #'tests-general' }
SpMorphicUITests >> testBuildingMultiLabelsCompositeExample [

	| presenter |
	presenter := SpMultiLabelPresenterExample new.
	
	presenter buildIn: ui.
	
	self assert: presenter view submorphs notEmpty
]

{ #category : #'tests-general' }
SpMorphicUITests >> testBuildingMultiLabelsCompositeExampleWithComplexMultiPaneLayout [

	| presenter |
	presenter := SpMultiLabelPresenterExample on: #testModel withStyle: #complexLayout.
	
	presenter buildIn: ui.
	
	self assert: presenter view submorphs notEmpty.
	self assert: (presenter view submorphs first isKindOf: SpContainerMorph).
	self assert: presenter view submorphs first submorphs notEmpty.
	self assert: (presenter view submorphs second isKindOf: SpContainerMorph).
	self assert: presenter view submorphs second submorphs notEmpty
]

{ #category : #'tests-text input' }
SpMorphicUITests >> testBuildingTextInputPresenter [

	| presenter model |
	model := (2@3) aspect x asValueHolder.
	presenter := SpTextInputPresenter on: model.
	
	presenter buildIn: ui.
	
	self assert: presenter view notNil.
	self assert: presenter view contents equals: '2'.
]

{ #category : #'tests-general' }
SpMorphicUITests >> testBuildingTextualLabelPresenter [

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	
	presenter buildIn: ui.
	
	self assert: presenter view notNil
]

{ #category : #'tests-dataset' }
SpMorphicUITests >> testModifyingDatasetSelection [

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.	
	presenter buildIn: ui.
	
	selection selectItemsWith: #(one three).
	
	self assert: presenter view selectedRowIndexes equals: #(3 1) "Fast table manage rows in reversed order"
]

{ #category : #'tests-text input' }
SpMorphicUITests >> testModifyingTextInputModel [

	| presenter model |
	model := ('key' -> 'value') aspect key asValueHolder.
	presenter := SpTextInputPresenter on: model.
	presenter buildIn: ui.
	
	presenter view showNewText: 'newKey'.
		
	self assert: model value equals: 'newKey'
]

{ #category : #'tests-dataset' }
SpMorphicUITests >> testRestoreDatasetSelectionAfterItemExpansion [

	| presenter dataset expandedItem selection |
	dataset := (SpSimpleDataSource on: #(1 2 3)) asSpecDataset.
	expandedItem := (dataset itemAt: 1).
	expandedItem dataSourceItem defaultChildren: #(a s c).
	presenter := SpDatasetPresenter on: dataset.	
	selection := presenter addSelection: SpManualSelection new.
	presenter buildIn: ui.
	selection selectItemsWith: { 2 }.
	
	expandedItem expand.

	self assert: presenter view selectedRowIndexes equals: #(5).	
	self assert: selection actualItems equals: #(2).

]

{ #category : #'tests-dataset' }
SpMorphicUITests >> testScrollingBigDatasetPresenterShouldCleanRemovedCells [

	| presenter dataset selection builtChildren1 |
	dataset := (SpSimpleDataSource on: (1 to: 1000) asArray) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.
	presenter buildIn: ui.
	
	presenter view forceFullUpdate. "Normally table morphs are updated during draw cicle"
		
	builtChildren1 := presenter children copy.	
	selection selectItemsWith: #(1000).
	presenter view forceFullUpdate. "Normally table morphs are updated during draw cicle"
	
	self deny: (presenter children includesAny: builtChildren1).
	"presenter children collect: [ :each | each model value actualItem ]"
]

{ #category : #'tests-dataset' }
SpMorphicUITests >> testSelectingDatasetPresenterItemsShouldMakeThemVisible [

	| presenter dataset selection lastBuiltRow |
	dataset := (SpSimpleDataSource on: (1 to: 1000) asArray) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.
	presenter buildIn: ui.

	selection selectItemsWith: #(1000).
	self assert: presenter view wantsUpdate.
	presenter view forceFullUpdate. "Normally table morphs are updated during draw cicle"
	
	lastBuiltRow := presenter view builtRowViews last.
	self assert: (lastBuiltRow cellViewAt: 1) specPresenter model value actualItem equals: 1000
]

{ #category : #'tests-dataset' }
SpMorphicUITests >> testUpdatingDatasetSelectionByUIEvent [

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three four)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.	
	presenter buildIn: ui.
	
	presenter view selectRowIndexes: #(1 3 4).
		
	self assert: selection actualItems equals: #(four three one) "fast table use reversed selection order. But we want natural ordering. So last item in selection should be really last item which user selects"
]
