Class {
	#name : #SpDatasetColumn,
	#superclass : #Object,
	#instVars : [
		'datasetPresenter',
		'width',
		'isExpandable'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpDatasetColumn class >> of: aDatasetPresenter [
	^self new 
		datasetPresenter: aDatasetPresenter 
]

{ #category : #accessing }
SpDatasetColumn >> acquireWidth: anOwnerWidth [
	^ self width min: anOwnerWidth
]

{ #category : #initialization }
SpDatasetColumn >> beExpandable [
	isExpandable := true
]

{ #category : #'building cells' }
SpDatasetColumn >> buildCellFor: aDatasetItem [
	| cell |
	cell := SpDatasetCellPresenter on: aDatasetItem column: self. 
	datasetPresenter buildChild: cell.
	^cell
]

{ #category : #'building cells' }
SpDatasetColumn >> buildHeader [
	self subclassResponsibility 
]

{ #category : #'building cells' }
SpDatasetColumn >> createCellPresenterFor: aDatasetItem [
	self subclassResponsibility 
]

{ #category : #commands }
SpDatasetColumn >> createCommandContextFor: aDatasetItem [ 
	^datasetPresenter createCommandContextFor: aDatasetItem 
]

{ #category : #accessing }
SpDatasetColumn >> datasetPresenter [
	^ datasetPresenter
]

{ #category : #accessing }
SpDatasetColumn >> datasetPresenter: anObject [
	datasetPresenter := anObject
]

{ #category : #accessing }
SpDatasetColumn >> defaultWidth [
	^0
]

{ #category : #initialization }
SpDatasetColumn >> initialize [
	super initialize.
	
	isExpandable := false
]

{ #category : #accessing }
SpDatasetColumn >> isExpandable [
	^ isExpandable
]

{ #category : #accessing }
SpDatasetColumn >> isExpandable: anObject [
	isExpandable := anObject
]

{ #category : #testing }
SpDatasetColumn >> wantsVisibleHeader [

	^datasetPresenter showsColumnHeader
]

{ #category : #accessing }
SpDatasetColumn >> width [
	^width ifNil: [ width := self defaultWidth ]
]

{ #category : #accessing }
SpDatasetColumn >> width: anInteger [
	width := anInteger
]
