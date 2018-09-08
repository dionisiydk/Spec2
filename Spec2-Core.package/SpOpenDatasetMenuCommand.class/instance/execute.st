execution
execute
	
	| menu |
	menu := self createContextMenu.
	menu isEmpty ifTrue: [^self].
	
	datasetPresenter openContextMenu: menu