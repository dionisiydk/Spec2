accessing-selection
prepareEmphasisForTextDeletionFrom: start to: stop
	stop > start ifFalse: [ ^self ].
	
	"If deleting, then set emphasisHere from 1st character of the deletion"
	self editingState emphasisHere: ((self text attributesAt: start) select: [ :att | att mayBeExtended ])