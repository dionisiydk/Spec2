building
createPropertyAspectFrom: aPropertyGetterObject

	aspect := SpObjectPropertyAspect of: object getter: aPropertyGetterObject.
	aspect name: aPropertyGetterObject printAspectValueName