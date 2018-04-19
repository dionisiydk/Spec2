initialization
attachToModel
	"My model is a presenter with all details which should be confirmed by user.
	My toolbar is depends on the correcness of presented data. 
	So I subscribe on any model changes and update toolbar when it happens.
	It leads to the behaviour when ok button became disabled when data on form is invalid"
	super attachToModel.
	
	self whenModelChangedDo: [ toolbar rebuild ]