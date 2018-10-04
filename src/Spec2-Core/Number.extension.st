Extension { #name : #Number }

{ #category : #'*Spec2-Core' }
Number >> setUpDefaultAspectParameters: aValueAspect [
	aValueAspect 
		restriction: SpNumberRestriction default;
		stringConverter: SpNumberToStringConverter default;
		displayDecoration: SpSmartNumberDecoration default;
		inputPresenter: (SpTextInputPresenter 
			restriction: SpDecimalTextRestriction default
			decoration: SpSmartNumberDecoration default)
]
