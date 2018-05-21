model creation
prepareExistanceModelOfItem: newItem in: aValueHolder
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