Extension { #name : #Boolean }

{ #category : #'*Spec2-Core' }
Boolean >> setUpDefaultAspectParameters: aValueAspect [
	aValueAspect 
		stringConverter: SpObjectToStringConverter default;
		restriction: (SpObjectRestriction baseClass: Boolean);
		inputPresenter: SpBooleanPresenter checkbox
]
