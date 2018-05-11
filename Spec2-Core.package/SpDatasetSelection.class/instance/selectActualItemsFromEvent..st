actual model syncronization
selectActualItemsFromEvent: aValueChanged
	"We expect single value change when selection is single.
	And we expect list value change when selection is multiple. 
	In last case aValueChanged newValue should be collection"
	| newActualItems newItems event |
	newActualItems := isSingle 
		ifTrue: [ {aValueChanged newValue} ]
		ifFalse: [ aValueChanged newValue ].
		
	newItems := rootDataset itemsWith: newActualItems.
	event := ValueChanged oldValue: items newValue: newItems.
	items := newItems.
	announcer announce: event