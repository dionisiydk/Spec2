initialization
createChildren
	super createChildren.
	
	optionPresenter addFirstColumn: (SpValueSelectorColumn for: model strategy: selectionStrategy)