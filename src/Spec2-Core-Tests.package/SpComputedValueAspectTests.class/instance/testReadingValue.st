tests
testReadingValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := [1 + 3] aspect build.
	
	self assert: aspect readValue equals: 4