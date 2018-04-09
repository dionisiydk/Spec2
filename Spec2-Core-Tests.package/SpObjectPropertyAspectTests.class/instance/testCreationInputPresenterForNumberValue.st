tests
testCreationInputPresenterForNumberValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| presenter |
	aspect := (2@3) aspect x build.
	
	presenter := aspect createInputPresenterFor: aspect asValueHolder.
	
	self assert: presenter class equals: SpTextInputPresenter.
	self assert: presenter inputRestriction equals: SpDecimalTextRestriction default.
	self assert: presenter textDecoration equals: SpSmartNumberDecoration default.
	self assert: presenter model class equals: SpValueHolder.
	self assert: presenter model aspect class equals: SpPrintedValueAspect.
	self assert: presenter model aspect actualValueHolder aspect equals: aspect