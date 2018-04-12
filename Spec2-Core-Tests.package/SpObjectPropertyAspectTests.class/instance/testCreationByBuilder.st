tests
testCreationByBuilder
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x build.
	
	self assert: aspect class equals: SpObjectPropertyAspect.
	self assert: aspect object equals: (2@3).
	self assert: aspect valueGetter selector equals: #x.
	self assert: aspect valueSetter equals: #x:.
	self assert: aspect name equals: #x.
	self assert: aspect isOptional equals: false.
	self assert: aspect stringConverter notNil