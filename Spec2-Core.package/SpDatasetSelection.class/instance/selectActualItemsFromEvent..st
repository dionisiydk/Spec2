attached model
selectActualItemsFromEvent: aValueChanged
	"We expect single value change when selection is single.
	And we expect list value change when selection is multiple. 
	In last case aValueChanged newValue should be collection"
	| newActualItems |
	newActualItems := isSingle 
		ifTrue: [ {aValueChanged newValue} ]
		ifFalse: [ aValueChanged newValue ].
		
	self selectItemsWith: newActualItems