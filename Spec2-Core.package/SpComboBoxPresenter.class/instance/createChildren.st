initialization
createChildren

	valuePresenter := SpTextInputPresenter on: model.
	valuePresenter textDecoration: model valueAspect displayDecoration.
	
	optionsButton := SpCommandPresenter buttonOn: [ self popUpOptions ] named: '' icon: #arrowDown