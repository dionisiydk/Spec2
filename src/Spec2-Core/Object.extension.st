Extension { #name : #Object }

{ #category : #'*Spec2-Core' }
Object >> asDataItem [

	^SpDataItem of: self named: self asString
]

{ #category : #'*Spec2-Core' }
Object >> asSimpleAspect [
	^ SpSimpleValueAspect of: self
]

{ #category : #'*Spec2-Core' }
Object >> aspect [

	^SpValueAspectBuilder for: self
]

{ #category : #'*Spec2-Core' }
Object >> convertValueToStringBy: aValueToStringConverter [

	^aValueToStringConverter convertValueToString: self
]

{ #category : #'*Spec2-Core' }
Object >> createPropertyAspectFrom: aPropertyGetterObject [
	^SpObjectPropertyAspect of: self getter: aPropertyGetterObject
]

{ #category : #'*Spec2-Core' }
Object >> setUpDefaultAspectParameters: aValueAspect [
	aValueAspect 
		stringConverter: SpObjectToStringConverter default;
		inputPresenter: SpObjectPreviewPresenter new
]
