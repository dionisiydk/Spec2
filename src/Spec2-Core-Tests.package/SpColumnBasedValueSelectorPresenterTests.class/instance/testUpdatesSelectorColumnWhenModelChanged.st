tests
testUpdatesSelectorColumnWhenModelChanged
	| datasetView row |
	datasetView := presenter optionPresenter view.
	row := datasetView builtRowViews at: 1.
	self assert: (row cellViewAt: 1) specPresenter contentPresenter model value.
		
	model value: optionDataset actualItems second.
			
	row := datasetView builtRowViews at: 1.
	self deny: (row cellViewAt: 1) specPresenter contentPresenter model value.
	row := datasetView builtRowViews at: 2.
	self assert: (row cellViewAt: 1) specPresenter contentPresenter model value.
