tests
testCreationByBuilderWithCustomName
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x; name: 'point x'; build.
	
	self assert: aspect name equals: 'point x'