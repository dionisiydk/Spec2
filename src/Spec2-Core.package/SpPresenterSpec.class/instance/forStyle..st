contexts
forStyle: aSymbol
	"Use pragma <forStyle: #someStyle> in presenters
	to mark view and style specs to be only used for given style of presenter"
		
	self addContext: (SpPresenterStyleContext style: aSymbol)