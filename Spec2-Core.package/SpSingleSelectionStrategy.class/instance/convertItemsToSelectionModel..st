items convertion
convertItemsToSelectionModel: selectedItemsArray
	"Actual model of single selection is single value.
	So we return single item from given selection or nil if empty"
	^selectedItemsArray ifEmpty: [ nil ] ifNotEmpty: [selectedItemsArray last]