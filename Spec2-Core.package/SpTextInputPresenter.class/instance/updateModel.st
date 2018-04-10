updating
updateModel

	| nativeString |
	nativeString := textDecoration convertDecoratedTextToNative: view contents asString.
	
	model value: nativeString