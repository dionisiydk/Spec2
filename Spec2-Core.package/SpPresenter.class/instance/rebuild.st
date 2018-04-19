controlling
rebuild

	| currentView |
	currentView := view.
	self buildView.
	ui replaceView: currentView by: view