controlling
popUpOptions

	| selectorPresenter |
	selectorPresenter := SpSelectionBasedValueSelectorPresenter on: model options: optionDataset.
	selectorPresenter buildIn: ui.
	
	ui openInVerticalPopup: selectorPresenter over: view with: [ :popupView |
		ui layout: selectorPresenter with: [ :layout |
			layout layoutChildView: popupView with: [ :c | 
				c horizontal exact: view width.
				c vertical fitContent ]].
		selectorPresenter whenModelChangedDo: [ popupView close ].
	]