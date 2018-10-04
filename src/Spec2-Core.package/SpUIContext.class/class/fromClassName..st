instance creation
fromClassName: classString

	^self fromClass: (self environment classNamed: classString)