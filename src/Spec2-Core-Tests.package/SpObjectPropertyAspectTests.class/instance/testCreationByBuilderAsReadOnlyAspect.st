tests
testCreationByBuilderAsReadOnlyAspect
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := (2@3) aspect x readOnly build.
	
	self assert: aspect valueSetter equals: nil