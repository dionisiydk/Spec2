Extension { #name : #String }

{ #category : #'*Spec2-Core' }
String >> setUpDefaultAspectParameters: aValueAspect [
	aValueAspect 
		restriction: SpAnyTextRestriction default;
		stringConverter: SpStringToStringConverter default;
		emptyValues: #(nil '');
		inputPresenter: SpTextInputPresenter new
]
