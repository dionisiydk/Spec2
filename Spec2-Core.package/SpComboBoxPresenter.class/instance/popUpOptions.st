controlling
popUpOptions

	| selectorPresenter |
	selectorPresenter := SpSingleValueSelectorPresenter on: model options: optionsDataset.
	selectorPresenter buildIn: ui.
	
	ui openInVerticalPopup: selectorPresenter over: view with: [ :popupView |
		ui layout: selectorPresenter with: [ :layout |
			layout layoutChildView: popupView with: [ :c | 
				c horizontal exact: view width.
				c vertical fitContent ]].
		selectorPresenter whenModelChangedDo: [ popupView close ].
	]