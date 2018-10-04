contexts
forParent: parentPresenterClassName
	"Use pragma <forParent: #PresenterClass> in presenters
	to mark view and style specs to be only used 
	when presenter is created as a child inside given presenter class"
	
	self addContext: (SpParentPresenterContext fromClassName: parentPresenterClassName)