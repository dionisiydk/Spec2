events
simulate: anUIEventClass on: aView
	"For testing purpose subclasses should implement event simulation logic 
	which should correspond to event subscription #when:on:do:"
	
	self subclassResponsibility 