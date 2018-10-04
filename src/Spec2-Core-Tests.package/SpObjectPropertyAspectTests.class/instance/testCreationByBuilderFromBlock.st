tests
testCreationByBuilderFromBlock
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| block |
	block := [:o | o x ].
	aspect := (2@3) aspect computedBy: block; build.
	
	self assert: aspect class equals: SpObjectPropertyAspect.
	self assert: aspect valueGetter equals: block.
	self assert: aspect name equals: 'noname'