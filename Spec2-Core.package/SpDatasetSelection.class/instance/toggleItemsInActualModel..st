attached model
toggleItemsInActualModel: aValueHolder
	"We expect single value model when selection is single.
	And we expect list value model when selection is multiple"
	
	| actualItems |
	actualItems := self actualItems ifEmpty: [ ^self ].
	
	strategy toggleItems: actualItems inSelectionModel: aValueHolder