controlling
selectionIndexUpdated: aSelectionIndexUpdate
	"Fast table manage selection in reversed order"
	selectedRowIndexes := aSelectionIndexUpdate currentIndexes reversed.
	self refresh