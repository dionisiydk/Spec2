accessing
defaultChildren: aDataItemChildrenOrConvertable
	| newChildren |
	newChildren := aDataItemChildrenOrConvertable asDataItemChildren.
	newChildren name: #default.
	
	self addChildren: newChildren