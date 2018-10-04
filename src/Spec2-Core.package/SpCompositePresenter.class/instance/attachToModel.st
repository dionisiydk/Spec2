initialization
attachToModel
	"Here subclasses should subscribe on model events.
	But by default composite presenters do not need it 
	because they just prepare children presenters and layout them.
	Simple presenters implement actual logic how to attach to the model"