Class {
	#name : #SpDatasetTests,
	#superclass : #TestCase,
	#instVars : [
		'dataset',
		'dataSource'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpDatasetTests >> setUp [
	super setUp.
	
	dataSource := SpSimpleDataSource on: #(1 2 3).
	dataset := SpDataset from: dataSource.
]

{ #category : #tests }
SpDatasetTests >> testAnnounceChangesWhenItemCollapsed [
	| executed item |
	executed := false.
	
	item := dataset itemAt: 1.
	item dataSourceItem defaultChildren: #(a s d).
	item expand.
	dataset whenChangedSend: #value to: [ 
		self deny: item isExpanded.
		executed := true ].
	
	item collapse.
	
	self assert: executed.
]

{ #category : #tests }
SpDatasetTests >> testAnnounceChangesWhenItemExpanded [
	| executed item |
	executed := false.
	dataset whenChangedSend: #value to: [ executed := true ].
	
	item := dataset itemAt: 1.
	item dataSourceItem defaultChildren: #(a s d).
	item expand.
	
	self assert: executed.
]

{ #category : #tests }
SpDatasetTests >> testChangesSubscription [
	| executed |
	executed := false.
	
	dataset whenChangedSend: #value to: [ executed := true ].
	
	dataset announceChanges.
	
	self assert: executed.
]

{ #category : #tests }
SpDatasetTests >> testConvertingToDataset [

	self assert: dataset asSpecDataset equals: dataset
]

{ #category : #tests }
SpDatasetTests >> testCreationFromArray [

	| array |
	array := #(1 2 3).
	
	dataset := array asSpecDataset.
	
	self assert: dataset class equals: SpDataset.
	self assert: dataset dataSource class equals: SpSimpleDataSource.
	self assert: dataset dataSource actualItems equals: array.
]

{ #category : #tests }
SpDatasetTests >> testCreationFromSet [

	| set |
	set := #(1 2 3) asSet.
	
	dataset := set asSpecDataset.
	
	self assert: dataset class equals: SpDataset.
	self assert: dataset dataSource class equals: SpSimpleDataSource.
	self assert: dataset dataSource actualItems equals: set asArray.
]

{ #category : #tests }
SpDatasetTests >> testFindActualItems [

	| actualItems foundItems |
	actualItems := {dataSource actualItems at: 1. dataSource actualItems at: 3}.
	foundItems := dataset itemsWith: actualItems.
	
	self assert: foundItems size equals: 2.
	
	foundItems do: [ :each | self assert: each class equals: SpDatasetItem].
	self assert: (foundItems collect: #actualItem) equals: actualItems
]

{ #category : #tests }
SpDatasetTests >> testFindActualItemsWhenSomeAreMissing [

	| actualItems foundItems |
	actualItems := {dataSource actualItems at: 1. #missingItem}.
	foundItems := dataset itemsWith: actualItems.
	
	self assert: foundItems size equals: 1.
	self assert: foundItems first class equals: SpDatasetItem.
	self assert: foundItems first actualItem equals: actualItems first.
]

{ #category : #tests }
SpDatasetTests >> testFindActualItemsWhenTheyBelongToExpandedChildren [

	| foundItems expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a s d).
	expandedItem expand.

	foundItems := dataset itemsWith: #(s).
	
	self assert: foundItems size equals: 1.
	self assert: foundItems first actualItem equals: #s
]

{ #category : #tests }
SpDatasetTests >> testGettingAllActualItems [

	| allItems |
	allItems := dataset actualItems.
	
	self assert: allItems equals: dataSource actualItems
]

{ #category : #tests }
SpDatasetTests >> testGettingAllItems [

	| allItems |
	allItems := dataset items.
	
	self assert: allItems size equals: dataSource itemCount.
	
	allItems withIndexDo: [ :each :i | 
		self assert: each class equals: SpDatasetItem.
		self assert: each actualItem equals: (dataSource actualItems at: i) ].
]

{ #category : #tests }
SpDatasetTests >> testGettingExpandedItemByIndexShouldBeAlwaysSameInstance [

	| item expandedItem |
	expandedItem := dataset itemAt: 2.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.

	item := dataset itemAt: 2.
	
	self assert: item == expandedItem
]

{ #category : #tests }
SpDatasetTests >> testGettingItemByIndex [

	| item |
	item := dataset itemAt: 2.
	
	self assert: item class equals: SpDatasetItem.
	self assert: item dataSourceItem class equals: SpDataItem.
	self assert: item actualItem equals: (dataSource actualItems at: 2).
	self assert: item ownerDataset equals: dataset
]

{ #category : #tests }
SpDatasetTests >> testGettingItemByIndexWhenItPointsToDeepExpandedItem [

	| item expandedItem child |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.

	child := dataset itemAt: 2.
	child dataSourceItem defaultChildren: #(7 8 9).
	child expand.	
	
	item := dataset itemAt: 3.
	self assert: item class equals: SpDatasetItem.
	self assert: item dataSourceItem class equals: SpDataItem.
	self assert: item actualItem equals: 7.
	self assert: item ownerDataset equals: child childrenDataset
]

{ #category : #tests }
SpDatasetTests >> testGettingItemByIndexWhenItPointsToExpandedItem [

	| item expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.

	item := dataset itemAt: 2.
	
	self assert: item class equals: SpDatasetItem.
	self assert: item dataSourceItem class equals: SpDataItem.
	self assert: item actualItem equals: 4.
	self assert: item ownerDataset equals: expandedItem childrenDataset
]

{ #category : #tests }
SpDatasetTests >> testGettingItemByIndexWhenThereIsExpandedItemBeforeIt [

	| item expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.

	item := dataset itemAt: 5.
	
	self assert: item class equals: SpDatasetItem.
	self assert: item dataSourceItem class equals: SpDataItem.
	self assert: item actualItem equals: (dataSource actualItems at: 2).
	self assert: item ownerDataset equals: dataset
]

{ #category : #tests }
SpDatasetTests >> testHasAnnouncerByDefault [

	self assert: dataset announcer class equals: Announcer
]

{ #category : #tests }
SpDatasetTests >> testHasEmptyExpandedItemsByDefault [

	self assert: dataset expandedItems isEmpty
]

{ #category : #tests }
SpDatasetTests >> testHasZeroDepthByDefault [

	self assert: dataset depth equals: 0
]

{ #category : #tests }
SpDatasetTests >> testIsExpandedWhenItIsRoot [

	self assert: dataset isRoot.
	self assert: dataset isExpanded
]

{ #category : #tests }
SpDatasetTests >> testIsExpandedWhenParentItemIsExpanded [

	| parentItem childrenDataset |
	parentItem := dataset itemAt: 1.
	parentItem dataSourceItem defaultChildren: #(a b c).
	
	parentItem expand.
	childrenDataset := parentItem childrenDataset.
	self assert: childrenDataset isExpanded.
	
	parentItem collapse.
	self deny: childrenDataset isExpanded
]

{ #category : #tests }
SpDatasetTests >> testIsNotDirtyByDefault [

	self deny: dataset isDirty 
]

{ #category : #tests }
SpDatasetTests >> testIsRoot [

	self assert: dataset isRoot.
	
	dataset parentItem: #parentItem.
	
	self deny: dataset isRoot
]

{ #category : #tests }
SpDatasetTests >> testItemCount [

	self assert: dataset itemCount equals: dataSource itemCount
]

{ #category : #tests }
SpDatasetTests >> testItemCountWhenSomeItemIsExpanded [

	| expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.
	
	self assert: dataset itemCount equals: dataSource itemCount + 3
]

{ #category : #tests }
SpDatasetTests >> testPropogatesChangesAnnouncementToParent [
	| executed item |
	executed := false.
	
	item := dataset itemAt: 1.
	item dataSourceItem defaultChildren: #(a s d).
	item expand.
	dataset whenChangedSend: #value to: [ executed := true ].
	
	item childrenDataset announceChanges.
	self assert: executed.
]

{ #category : #tests }
SpDatasetTests >> testSortsExpandedItemsByIndex [

	| item1 item2 |
	item1 := dataset itemAt: 1.
	item1 dataSourceItem defaultChildren: #(4 5).
	item2 := dataset itemAt: 2.
	item2 dataSourceItem defaultChildren: #(7 8).

	item2 expand.
	item1 expand.
	
	self assert: dataset expandedItems asArray equals: { item1. item2 }
]

{ #category : #tests }
SpDatasetTests >> testUnsubscribing [
	
	dataset whenChangedSend: #value to: self.
	self assert: (dataset hasSubscriber: self).
	
	dataset unsubscribe: self.
	
	self deny: (dataset hasSubscriber: self)
]
