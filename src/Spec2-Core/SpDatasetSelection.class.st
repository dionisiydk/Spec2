Class {
	#name : #SpDatasetSelection,
	#superclass : #Object,
	#instVars : [
		'strategy',
		'items',
		'rootDataset',
		'announcer',
		'indexCache'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpDatasetSelection class >> multiple [
	^self new 
		beMultiple
]

{ #category : #'instance creation' }
SpDatasetSelection class >> single [
	^self new 
		beSingle
]

{ #category : #'instance creation' }
SpDatasetSelection class >> withStrategy: aSelectionStrategy [
	^self new 
		strategy: aSelectionStrategy
]

{ #category : #accessing }
SpDatasetSelection >> actualItems [
	^items collect: [ :each | each actualItem ]
]

{ #category : #controlling }
SpDatasetSelection >> addNewItem: aDatasetItem [ 
	(indexCache includesKey: aDatasetItem globalIndex)
		ifTrue: [ self error: 'Item at ', aDatasetItem globalIndex asString, ' is already selected!' ].
		
	self setNewItems: (items copyWith: aDatasetItem)
]

{ #category : #private }
SpDatasetSelection >> analyzeAndAnnounceChangesOf: oldItems indexedWith: oldIndexCache [
	| newDatasetIndex indexChangeDetected |

	oldIndexCache size = items size ifFalse: [ ^self announceChangesOf: oldItems ].
	indexChangeDetected := false.
	oldIndexCache keysAndValuesDo: [ :oldDatasetIndex :oldItem | 
		newDatasetIndex := self datasetIndexOfItem: oldItem ifAbsent: [
			"removal item is detected"
			 ^self announceChangesOf: oldItems ]. 
		oldDatasetIndex = newDatasetIndex 
			ifFalse: [ indexChangeDetected := true ]
			ifTrue: [ "here we check if selected items were just reordered"
				(oldItems indexOf: oldItem) = (items indexOf: (indexCache at: newDatasetIndex))
					ifFalse: [ indexChangeDetected := true ] ]
	].
	indexChangeDetected ifTrue: [ self indexWasUpdated ].

]

{ #category : #private }
SpDatasetSelection >> announceChangesOf: oldItems [

	announcer announce: (ValueChanged oldValue: oldItems newValue: items)
]

{ #category : #accessing }
SpDatasetSelection >> announcer [
	^ announcer
]

{ #category : #'attached model' }
SpDatasetSelection >> attachToActualModel: aValueHolder [
	"This method establishes synchronous state 
	between selection and actual items from given aValueHolder.
	Selection items are instances of SpDatasetItem but given model represent actual objects. 
	So during synchronization selection passes internal actual items as value to given value holder"
	self beSynchronizedWithActualModel: aValueHolder.
	announcer 
		when: ValueChanged 
		do: [ self synchronizeActualModel: aValueHolder ] 
		for: aValueHolder.		
	aValueHolder whenChangedSend: #selectActualItemsFromEvent: to: self
]

{ #category : #initialization }
SpDatasetSelection >> attachToDataset: aDataset [

	rootDataset := aDataset
]

{ #category : #initialization }
SpDatasetSelection >> attachToView: aDatasetView [
	self subclassResponsibility 
]

{ #category : #initialization }
SpDatasetSelection >> beMultiple [
	strategy := SpMultipleSelectionStrategy new
]

{ #category : #initialization }
SpDatasetSelection >> beSingle [
	strategy := SpSingleSelectionStrategy new
]

{ #category : #'attached model' }
SpDatasetSelection >> beSynchronizedWithActualModel: aValueHolder [
	"We expect single value change when selection is single.
	And we expect list value change when selection is multiple"
	| newActualItems |
	
	newActualItems := strategy convertSelectionModelToItems: aValueHolder value.		
	self selectItemsWith: newActualItems
]

{ #category : #controlling }
SpDatasetSelection >> collapseAtItem: aDatasetItem [

	(self size = 1 and: [self includesItem: aDatasetItem])
		ifTrue: [ self reset ]
		ifFalse: [ self setNewItems: { aDatasetItem } ]
]

{ #category : #private }
SpDatasetSelection >> datasetIndexOfItem: aDatasetItem ifAbsent: absentBlock [

	indexCache keysAndValuesDo: [ :index :item |
		(item isEqualTo: aDatasetItem) ifTrue: [ ^index ]	 ].
		
	^absentBlock value
]

{ #category : #controlling }
SpDatasetSelection >> deselectItem: aDatasetItem [

	| selectedItem |
	selectedItem := indexCache at: aDatasetItem globalIndex.
	
	self setNewItems: (items copyWithout: selectedItem)
]

{ #category : #'attached model' }
SpDatasetSelection >> detachFromActualModel: aValueHolder [

	announcer unsubscribe: aValueHolder.		
	aValueHolder unsubscribe: self
]

{ #category : #controlling }
SpDatasetSelection >> ensureSelectedItems: datasetItems [

	(datasetItems allSatisfy: [ :each | self includesItem: each ]) ifTrue: [ ^self ].
	
	self setNewItems: datasetItems
]

{ #category : #controlling }
SpDatasetSelection >> expandUpToItem: aDatasetItem [
	| addedItems newRegion oldItems |
	self isEmpty ifTrue: [ ^self setNewItems: { aDatasetItem } ].
	
	newRegion := self lastItem globalIndex < aDatasetItem globalIndex
		ifTrue: [ self lastItem globalIndex + 1 to: aDatasetItem globalIndex ]
		ifFalse: [ self lastItem globalIndex - 1 to: aDatasetItem globalIndex by: -1 ].
		
	addedItems := newRegion collect: [:each | rootDataset itemAt: each].
	oldItems := items as: OrderedCollection.
	addedItems do: [ :each | 
		indexCache at: each globalIndex ifPresent: [ :existing | oldItems remove: existing ] ].
	self setNewItems: oldItems , addedItems
]

{ #category : #testing }
SpDatasetSelection >> extendsContextOf: aDatasetItem [
	"When users selects item in dataset which is part of selection 
	the selection can force context to include all selected items.
	By default selection does not affect contexts"
	^self providesItemsForContext and: [self includesItem: aDatasetItem]

]

{ #category : #testing }
SpDatasetSelection >> hasSubscriber: anObject [
	^announcer hasSubscriber: anObject
]

{ #category : #testing }
SpDatasetSelection >> includesItem: aDatasetItem [

	^indexCache includesKey: aDatasetItem globalIndex
]

{ #category : #private }
SpDatasetSelection >> indexWasUpdated [

	announcer announce: (SpSelectionIndexUpdated in: self)
]

{ #category : #initialization }
SpDatasetSelection >> initialize [
	super initialize.
	
	self beMultiple.
	items := #().
	indexCache := Dictionary new.
	announcer := Announcer new
]

{ #category : #testing }
SpDatasetSelection >> isEmpty [
	^items isEmpty
]

{ #category : #testing }
SpDatasetSelection >> isMultiple [
	^strategy isMultiple
]

{ #category : #testing }
SpDatasetSelection >> isSingle [
	^strategy isSingle
]

{ #category : #accessing }
SpDatasetSelection >> itemIndexes [
	^items collect: [ :each | each globalIndex ]
]

{ #category : #accessing }
SpDatasetSelection >> items [
	^ items
]

{ #category : #accessing }
SpDatasetSelection >> itemsExtendingContextOf: aDatasetItem [

	| existingItem reorderedItems |
	existingItem := indexCache at: aDatasetItem globalIndex.
	items last = existingItem ifTrue: [ ^items ].
	
	reorderedItems := items copy.
	reorderedItems at: (items indexOf: existingItem) put: items last.
	reorderedItems atLast: 1 put: existingItem.
	^reorderedItems
]

{ #category : #accessing }
SpDatasetSelection >> lastItem [
	^items last
]

{ #category : #testing }
SpDatasetSelection >> providesItemsForContext [
	"When users selects item in dataset which is part of selection 
	the selection can force context to include all selected items.
	By default selection does not affect contexts"
	^false
]

{ #category : #controlling }
SpDatasetSelection >> refreshItems [
	"It reloads actual items from their data sources.
	And it keeps current order of items (therefore dictionary logic for updatedItems)"
	| updatedItems groups liveItems newItems |
	updatedItems := Dictionary new.
	liveItems := items reject: [:each | each isRemoved ].
	groups := liveItems groupedBy: [ :each | each ownerDataset ].
	groups keysAndValuesDo: [ :dataset :localItems | 
		updatedItems addAll: (dataset refreshItems: localItems)].

	newItems := OrderedCollection new: items size.
	items do: [ :oldItem | updatedItems at: oldItem ifPresent: [ :new | newItems add: new] ].
	self setNewItems: newItems
]

{ #category : #controlling }
SpDatasetSelection >> reset [

	self setNewItems: #()
]

{ #category : #accessing }
SpDatasetSelection >> rootDataset [
	^ rootDataset
]

{ #category : #accessing }
SpDatasetSelection >> rootDataset: anObject [
	rootDataset := anObject
]

{ #category : #'attached model' }
SpDatasetSelection >> selectActualItemsFromEvent: aValueChanged [
	"We expect single value change when selection is single.
	And we expect list value change when selection is multiple. 
	In last case aValueChanged newValue should be collection"
	| newActualItems |
	newActualItems := strategy convertSelectionModelToItems: aValueChanged newValue.
		
	self selectItemsWith: newActualItems
]

{ #category : #controlling }
SpDatasetSelection >> selectAllItems [
	
	self selectItemsAt: (1 to: rootDataset itemCount)
]

{ #category : #controlling }
SpDatasetSelection >> selectItemsAt: indexes [ 
	
	| newItems |
	newItems := indexes collect: [:each | rootDataset itemAt: each].
	self setNewItems: newItems
]

{ #category : #controlling }
SpDatasetSelection >> selectItemsWith: actualItems [ 
	
	| newItems |
	newItems := rootDataset itemsWith: actualItems.
	self setNewItems: newItems
]

{ #category : #controlling }
SpDatasetSelection >> setNewItems: datasetItems [

	| oldIndex oldItems |
	oldIndex := indexCache.
	oldItems := items.
	items := datasetItems asArray.
	indexCache := Dictionary new: items size.
	items do: [ :each | indexCache at: each globalIndex put: each ].
	
	self analyzeAndAnnounceChangesOf: oldItems indexedWith: oldIndex
]

{ #category : #accessing }
SpDatasetSelection >> size [
	^items size
]

{ #category : #accessing }
SpDatasetSelection >> strategy [
	^ strategy
]

{ #category : #accessing }
SpDatasetSelection >> strategy: anObject [
	strategy := anObject
]

{ #category : #'attached model' }
SpDatasetSelection >> synchronizeActualModel: aValueHolder [
	"We expect single value model when selection is single.
	And we expect list value model when selection is multiple"
	
	| newValue |
	newValue := strategy convertItemsToSelectionModel: self actualItems.

	aValueHolder value: newValue
]

{ #category : #controlling }
SpDatasetSelection >> toggleItem: aDatasetItem [

	(self includesItem: aDatasetItem)
		ifTrue: [ self deselectItem: aDatasetItem ]
		ifFalse: [ self addNewItem: aDatasetItem ]
]

{ #category : #'attached model' }
SpDatasetSelection >> toggleItemsInActualModel: aValueHolder [
	"We expect single value model when selection is single.
	And we expect list value model when selection is multiple"
	
	| actualItems |
	actualItems := self actualItems ifEmpty: [ ^self ].
	
	strategy toggleItems: actualItems inSelectionModel: aValueHolder
]

{ #category : #'event subscription' }
SpDatasetSelection >> unsubscribe: anObject [
	announcer unsubscribe: anObject
]

{ #category : #'event subscription' }
SpDatasetSelection >> whenChangedDo: aBlock [
	announcer when: ValueChanged do: aBlock
]

{ #category : #'event subscription' }
SpDatasetSelection >> whenChangedSend: aSymbol to: aSubscriber [
	announcer when: ValueChanged send: aSymbol to: aSubscriber
]

{ #category : #'event subscription' }
SpDatasetSelection >> whenIndexUpdatedSend: aSymbol to: aSubscriber [

	announcer when: SpSelectionIndexUpdated send: aSymbol to: aSubscriber
]
