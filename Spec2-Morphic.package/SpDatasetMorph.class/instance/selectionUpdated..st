controlling
selectionUpdated: aValueChanged

	selectedRowIndexes := aValueChanged newValue collect: [ :each | each globalIndex ].
	self ensureVisibleFirstSelection.
	self refresh