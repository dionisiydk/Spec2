controlling
selectionUpdated: aValueChanged

	selectedRowIndexes := aValueChanged newValue reversed collect: [ :each | each globalIndex ].
	self ensureVisibleFirstSelection.
	self refresh