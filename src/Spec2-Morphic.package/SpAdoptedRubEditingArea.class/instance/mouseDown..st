event handling
mouseDown: evt
	"The default response is to let my eventHandler, if any, handle it."
	self eventHandler ifNotNil: [
		self eventHandler mouseDown: evt fromMorph: self.
		evt wasHandled ifTrue: [^self]].

	super mouseDown: evt