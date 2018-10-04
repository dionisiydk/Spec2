Class {
	#name : #SpDataset,
	#superclass : #Object,
	#instVars : [
		'dataSource',
		'parentItem',
		'depth',
		'expandedItems',
		'dirty',
		'announcer'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpDataset class >> from: aDataSource [
	^self new 
		dataSource: aDataSource
]

{ #category : #queries }
SpDataset >> actualItems [
	^self items collect: [ :each | each actualItem ]
]

{ #category : #controlling }
SpDataset >> announceChanges [
	announcer announce: ValueChanged.
	parentItem ifNotNil: [ parentItem propogateChildrenChanges ]
]

{ #category : #accessing }
SpDataset >> announcer [
	^ announcer
]

{ #category : #converting }
SpDataset >> asSpecDataset [
	^self
]

{ #category : #controlling }
SpDataset >> close [

	dataSource close
]

{ #category : #converting }
SpDataset >> convertToGlobalIndex: dataSourceIndex [

	| result |
	result := parentItem ifNil: [ 0 ] ifNotNil: [ parentItem globalIndex ].
	expandedItems do: [ :each | 
		(each dataSourceIndex >= dataSourceIndex) ifTrue: [
			^result + dataSourceIndex].
		result := result + each childrenCount].
	
	^result + dataSourceIndex
]

{ #category : #accessing }
SpDataset >> dataSource [
	^ dataSource
]

{ #category : #accessing }
SpDataset >> dataSource: anObject [
	dataSource := anObject
]

{ #category : #accessing }
SpDataset >> depth [
	^ depth
]

{ #category : #accessing }
SpDataset >> depth: anObject [
	depth := anObject
]

{ #category : #accessing }
SpDataset >> dirty [
	^ dirty
]

{ #category : #accessing }
SpDataset >> dirty: anObject [
	dirty := anObject
]

{ #category : #accessing }
SpDataset >> expandedItems [
	^ expandedItems
]

{ #category : #accessing }
SpDataset >> expandedItems: anObject [
	expandedItems := anObject
]

{ #category : #testing }
SpDataset >> hasSubscriber: aSubscriber [ 
	^announcer hasSubscriber: aSubscriber
]

{ #category : #initialization }
SpDataset >> initialize [
	super initialize.
	
	depth := 0.
	expandedItems := SortedCollection sortBlock: #dataSourceIndex ascending.
	dirty := false.
	announcer := Announcer new
]

{ #category : #testing }
SpDataset >> isDirty [
	^dirty
]

{ #category : #testing }
SpDataset >> isExpanded [
	^self isRoot 
		ifTrue: [ true ]
		ifFalse: [ parentItem isExpanded ]
]

{ #category : #testing }
SpDataset >> isRoot [
	^parentItem isNil
]

{ #category : #queries }
SpDataset >> itemAt: indexInDataset [
	| dataItem localIndex |
	localIndex := indexInDataset.	

	expandedItems do: [:each | 
		each dataSourceIndex = localIndex ifTrue: [ ^each ].
		(each hasChildAt: localIndex) ifTrue: [
			^each childItemAt: localIndex].
		(each dataSourceIndex > localIndex) ifTrue: [
			dataItem := dataSource itemAt: localIndex.
			^SpDatasetItem of: self item: dataItem ].
		localIndex := localIndex - each childrenCount.
	].

	dataItem := dataSource itemAt: localIndex.
	^SpDatasetItem of: self item: dataItem 
	
]

{ #category : #queries }
SpDataset >> itemCount [
	^dataSource itemCount
		+ (expandedItems detectSum: [ :each | each childrenCount ])
]

{ #category : #controlling }
SpDataset >> itemWasCollapsed: aDatasetItem [ 
	expandedItems remove: aDatasetItem.
	
	self announceChanges
]

{ #category : #controlling }
SpDataset >> itemWasExpanded: aDatasetItem [ 
	expandedItems add: aDatasetItem.
	
	self announceChanges
]

{ #category : #queries }
SpDataset >> items [
	^(1 to: self itemCount) collect: [ :i | self itemAt: i ]
]

{ #category : #queries }
SpDataset >> itemsWith: actualObjects [ 
	| myItems childItems |
	myItems := self localItemsWith: actualObjects.
		
	myItems size == actualObjects size ifTrue: [ ^myItems ].
	
	childItems := expandedItems flatCollect: [ :each | each childItemsWith: actualObjects].
	
	^myItems, childItems
]

{ #category : #queries }
SpDataset >> localItemsWith: actualObjects [ 
	^(dataSource itemsWith: actualObjects)
		select: [ :each | each notNil ] "missing items are returned as nil"
		thenCollect: [ :each | SpDatasetItem of: self item: each ]
]

{ #category : #controlling }
SpDataset >> open [
	dataSource open
]

{ #category : #accessing }
SpDataset >> parentItem [
	^ parentItem
]

{ #category : #accessing }
SpDataset >> parentItem: anObject [
	parentItem := anObject
]

{ #category : #controlling }
SpDataset >> refreshItems: datasetItems [
	"It reloads actual items from data source
	and returns result as dictionary of oldItem->updatedItem (removed items are not returned)"
	| result actualItems updatedItems |
	result := Dictionary new.
	actualItems := datasetItems collect: [ :each | each actualItem ].
	updatedItems := dataSource itemsWith: actualItems.
	datasetItems with: updatedItems do: [ :oldItem :newItem | 
		newItem ifNotNil: [
			result at: oldItem put: (SpDatasetItem of: self item: newItem)]].
	^result
]

{ #category : #'event subscription' }
SpDataset >> unsubscribe: aSubscriber [

	announcer unsubscribe: aSubscriber
]

{ #category : #'event subscription' }
SpDataset >> whenChangedSend: aSymbol to: aSubscriber [ 

	announcer when: ValueChanged send: aSymbol to: aSubscriber
]
