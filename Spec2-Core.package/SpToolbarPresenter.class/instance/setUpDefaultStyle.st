styles-default
setUpDefaultStyle
	<styleSpec>
	
	| menu |
	menu := SpToolbarActivation buildMenuInContext: parent createCommandContext.
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		
		menu buildSpecToolbar: layout
	]