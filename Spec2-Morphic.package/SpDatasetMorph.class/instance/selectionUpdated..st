controlling
selectionUpdated: aValueChanged

	selectedRowIndexes := aValueChanged newValue collect: [ :each | each index ].
	self ensureVisibleFirstSelection.
	self refresh