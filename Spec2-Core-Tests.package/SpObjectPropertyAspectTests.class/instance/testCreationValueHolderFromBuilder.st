tests
testCreationValueHolderFromBuilder
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| actual aspectBuilder |
	aspectBuilder := (2@3) aspect x.
	
	actual := aspectBuilder asValueHolder.
	
	self assert: actual class equals: SpValueHolder.
	self assert: actual valueAspect equals: aspectBuilder build.
	self assert: actual value equals: 2