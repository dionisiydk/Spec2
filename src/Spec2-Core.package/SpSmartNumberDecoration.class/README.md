I format given strings as numbers by splitting characters by thousand groups.
For splitting I use specified thousandsSeparator string which is space by default.

Try following examples
	
	SpSmartNumberDecoration new convertNativeTextToDecorated: '12000111'. " => 12 000 111"
	SpSmartNumberDecoration new convertDecoratedTextToNative: '12 000 111'. " => 12000111"
	
I do not convert numbers or analyze that characters are digits. I just separate them by group with 3 items. So following is also working:

	SpSmartNumberDecoration new convertNativeTextToDecorated: 'abcdf'. '"ab cdf"'

Also I take into account possible decimal separator: 

	SpSmartNumberDecoration new convertNativeTextToDecorated: '12000.12'. " => 12 000.12"
	SpSmartNumberDecoration new convertDecoratedTextToNative: '12 000.12'.	" => 12000.12"	 

Instance Variables
	thousandsSeparator:		<String>
