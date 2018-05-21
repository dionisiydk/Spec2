presenter building
annotateView: aMorph withPresenter: aPresenter
	"For debugging and inspection it is important to have information about presenter directly in views.
	Subclasses should put such reference and use it for tools"
	
	aMorph specPresenter: aPresenter