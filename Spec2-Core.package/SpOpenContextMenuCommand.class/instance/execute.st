execution
execute
	
	| menu |
	menu := self createContextMenu.
	menu hasItems ifFalse: [^self].
	
	context openContextMenu: menu