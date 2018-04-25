running
setUp
	super setUp.
	
	ui := SpStubUI new.
	model := self defaultModel.
	presenter := self createPresenter.
	presenter buildIn: ui