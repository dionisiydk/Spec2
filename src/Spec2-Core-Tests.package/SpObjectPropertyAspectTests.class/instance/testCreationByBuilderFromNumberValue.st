tests
testCreationByBuilderFromNumberValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x build.
	
	self assert: aspect restriction equals: SpNumberRestriction default.
	self assert: aspect stringConverter equals: SpNumberToStringConverter default.	
	self assert: aspect displayDecoration equals: SpSmartNumberDecoration default.
	self assert: aspect inputPresenter class equals: SpTextInputPresenter.
	self assert: aspect inputPresenter inputRestriction equals: SpDecimalTextRestriction default.
	self assert: aspect inputPresenter textDecoration equals: SpSmartNumberDecoration default.