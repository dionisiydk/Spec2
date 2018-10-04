commands
createCommandContextForCursorAt: aPoint
	"Currently dataset view does not need to detect item at given point 
	because item contexts are managed by cell presenters.
	This method called only when event happens in empty space (out of items).
	But better implementation should not depends on this knowledge.
	It should detect item and column which belongs to aPoint. It is for todo"
	^itemContextClass for: self