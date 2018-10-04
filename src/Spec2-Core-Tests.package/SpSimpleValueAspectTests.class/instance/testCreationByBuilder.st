tests
testCreationByBuilder
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := 'some string' aspect itself build.
	
	self assert: aspect class equals: SpSimpleValueAspect.
	self assert: aspect value equals: 'some string'.
	self assert: aspect name equals: 'noname'.
	self assert: aspect isOptional equals: false.
	self assert: aspect stringConverter notNil