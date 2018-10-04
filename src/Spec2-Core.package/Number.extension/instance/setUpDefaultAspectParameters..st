*Spec2-Core
setUpDefaultAspectParameters: aValueAspect
	aValueAspect 
		restriction: SpNumberRestriction default;
		stringConverter: SpNumberToStringConverter default;
		displayDecoration: SpSmartNumberDecoration default;
		inputPresenter: (SpTextInputPresenter 
			restriction: SpDecimalTextRestriction default
			decoration: SpSmartNumberDecoration default)