items convertion
convertItemsToSelectionModel: selectedItemsArray
	"Actual model of multiple selection is array value.
	So we just return selected items as is because it is actual selection model"
	^selectedItemsArray