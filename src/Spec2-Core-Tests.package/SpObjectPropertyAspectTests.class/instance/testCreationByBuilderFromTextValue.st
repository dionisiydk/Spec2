tests
testCreationByBuilderFromTextValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := #('hello') aspect first build.

	self assert: aspect restriction equals: SpAnyTextRestriction default.
	self assert: aspect stringConverter equals: SpStringToStringConverter default.	
	self assert: aspect displayDecoration equals: SpNoTextDecoration default.
	self assert: aspect inputPresenter class equals: SpTextInputPresenter.
	self assert: aspect inputPresenter inputRestriction equals: SpAnyTextRestriction default.
	self assert: aspect inputPresenter textDecoration equals: SpNoTextDecoration default.
	self assert: aspect emptyValues equals: #(nil '')