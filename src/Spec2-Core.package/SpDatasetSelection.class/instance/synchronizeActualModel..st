attached model
synchronizeActualModel: aValueHolder
	"We expect single value model when selection is single.
	And we expect list value model when selection is multiple"
	
	| newValue |
	newValue := strategy convertItemsToSelectionModel: self actualItems.

	aValueHolder value: newValue