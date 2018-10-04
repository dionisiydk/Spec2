Class {
	#name : #SpDatasetItemTests,
	#superclass : #TestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpDatasetItemTests >> testChildItemAtIndex [

	| item dataset childItem |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 10).
	item dataSourceItem defaultChildren: #(100 200 300).
	item expand.
	
	childItem := item childItemAt: 11.
	self assert: childItem class equals: SpDatasetItem.
	self assert: childItem dataSourceItem class equals: SpDataItem.
	self assert: childItem actualItem equals: 100.
	self assert: childItem ownerDataset equals: item childrenDataset
]

{ #category : #tests }
SpDatasetItemTests >> testChildItemsWhenNoChildrenExists [

	| item dataset found |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 10).
	
	found := item childItemsWith: #(200).
	self assert: found isEmpty

]

{ #category : #tests }
SpDatasetItemTests >> testChildItemsWithGivenActualObject [

	| item dataset childItem found |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 10).
	item dataSourceItem defaultChildren: #(100 200 300).
	item expand.
	
	found := item childItemsWith: #(200).
	self assert: found size equals: 1.
	childItem := found first.
	self assert: childItem class equals: SpDatasetItem.
	self assert: childItem dataSourceItem class equals: SpDataItem.
	self assert: childItem actualItem equals: 200.
	self assert: childItem ownerDataset equals: item childrenDataset
]

{ #category : #tests }
SpDatasetItemTests >> testChildrenCount [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).

	item expand.
		
	self assert: item childrenCount equals: 3
]

{ #category : #tests }
SpDatasetItemTests >> testChildrenCountWhenItTheyNotDefined [

	| item |
	item := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem named: 'some item').
	
	self assert: item childrenCount equals: 0
]

{ #category : #tests }
SpDatasetItemTests >> testChildrenCountWhenItTheyNotExpanded [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	
	self assert: item childrenCount equals: 0
]

{ #category : #tests }
SpDatasetItemTests >> testChildrenCountWhenSubChildrenIsExpandedToo [

	| item dataset expandedChild |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	item expand.
	
	expandedChild := item childrenDataset itemAt: 2.
	expandedChild dataSourceItem defaultChildren: #(4 5).
	expandedChild expand.
		
	self assert: item childrenCount equals: 5
]

{ #category : #tests }
SpDatasetItemTests >> testCollapse [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	item expand.

	item collapse.
	
	self deny: (dataset expandedItems includes: item).
	self assert: item childrenDataset isNil
]

{ #category : #tests }
SpDatasetItemTests >> testCollapseShouldCloseCollapsedDataset [

	| item dataset expandedDataSource |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: (SpChildrenForTest items: #(1 2 3)).
	item expand.
	expandedDataSource := item childrenDataset dataSource.
	
	item collapse.
	
	self assert: expandedDataSource wasClosed
]

{ #category : #tests }
SpDatasetItemTests >> testComparingWithAnotherItem [

	| item anotherItem |
	item := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem named: 'some item').
	
	self assert: (item isEqualTo: item).
	anotherItem := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem named: 'some item').
	self assert: (item isEqualTo: anotherItem).
	
	anotherItem := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem2 named: 'some item').
	self deny: (item isEqualTo: anotherItem).
]

{ #category : #tests }
SpDatasetItemTests >> testExpand [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	
	item expand.
	
	self assert: (dataset expandedItems includes: item).
	self assert: item childrenDataset class equals: SpDataset.
	self assert: item childrenDataset actualItems equals: #(1 2 3).
	self assert: item childrenDataset parentItem equals: item.
	self assert: item childrenDataset depth equals: 1
]

{ #category : #tests }
SpDatasetItemTests >> testExpandShouldOpenNewDataset [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: (SpChildrenForTest items: #(1 2 3)).
	
	item expand.
	
	self assert: item childrenDataset dataSource wasOpened
]

{ #category : #tests }
SpDatasetItemTests >> testGettingDataSourceIndex [

	| item dataItem |
	dataItem := SpDataItem of: #actualItem named: 'some item'.
	dataItem index: 40.
	
	item := SpDatasetItem of: #dataset item: dataItem.
	
	self assert: item dataSourceIndex equals: 40
]

{ #category : #tests }
SpDatasetItemTests >> testGettingDepth [

	| item dataset |
	dataset := SpDataset new.
	dataset depth: 100.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 2).	
	item dataSourceItem depth: 10.
	
	self assert: item depth equals: 110
]

{ #category : #tests }
SpDatasetItemTests >> testGettingGlobalIndex [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 2).
	
	self assert: item globalIndex equals: 2
]

{ #category : #tests }
SpDatasetItemTests >> testGettingGlobalIndexOfChildItem [

	| expandedItem child dataset |	
	dataset := SpDataset new.
	expandedItem := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 2).
	expandedItem dataSourceItem defaultChildren: #(1 2 3).
	expandedItem expand.

	child := expandedItem childrenDataset itemAt: 2.
	
	self assert: child actualItem equals: 2.
	self assert: child globalIndex equals: 4
]

{ #category : #tests }
SpDatasetItemTests >> testGettingGlobalIndexOfDeepChildItem [

	| expandedItem child deepChild dataset |
	dataset := SpDataset new.
	expandedItem := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 2).
	expandedItem dataSourceItem defaultChildren: #(1 2 3).
	expandedItem expand.
	
	child := expandedItem childrenDataset itemAt: 2.
	self assert: child actualItem equals: 2.
	child dataSourceItem defaultChildren: #(7 8 9).
	child expand.
	
	deepChild := child childrenDataset itemAt: 1.
	self assert: deepChild actualItem equals: 7.
	self assert: deepChild globalIndex equals: 5.
]

{ #category : #tests }
SpDatasetItemTests >> testGettingName [

	| item |
	item := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem named: 'some item').
	
	self assert: item name equals: 'some item'
]

{ #category : #tests }
SpDatasetItemTests >> testHasChildAtIndex [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 10).
	item dataSourceItem defaultChildren: #(1 2 3).
	item expand.
		
	self deny: (item hasChildAt: 2).
	self deny: (item hasChildAt: 10).
	self assert: (item hasChildAt: 11).
	self assert: (item hasChildAt: 13).
	self deny: (item hasChildAt: 14).
]

{ #category : #tests }
SpDatasetItemTests >> testHasChildAtIndexWhenItemIsNotExpanded [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').

	self deny: (item hasChildAt: #anyValue)
]

{ #category : #tests }
SpDatasetItemTests >> testIsExpandable [

	| item |
	item := SpDatasetItem of: #dataset item: 10 asDataItem.
	self deny: item isExpandable.
	
	item dataSourceItem defaultChildren: #().
	self deny: item isExpandable.
	
	item dataSourceItem defaultChildren: #(2).
	self assert: item isExpandable.
]

{ #category : #tests }
SpDatasetItemTests >> testIsExpanded [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	
	self deny: item isExpanded.
	item dataSourceItem defaultChildren: #(1 2 3).
	self deny: item isExpanded.
	
	item expand.
	self assert: item isExpanded.
	
	item collapse.
	self deny: item isExpanded.
	
]

{ #category : #tests }
SpDatasetItemTests >> testIsRemovedWhenParentWasCollapsed [

	| dataset parentItem childItem |
	dataset := SpDataset new.
	parentItem := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	parentItem dataSourceItem defaultChildren: #(1 2 3).	
	parentItem expand.
	
	childItem := parentItem childrenDataset itemAt: 2.
	self assert: childItem actualItem equals: 2.
	self deny: childItem isRemoved.

	parentItem collapse.
	self assert: childItem isRemoved.
]

{ #category : #tests }
SpDatasetItemTests >> testToggleExpansion [

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	
	item toggleExpansion.
	self assert: (dataset expandedItems includes: item).
	item toggleExpansion.
	self deny: (dataset expandedItems includes: item).
]
