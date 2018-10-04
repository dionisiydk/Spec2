initialization
attachToView
	"Here subclasses should subscribe on view events and set view properties from the model.
	But by default composite presenters do not need it 
	because they just prepare children presenters and layout them.
	Simple presenters implement actual logic how to attach to the view"