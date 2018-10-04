controlling
selectionUpdated: aValueChanged
	"Fast table manage selection in reversed order"
	selectedRowIndexes := aValueChanged newValue reversed collect: [ :each | each globalIndex ].
	self ensureVisibleFirstSelection.
	self refresh