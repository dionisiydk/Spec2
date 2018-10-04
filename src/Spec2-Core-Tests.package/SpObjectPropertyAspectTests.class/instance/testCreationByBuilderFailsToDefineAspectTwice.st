tests
testCreationByBuilderFailsToDefineAspectTwice
	"#aspect message gives builder instance which is waiting aspect definition using DNU logic.
	And as soon as aspect is define by simple message the builder disable DNU trick.
	So it understand any message as objecet property only at first time"
	
	| aspectBuilder |

	aspectBuilder := (2@3) aspect x.
	
	self should: [aspectBuilder x] raise: MessageNotUnderstood