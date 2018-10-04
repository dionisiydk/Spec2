tests
testCreationInputPresenterForNumberValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| presenter valueHolder |
	aspect := (2@3) aspect x build.
	valueHolder := aspect asValueHolder.
	presenter := aspect createInputPresenterFor: valueHolder.
	
	self assert: presenter class equals: SpTextInputPresenter.
	self assert: presenter inputRestriction equals: SpDecimalTextRestriction default.
	self assert: presenter textDecoration equals: SpSmartNumberDecoration default.
	self assert: presenter model class equals: SpPrintedValueHolder.
	self assert: presenter model stringConverter equals: aspect stringConverter.
	self assert: presenter model baseValueHolder equals: valueHolder