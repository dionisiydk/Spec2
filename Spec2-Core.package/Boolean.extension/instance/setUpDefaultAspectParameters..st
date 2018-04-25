*Spec2-Core
setUpDefaultAspectParameters: aValueAspect
	aValueAspect 
		stringConverter: SpObjectToStringConverter default;
		restriction: (SpObjectRestriction baseClass: Boolean);
		inputPresenter: SpBooleanPresenter checkbox