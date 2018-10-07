Class {
	#name : #SpDatasetSelectionTests,
	#superclass : #TestCase,
	#instVars : [
		'selection',
		'dataset'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpDatasetSelectionTests >> setUp [
	super setUp.
	
	dataset := (SpSimpleDataSource on: #(1 2 3 4 5 6)) asSpecDataset.
	selection := SpDatasetSelection new.
	selection rootDataset: dataset.
	
]

{ #category : #tests }
SpDatasetSelectionTests >> testAddNewItem [
	
	selection selectItemsAt: #(1).
	
	selection addNewItem: (dataset itemAt: 3).
	
	self assert: selection size equals: 2.
	self assert: selection actualItems equals: { dataset actualItems first. dataset actualItems third }
]

{ #category : #tests }
SpDatasetSelectionTests >> testAddNewItemWhenItIsAlreadySelected [
	
	selection selectItemsAt: #(1).
	
	self should: [selection addNewItem: (dataset itemAt: 1)] raise: Error
]

{ #category : #tests }
SpDatasetSelectionTests >> testAnnouncingIndexUpdate [

	| event |
	selection whenIndexUpdatedSend: #value: to: [:ann | event := ann].
	
	selection indexWasUpdated.
	
	self assert: event class equals: SpSelectionIndexUpdated.
	self assert: event selection equals: selection.
	self assert: event currentIndexes equals: selection itemIndexes.
]

{ #category : #tests }
SpDatasetSelectionTests >> testAttachToDataset [
	
	| newDataset |
	newDataset := SpDataset new.
	
	selection attachToDataset: newDataset.
	
	self assert: selection rootDataset equals: newDataset
]

{ #category : #tests }
SpDatasetSelectionTests >> testBecomeMultiple [
	
	selection beSingle.
	selection beMultiple.
	
	self deny: selection isSingle
]

{ #category : #tests }
SpDatasetSelectionTests >> testBecomeSingle [
	
	selection beSingle.
	
	self assert: selection isSingle
]

{ #category : #tests }
SpDatasetSelectionTests >> testCollapseAtItemWhenEmptySelection [
	
	selection reset.
	
	selection collapseAtItem: (dataset itemAt: 3).
	
	self assert: selection size equals: 1.
	self assert: selection actualItems equals: #(3)
]

{ #category : #tests }
SpDatasetSelectionTests >> testCollapseAtItemWhichWasNotSelected [
	
	selection selectItemsWith: #(1).
	
	selection collapseAtItem: (dataset itemAt: 3).
	
	self assert: selection size equals: 1.
	self assert: selection actualItems equals: #(3)
]

{ #category : #tests }
SpDatasetSelectionTests >> testCollapseAtItemWhichWasOnlySelected [
	
	selection selectItemsWith: #(1).
	
	selection collapseAtItem: (dataset itemAt: 1).
	
	self assert: selection isEmpty
]

{ #category : #tests }
SpDatasetSelectionTests >> testCollapseAtItemWhichWasSelectedTogetherWithOtherItems [
	
	selection selectItemsWith: #(1 3).
	
	selection collapseAtItem: (dataset itemAt: 3).
	
	self assert: selection size equals: 1.
	self assert: selection actualItems equals: #(3)
]

{ #category : #tests }
SpDatasetSelectionTests >> testDeselectSingleItem [
	
	selection selectItemsAt: #(1 2).
	
	selection deselectItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 1.
	self assert: selection actualItems equals: { dataset actualItems first }
]

{ #category : #tests }
SpDatasetSelectionTests >> testEnsureSelectedItems [
	
	selection ensureSelectedItems: {dataset itemAt: 1. dataset itemAt: 3}.
	
	self assert: selection size equals: 2.
	self assert: selection actualItems equals: #(1 3)
]

{ #category : #tests }
SpDatasetSelectionTests >> testExpandUpToItemWhenEmptySelection [
	
	selection reset.
	
	selection expandUpToItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 1.
	self assert: selection actualItems equals: #(2)
]

{ #category : #tests }
SpDatasetSelectionTests >> testExpandUpToItemWhichIsAfterLastItem [
	
	selection selectItemsAt: #(1 3).
	
	selection expandUpToItem: (dataset itemAt: 5).
	
	self assert: selection size equals: 4.
	self assert: selection actualItems equals: #(1 3 4 5)
]

{ #category : #tests }
SpDatasetSelectionTests >> testExpandUpToItemWhichIsAlreadySelected [
	
	selection selectItemsAt: #(1 2 3 4).
	
	selection expandUpToItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 4.
	self assert: selection actualItems equals: #(1 4 3 2)
]

{ #category : #tests }
SpDatasetSelectionTests >> testExpandUpToItemWhichIsBeforeFirstItem [
	
	selection selectItemsAt: #(6 4).
	
	selection expandUpToItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 4.
	self assert: selection actualItems equals: #(6 4 3 2)
]

{ #category : #tests }
SpDatasetSelectionTests >> testGettingItemIndexes [
	
	selection selectItemsWith: { dataset actualItems first. dataset actualItems at: 3}.
	
	self assert: selection itemIndexes equals: #(1 3)
]

{ #category : #tests }
SpDatasetSelectionTests >> testHasAnnouncerByDefault [
	
	self assert: selection announcer notNil
]

{ #category : #tests }
SpDatasetSelectionTests >> testHasEmptyItemsByDefault [
	
	self assert: selection items equals: #()
]

{ #category : #tests }
SpDatasetSelectionTests >> testIncludesItem [
	
	selection selectItemsAt: #(1 2).
	
	self assert: (selection includesItem: selection items first).
	self assert: (selection includesItem: (dataset itemAt: 1)).
	self deny: (selection includesItem: (dataset itemAt: 3))
]

{ #category : #tests }
SpDatasetSelectionTests >> testIsEmpty [
	
	self assert: selection isEmpty.
	
	selection selectItemsWith: {dataset actualItems first}.
	
	self deny: selection isEmpty
]

{ #category : #tests }
SpDatasetSelectionTests >> testIsMultiple [
	
	selection beSingle.
	self deny: selection isMultiple.
	
	selection beMultiple.
	self assert: selection isMultiple.
	
]

{ #category : #tests }
SpDatasetSelectionTests >> testIsMultipleByDefault [
	
	self deny: selection isSingle
]

{ #category : #tests }
SpDatasetSelectionTests >> testIsSingle [
	
	selection beSingle.
	self assert: selection isSingle.
	
	selection beMultiple.
	self deny: selection isSingle.
	
]

{ #category : #tests }
SpDatasetSelectionTests >> testItemsExtendingContextOfLastItem [
	
	| selectedItems |
	selection selectItemsAt: #(1 2).
	
	selectedItems := selection itemsExtendingContextOf: (dataset itemAt: 2).
	
	self assert: selectedItems equals: selection items
]

{ #category : #tests }
SpDatasetSelectionTests >> testItemsExtendingContextOfSelectedItem [
	
	| selectedItems |
	selection selectItemsAt: #(1 2 3).
	
	selectedItems := selection itemsExtendingContextOf: (dataset itemAt: 2).
	
	self 
		assert: selectedItems 
		equals: {selection items first. selection items third. selection items second}
]

{ #category : #tests }
SpDatasetSelectionTests >> testLastItem [
	
	selection selectItemsAt: #(3 1).
	
	self assert: selection lastItem globalIndex equals: 1
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsShouldAnnounceChangesWhenSelectedItemWasRemoved [
	
	| executed |
	selection selectItemsWith: { dataset actualItems first. dataset actualItems third}.
	dataset dataSource actualItems: dataset actualItems allButFirst.
	
	selection whenChangedDo: [ executed := true ].
	selection refreshItems.
	
	self assert: executed
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsShouldAnnounceIndexChangeItemsWasReordered [
	
	| executed |
	executed := false.
	selection selectItemsAt: #(1 3).
	
	selection whenIndexUpdatedSend: #value to: [ executed := true ].
	
	selection selectItemsAt: #(3 1).	
	self assert: executed
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsShouldAnnounceIndexChangeWhenSelectedItemChangedIndex [
	
	| actualSelectedItems executed |
	executed := false.
	actualSelectedItems := {dataset actualItems first. dataset actualItems third}.
	selection selectItemsWith: actualSelectedItems.
	dataset dataSource actualItems: #(-100), dataset actualItems.
	
	selection whenIndexUpdatedSend: #value to: [ executed := true ].
	selection refreshItems.
	
	self assert: executed
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsShouldNotAnnounceAnyEventWhenNothingWasChanged [
	
	| thereWasEvent |
	thereWasEvent := false.
	selection selectItemsWith: { dataset actualItems first. dataset actualItems third }.
	selection announcer when: Announcement do: [ thereWasEvent := true ].
	
	selection refreshItems.
	
	self deny: thereWasEvent
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsShouldNotAnnounceIndexChangeWhenThereWasRemovedItemToo [
	
	| actualSelectedItems indexChangeAnnounced generalChangeAnnounced |
	indexChangeAnnounced := generalChangeAnnounced := false.
	actualSelectedItems := {dataset actualItems first. dataset actualItems third}.
	selection selectItemsWith: actualSelectedItems.
	dataset dataSource actualItems: #(-100), dataset actualItems allButFirst.
	
	selection whenIndexUpdatedSend: #value to: [ indexChangeAnnounced := true ].
	selection whenChangedDo: [ generalChangeAnnounced := true ].
	selection refreshItems.
	
	self deny: indexChangeAnnounced.
	self assert: generalChangeAnnounced
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsWhenNothingWasChangedInDataset [
	
	| beforeRefresh |
	selection selectItemsWith: { dataset actualItems first. dataset actualItems third }.
	beforeRefresh := selection items.
	
	selection refreshItems.
	
	self deny: selection items = beforeRefresh.
	self assert: selection actualItems equals: { dataset actualItems first. dataset actualItems third }
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsWhenSelectedItemChangedIndex [
	
	| actualSelectedItems |
	actualSelectedItems := {dataset actualItems first. dataset actualItems third}.
	selection selectItemsWith: actualSelectedItems.
	dataset dataSource actualItems: #(-100), dataset actualItems.
	
	selection refreshItems.
	
	self assert: selection items size equals: 2.
	self assert: selection actualItems equals: actualSelectedItems.
	self assert: selection items first dataSourceItem index equals: 2.
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsWhenSelectedItemWasRemoved [

	| actualSelectedItems |
	actualSelectedItems := {dataset actualItems first. dataset actualItems third}.	
	selection selectItemsWith: actualSelectedItems.
	dataset dataSource actualItems: dataset actualItems allButFirst.
	
	selection refreshItems.
	
	self assert: selection items size equals: 1.
	self assert: selection actualItems equals: actualSelectedItems allButFirst
]

{ #category : #tests }
SpDatasetSelectionTests >> testRefreshItemsWhenSelectedItemWasRemovedButSameItemExistsInParentDataset [

	| parentItem parentActualItems |
	parentActualItems := dataset actualItems.
	parentItem := dataset itemAt: 1.
	parentItem dataSourceItem defaultChildren: parentActualItems.
	parentItem expand.
	
	selection selectItemsAt: #(2).
	self assert: selection actualItems equals: { parentActualItems first }.
	
	parentItem childrenDataset dataSource actualItems: parentActualItems allButFirst.
	selection refreshItems.
	
	self assert: selection items isEmpty
]

{ #category : #tests }
SpDatasetSelectionTests >> testReset [
	
	selection selectItemsAt: #(1 2).
	
	selection reset.
	
	self assert: selection isEmpty
]

{ #category : #tests }
SpDatasetSelectionTests >> testSelectAllItems [
	
	selection selectAllItems.
	
	self assert: selection actualItems equals: dataset actualItems
]

{ #category : #tests }
SpDatasetSelectionTests >> testSelectingActualItems [
	
	| newSelectedItems |

	newSelectedItems := { dataset actualItems first. dataset actualItems last }.
	selection selectItemsWith: newSelectedItems.
	
	self assert: selection actualItems equals: newSelectedItems
]

{ #category : #tests }
SpDatasetSelectionTests >> testSelectingActualItemsShouldAnnounceValueChange [
	
	| change newItems |
	selection whenChangedDo: [ :ann | change := ann ].
	
	newItems := { dataset actualItems first }.
	selection selectItemsWith: newItems.
	
	self assert: change class equals: ValueChanged.
	self assert: change oldValue equals: #().
	self assert: (change newValue collect: #actualItem) equals: newItems.
]

{ #category : #tests }
SpDatasetSelectionTests >> testSelectingActualItemsWhenSomeAreMissing [
	
	| newSelectedItems |

	newSelectedItems := { dataset actualItems first. #missingItem }.
	selection selectItemsWith: newSelectedItems.
	
	self assert: selection actualItems equals: newSelectedItems allButLast
]

{ #category : #tests }
SpDatasetSelectionTests >> testSelectingActualItemsWhenTheyPartOfExpandedChildren [
	
	| expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a b c).
	expandedItem expand.
	
	selection selectItemsWith: #(b).
	
	self assert: selection actualItems equals: #(b).
	self assert: selection itemIndexes equals: #(3).
]

{ #category : #tests }
SpDatasetSelectionTests >> testSelectingItemsByIndex [
	
	| expectedItems |
	
	selection selectItemsAt: #(1 3).

	expectedItems := { dataset actualItems first. dataset actualItems third }.	
	self assert: selection actualItems equals: expectedItems
]

{ #category : #tests }
SpDatasetSelectionTests >> testSelectingItemsByIndexShouldAnnounceValueChange [
	
	| change |
	selection whenChangedDo: [ :ann | change := ann ].
	
	selection selectItemsAt: #(1).
	
	self assert: change class equals: ValueChanged.
	self assert: change oldValue equals: #().
	self assert: (change newValue collect: #actualItem) equals: {dataset actualItems at: 1}.
]

{ #category : #tests }
SpDatasetSelectionTests >> testSize [
	
	selection selectItemsAt: #(1 2).
	
	self assert: selection size equals: 2
]

{ #category : #tests }
SpDatasetSelectionTests >> testSynchronizesAttachedModelWhenChangedInMultipleMode [
	
	| actualModel newSelectedItem |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	selection attachToActualModel: actualModel.
	newSelectedItem := dataset actualItems first.
	selection selectItemsWith: {newSelectedItem}.
	
	self assert: actualModel value equals: {newSelectedItem}
]

{ #category : #tests }
SpDatasetSelectionTests >> testSynchronizesAttachedModelWhenChangedInSingleMode [
	
	| actualModel newSelectedItem |
	selection beSingle.
	
	actualModel := #test aspect itself asValueHolder.
	selection attachToActualModel: actualModel.
	newSelectedItem := dataset actualItems first.
	selection selectItemsWith: {newSelectedItem}.
	
	self assert: actualModel value equals: newSelectedItem
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemInActualModelWhenInSingleModeAndItIsCurrentValue [
	
	| actualModel |
	selection beSingle.
	
	actualModel := #test aspect itself asValueHolder.
	actualModel value: dataset actualItems second.

	selection selectItemsWith: {dataset actualItems second}.
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value isNil
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemInActualModelWhenInSingleModeAndItIsNotCurrentValue [
	
	| actualModel |
	selection beSingle.
	
	actualModel := #test aspect itself asValueHolder.

	selection selectItemsWith: {dataset actualItems second}.

	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: dataset actualItems second
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemWhenItIsNotSelected [
	
	selection selectItemsWith: #(1 3).
	
	selection toggleItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 3.
	self assert: selection actualItems equals: #(1 3 2)
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemWhenItIsSelected [
	
	selection selectItemsWith: #(1 2 3).
	
	selection toggleItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 2.
	self assert: selection actualItems equals: #(1 3)
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemsInActualModelWhenInMultiModeAndOnlyLastItemIsPartOfValue [
	
	| actualModel |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	actualModel value: (dataset actualItems first: 2).

	selection selectItemsAt: #(3 2).
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: {dataset actualItems first}
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemsInActualModelWhenInMultiModeAndSomeOfThemArePartOfValue [
	
	| actualModel |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	actualModel value: (dataset actualItems first: 2).

	selection selectItemsAt: #(1 3).
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: (#(2 1 3) collect: [:i | dataset actualItems at: i])
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemsInActualModelWhenInMultiModeAndTheyAreNotPartOfValue [
	
	| actualModel |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	actualModel value: { dataset actualItems second }.

	selection selectItemsAt: #(1 3).
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: {dataset actualItems second}, selection actualItems
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemsInActualModelWhenInMultiModeAndTheyArePartOfValue [
	
	| actualModel |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	actualModel value: (dataset actualItems first: 3).

	selection selectItemsAt: #(1 3).
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: {dataset actualItems second}
]

{ #category : #tests }
SpDatasetSelectionTests >> testToggleItemsInActualModelWhenNothingIsSelected [
	
	| actualModel |
	
	actualModel := #testValue aspect itself asValueHolder.

	selection reset.
	selection toggleItemsInActualModel: actualModel.
	
	self assert: actualModel value equals: #testValue
]

{ #category : #tests }
SpDatasetSelectionTests >> testUnsubscribingObservers [

	selection whenChangedSend: #value to: self.
	self assert: (selection hasSubscriber: self).
	
	selection unsubscribe: self.
	
	self deny: (selection hasSubscriber: self)
]

{ #category : #tests }
SpDatasetSelectionTests >> testUpdatesItemsWhenAttachedModelIsChangedInMultipleMode [
	
	| actualModel newSelectedItem |
	selection beMultiple.
	
	actualModel := #() aspect itself asValueHolder.
	selection attachToActualModel: actualModel.
	newSelectedItem := dataset actualItems first.
	actualModel value: { newSelectedItem }.
	
	self assert: selection actualItems equals: {newSelectedItem}
]

{ #category : #tests }
SpDatasetSelectionTests >> testUpdatesItemsWhenAttachedModelIsChangedInSingleMode [
	
	| actualModel newSelectedItem |
	selection beSingle.
	
	actualModel := #test aspect itself asValueHolder.
	selection attachToActualModel: actualModel.
	newSelectedItem := dataset actualItems first.
	actualModel value: newSelectedItem.
	
	self assert: selection actualItems equals: {newSelectedItem}
]

{ #category : #tests }
SpDatasetSelectionTests >> testUpdatesItemsWhenModelIsAttachedInMultipleMode [
	
	| actualModel selectedItem |
	selection beMultiple.
	selectedItem := dataset actualItems first.
	actualModel := {selectedItem} aspect itself asValueHolder.
	
	selection attachToActualModel: actualModel.
	
	self assert: selection actualItems equals: {selectedItem}
]

{ #category : #tests }
SpDatasetSelectionTests >> testUpdatesItemsWhenModelIsAttachedInSingleMode [
	
	| actualModel selectedItem |
	selection beSingle.
	selectedItem := dataset actualItems first.
	actualModel := selectedItem aspect itself asValueHolder.
	
	selection attachToActualModel: actualModel.
	
	self assert: selection actualItems equals: {selectedItem}
]
