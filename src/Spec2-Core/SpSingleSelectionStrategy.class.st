Class {
	#name : #SpSingleSelectionStrategy,
	#superclass : #SpSelectionStrategy,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'items convertion' }
SpSingleSelectionStrategy >> convertItemsToSelectionModel: selectedItemsArray [
	"Actual model of single selection is single value.
	So we return single item from given selection or nil if empty"
	^selectedItemsArray ifEmpty: [ nil ] ifNotEmpty: [selectedItemsArray last]
]

{ #category : #'items convertion' }
SpSingleSelectionStrategy >> convertSelectionModelToItems: anObject [
	"Actual model of single selection is single value.
	So we convert it to one item array"
	^{anObject value}
]

{ #category : #testing }
SpSingleSelectionStrategy >> isSingle [
	^true
]

{ #category : #'model creation' }
SpSingleSelectionStrategy >> prepareExistenceModelOfItem: newItem in: aValueHolder [
	"Actual model of single selection is single value.
	We should return boolean model which gives true when newItem equals to given aValueHolder.
	The returned model should assign newItem to aValueHolder when it receives true as new value.
	And it should reset value of aValueHolder to nil when it receives false as new value"
	^aValueHolder aspect 
		computedBy: [ :existingItem | existingItem = newItem ];
		valueSetter: [:existingItem :bool | | newValue |
			newValue := bool ifTrue: [ newItem ] ifFalse: [ nil ].
			aValueHolder value: newValue];
		autoAcceptValues;
		inputPresenter: SpBooleanPresenter radioButton;
		asValueHolder
]

{ #category : #operations }
SpSingleSelectionStrategy >> toggleItems: singleItemArray inSelectionModel: aValueHolder [
	"For this strategy given items should include single element.
	And this method will set it as given model value or reset existing value to nil"
	
	| newValue |
	newValue := aValueHolder value = singleItemArray first 
		ifTrue: [ nil ]
		ifFalse: [ singleItemArray first ].
	aValueHolder value: newValue
]
