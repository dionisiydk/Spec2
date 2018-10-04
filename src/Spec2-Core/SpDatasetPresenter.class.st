Class {
	#name : #SpDatasetPresenter,
	#superclass : #SpCompositePresenter,
	#instVars : [
		'columns',
		'selections',
		'showsColumnHeader',
		'itemContextClass'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #accessing }
SpDatasetPresenter >> addFirstColumn: aColumn [ 
	aColumn datasetPresenter: self.
	
	columns := {aColumn}, columns
]

{ #category : #accessing }
SpDatasetPresenter >> addSelection: aDatasetSelection [
	selections add: aDatasetSelection.
	model ifNotNil: [ aDatasetSelection attachToDataset: model ].
	^aDatasetSelection 
	
]

{ #category : #initialization }
SpDatasetPresenter >> attachToModel [
	model open.
	model whenChangedSend: #datasetWasChanged to: self.
	selections do: [ :each | each attachToDataset: model ]
]

{ #category : #initialization }
SpDatasetPresenter >> attachToView [
	
	view columns: columns.
	view dataset: model.	
	selections do: [ :each | each attachToView: view ].
	self enableCommands 
]

{ #category : #accessing }
SpDatasetPresenter >> columns [
	^ columns
]

{ #category : #accessing }
SpDatasetPresenter >> columns: anObject [
	columns := anObject
]

{ #category : #initialization }
SpDatasetPresenter >> createChildren [
	"All children are built dynamically using dataset items which are visible in view"
]

{ #category : #commands }
SpDatasetPresenter >> createCommandContext [
	| activeSelection |
	activeSelection := selections 
		detect: [ :each | each providesItemsForContext ]  
		ifNone: [ ^itemContextClass for: self].
		
	 ^itemContextClass for: self selectedItems: activeSelection items 
]

{ #category : #commands }
SpDatasetPresenter >> createCommandContextFor: aDatasetItem [ 

	| activeSelection selectedItems |
	activeSelection := selections 
		detect: [ :each | each extendsContextOf: aDatasetItem ]
		ifNone: [ ^itemContextClass for: self selectedItems: { aDatasetItem }].
		
	selectedItems := activeSelection itemsExtendingContextOf: aDatasetItem.
	^itemContextClass for: self selectedItems: selectedItems
]

{ #category : #commands }
SpDatasetPresenter >> createCommandContextForCursorAt: aPoint [
	"Currently dataset view does not need to detect item at given point 
	because item contexts are managed by cell presenters.
	This method called only when event happens in empty space (out of items).
	But better implementation should not depends on this knowledge.
	It should detect item and column which belongs to aPoint. It is for todo"
	^itemContextClass for: self
]

{ #category : #controlling }
SpDatasetPresenter >> datasetWasChanged [

	selections do: [ :each | each refreshItems ].
	self refresh
]

{ #category : #initialization }
SpDatasetPresenter >> detachFromModel [
	super detachFromModel.
	
	model unsubscribe: self.
	model close.
	
]

{ #category : #accessing }
SpDatasetPresenter >> firstColumn [
	^columns first
]

{ #category : #testing }
SpDatasetPresenter >> hasManualSelection [
	^selections anySatisfy: [ :each | each isKindOf: SpManualSelection ]
]

{ #category : #initialization }
SpDatasetPresenter >> initialize [
	super initialize.
	
	columns := { SpItemNameColumn of: self }.
	selections := OrderedCollection new.
	showsColumnHeader := false.
	itemContextClass := SpDatasetContext
]

{ #category : #accessing }
SpDatasetPresenter >> itemContextClass [
	^ itemContextClass
]

{ #category : #accessing }
SpDatasetPresenter >> itemContextClass: anObject [
	itemContextClass := anObject
]

{ #category : #accessing }
SpDatasetPresenter >> manualSelection [
	^selections detect: [ :each | each isKindOf: SpManualSelection ]
]

{ #category : #accessing }
SpDatasetPresenter >> model: aDatasetOrConvertable [
	super model: aDatasetOrConvertable asSpecDataset
	
]

{ #category : #controlling }
SpDatasetPresenter >> refresh [

	view refresh
]

{ #category : #accessing }
SpDatasetPresenter >> selections [
	^ selections
]

{ #category : #accessing }
SpDatasetPresenter >> selections: anObject [
	selections := anObject
]

{ #category : #'styles-default' }
SpDatasetPresenter >> setUpDefaultStyle [
	<styleSpec>
	

]

{ #category : #accessing }
SpDatasetPresenter >> showsColumnHeader [
	^ showsColumnHeader
]

{ #category : #accessing }
SpDatasetPresenter >> showsColumnHeader: anObject [
	showsColumnHeader := anObject
]
