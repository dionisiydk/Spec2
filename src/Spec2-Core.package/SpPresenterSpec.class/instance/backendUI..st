accessing
backendUI: anUserInterfaceClass
	"It adds special backend context 
	which marks view or style specs to be used only in given UI implementation.
	Concrete UI packages add helpful methods to be used as a pragma.
	For example Spec2-Morphic adds method #forMorphic 
	which is used in presenters to define morphic views:
		<forMorphic>"
		
	self addContext: (SpBackendContext fromClass: anUserInterfaceClass)