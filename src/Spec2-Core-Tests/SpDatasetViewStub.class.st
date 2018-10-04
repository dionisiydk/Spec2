Class {
	#name : #SpDatasetViewStub,
	#superclass : #SpCompositeViewStub,
	#instVars : [
		'columns',
		'dataset',
		'manualSelection',
		'selectedItemIndexes'
	],
	#category : 'Spec2-Core-Tests-StubUI'
}

{ #category : #accessing }
SpDatasetViewStub >> builtRowViews [
	^contents
]

{ #category : #accessing }
SpDatasetViewStub >> columns [
	^ columns
]

{ #category : #accessing }
SpDatasetViewStub >> columns: aCollection [ 
	columns := aCollection
]

{ #category : #accessing }
SpDatasetViewStub >> dataset [
	^ dataset
]

{ #category : #accessing }
SpDatasetViewStub >> dataset: aDataset [ 
	dataset := aDataset.
	self refresh
]

{ #category : #controlling }
SpDatasetViewStub >> enableManualSelection: aSelection [ 
	manualSelection := aSelection.
	selectedItemIndexes := manualSelection itemIndexes.
	"Normally view cache indexes of selected items.
	Presenter/View interaction logic should update them when data source is changed"
	manualSelection whenIndexUpdatedSend: #manualSelectionIndexUpdated: to: self.
	manualSelection whenChangedSend: #manualSelectionUpdated: to: self.
]

{ #category : #accessing }
SpDatasetViewStub >> manualSelection [
	^ manualSelection
]

{ #category : #accessing }
SpDatasetViewStub >> manualSelection: anObject [
	manualSelection := anObject
]

{ #category : #'event handling' }
SpDatasetViewStub >> manualSelectionIndexUpdated: aSelectionIndexUpdated [
	selectedItemIndexes := aSelectionIndexUpdated currentIndexes
]

{ #category : #'event handling' }
SpDatasetViewStub >> manualSelectionUpdated: aValueChanged [
	selectedItemIndexes := aValueChanged newValue collect: [ :each | each globalIndex ]
]

{ #category : #controlling }
SpDatasetViewStub >> refresh [

	| item cells |
	contents := Array new: dataset itemCount.
	1 to: contents size do: [ :i | 
		item := dataset itemAt: i.
		cells := columns collect: [ :each | (each buildCellFor: item) view ].
		contents at: i put: (SpDatasetRowStub with: cells).
	]
]

{ #category : #accessing }
SpDatasetViewStub >> selectedItemIndexes [
	^ selectedItemIndexes
]

{ #category : #accessing }
SpDatasetViewStub >> selectedItemIndexes: anObject [
	selectedItemIndexes := anObject
]
