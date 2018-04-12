tests
testWritingValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := 'some string' aspect itself build.
	
	aspect writeValue: 'new value'.
	
	self assert: aspect readValue equals: 'new value'