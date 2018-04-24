initialization
createChildren
	"My model is the main child presenter with information which user should submit.
	For standard ok/cancel buttons I use toolbar presenter 
	which will collect these commands for my context"
	
	title ifNil: [ title := SpLabelPresenter textual: 'Please confirm:' withStyle: #windowTitle].
	toolbar := SpToolbarPresenter new