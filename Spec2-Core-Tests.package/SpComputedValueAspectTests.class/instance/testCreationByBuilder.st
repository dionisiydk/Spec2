tests
testCreationByBuilder
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| block |
	block := ['some computed value'].
	aspect := block aspect build.
	
	self assert: aspect class equals: SpComputedValueAspect.
	self assert: aspect block == block.
	self assert: aspect name equals: 'noname'.
	self assert: aspect isOptional equals: false.
	self assert: aspect stringConverter notNil