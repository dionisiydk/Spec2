tests
testReadingValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := 'some string' aspect itself build.
	
	self assert: aspect readValue equals: 'some string'