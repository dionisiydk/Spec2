model creation
prepareExistanceModelOfItem: newItem in: aListValueHolder
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