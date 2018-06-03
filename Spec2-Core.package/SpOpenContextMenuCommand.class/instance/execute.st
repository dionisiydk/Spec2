execution
execute
	
	| menu |
	menu := self createContextMenu.
	menu isEmpty ifTrue: [^self].
	
	context openContextMenu: menu