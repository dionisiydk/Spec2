tests
testCreationByBuilderWithCustomSetter
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x; valueSetter: #setX:; build.
	
	self assert: aspect valueSetter equals: #setX: