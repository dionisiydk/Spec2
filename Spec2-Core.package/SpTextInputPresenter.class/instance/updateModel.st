updating
updateModel

	| nativeString |
	nativeString := textDecoration convertDecoratedTextToNative: view contents asString.
	
	self detachFromModel.
	[model value: nativeString] ensure: [ self attachToModel ]