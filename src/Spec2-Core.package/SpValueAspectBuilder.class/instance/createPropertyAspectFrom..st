building
createPropertyAspectFrom: aPropertyGetterObject

	aspect := object createPropertyAspectFrom: aPropertyGetterObject.
	aspect name: aPropertyGetterObject printAspectValueName