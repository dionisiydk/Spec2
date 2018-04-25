tests
testCreationByBuilderFromBooleanValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := true aspect itself build.
	
	self assert: aspect restriction equals: (SpObjectRestriction baseClass: Boolean).
	self assert: aspect stringConverter equals: SpObjectToStringConverter default.	
	self assert: aspect displayDecoration equals: SpNoTextDecoration default.
	self assert: aspect inputPresenter class equals: SpBooleanPresenter.
	self assert: aspect inputPresenter mainStyle equals: #checkbox