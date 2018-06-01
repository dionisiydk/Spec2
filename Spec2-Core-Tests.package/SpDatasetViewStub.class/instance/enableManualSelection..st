controlling
enableManualSelection: aSelection 
	manualSelection := aSelection.
	selectedItemIndexes := manualSelection itemIndexes.
	"Normally view cache indexes of selected items.
	Presenter/View interaction logic should update them when data source is changed"
	manualSelection whenIndexUpdatedSend: #manualSelectionIndexUpdated: to: self.
	manualSelection whenChangedSend: #manualSelectionUpdated: to: self.