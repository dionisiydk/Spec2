Class {
	#name : #SpMultipleSelectionStrategy,
	#superclass : #SpSelectionStrategy,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'items convertion' }
SpMultipleSelectionStrategy >> convertItemsToSelectionModel: selectedItemsArray [
	"Actual model of multiple selection is array value.
	So we just return selected items as is because it is actual selection model"
	^selectedItemsArray
]

{ #category : #'items convertion' }
SpMultipleSelectionStrategy >> convertSelectionModelToItems: anArray [
	"Actual model of multiple selection is array value.
	So we expect array here and return it"
	^anArray
]

{ #category : #testing }
SpMultipleSelectionStrategy >> isSingle [
	^false
]

{ #category : #'model creation' }
SpMultipleSelectionStrategy >> prepareExistenceModelOfItem: newItem in: aListValueHolder [
	"Actual model of multiple selection is array.
	We should return boolean model which gives true 
	when newItem is contained by given aListValueHolder.
	The returned model should add newItem to existing items of aListValueHolder 
	when it receives true as new value.
	And it should remove newItem from existing items of aListValueHolder 
	when it receives false as new value"
	^aListValueHolder aspect 
		computedBy: [ :existingItems | existingItems includes: newItem ];
		valueSetter: [:existingItems :bool | | newItems |
			newItems := bool 
				ifTrue: [ existingItems copyWith: newItem ] 
				ifFalse: [ existingItems copyWithout: newItem  ].
			aListValueHolder value: newItems];
		autoAcceptValues;
		inputPresenter: SpBooleanPresenter checkbox;
		asValueHolder
]

{ #category : #operations }
SpMultipleSelectionStrategy >> toggleItems: selectedItemArray inSelectionModel: aListValueHolder [
	"For this strategy given model should be list value.
	And this method will add or remove given selected items from it"
	
	| newValue itemsToKeep |
	itemsToKeep := aListValueHolder value copyWithoutAll: selectedItemArray.
	newValue := (aListValueHolder value includes: selectedItemArray last)
		ifTrue: [ itemsToKeep ]
		ifFalse: [ itemsToKeep , selectedItemArray ].
		
	aListValueHolder value: newValue
]
