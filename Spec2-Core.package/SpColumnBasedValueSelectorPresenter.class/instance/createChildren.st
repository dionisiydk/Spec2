initialization
createChildren
	super createChildren.
	
	optionsPresenter addFirstColumn: (SpValueSelectorColumn for: model strategy: selectingStrategy)