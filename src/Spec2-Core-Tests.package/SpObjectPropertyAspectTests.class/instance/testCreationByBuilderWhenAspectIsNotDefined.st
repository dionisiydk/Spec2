tests
testCreationByBuilderWhenAspectIsNotDefined
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	| aspectBuilder |

	aspectBuilder := (2@3) aspect.
	
	self should: [aspectBuilder build] raise: Error