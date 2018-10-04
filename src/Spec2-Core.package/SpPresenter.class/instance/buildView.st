initialization
buildView
	ui setUpViewFor: self.
	ui annotateView: view withPresenter: self.
	self attachToView.