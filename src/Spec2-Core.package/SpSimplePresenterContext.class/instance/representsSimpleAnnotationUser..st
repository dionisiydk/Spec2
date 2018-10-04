testing
representsSimpleAnnotationUser: someUserClass

	^(super representsSimpleAnnotationUser: someUserClass)
		or: [tool isKindOf: someUserClass]