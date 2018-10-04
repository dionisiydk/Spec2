*Spec2-Core
setUpDefaultAspectParameters: aValueAspect
	aValueAspect 
		restriction: SpAnyTextRestriction default;
		stringConverter: SpStringToStringConverter default;
		emptyValues: #(nil '');
		inputPresenter: SpTextInputPresenter new