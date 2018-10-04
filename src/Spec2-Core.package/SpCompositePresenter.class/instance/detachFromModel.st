initialization
detachFromModel
	"Here subclasses should unsubscribe from model events.
	But by default composite presenters do not need it 
	because they just prepare children presenters and layout them.
	Composite presenters do not subscribe to the model by default
	and therefore they do not need to unsubscribe.
	Simple presenters implement actual logic how to detach from the model"
	self detachChildrenFromModel