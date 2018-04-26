tests
testCreationByBuilderFromSomeObject
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3 corner: 10@30) aspect origin build.
	
	self assert: aspect restriction equals: SpAnyValueRestriction default.
	self assert: aspect stringConverter equals: SpObjectToStringConverter default.	
	self assert: aspect displayDecoration equals: SpNoTextDecoration default.
	self assert: aspect inputPresenter class equals: SpObjectPreviewPresenter