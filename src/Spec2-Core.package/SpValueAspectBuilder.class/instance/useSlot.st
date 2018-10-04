aspect definitions
useSlot
	"Method affects the getter of aspect. 
	We override it to avoid default parameters initialization 
	because value is used for this and it can be only accessing by slot (no getter selector exists)"
	aspect useSlot