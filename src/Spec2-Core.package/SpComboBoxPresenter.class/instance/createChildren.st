initialization
createChildren

	valuePresenter := SpTextInputPresenter on: model.
	valuePresenter textDecoration: model valueAspect displayDecoration.
	
	optionButton := SpCommandPresenter buttonOn: [ self popUpOptions ] named: '' iconName: #arrowDown