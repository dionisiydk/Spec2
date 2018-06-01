event handling
manualSelectionUpdated: aValueChanged
	selectedItemIndexes := aValueChanged newValue collect: [ :each | each globalIndex ]