initialization
createChildren
	super createChildren.
	optionSelection := optionPresenter addSelection: (SpManualSelection withStrategy: selectionStrategy)