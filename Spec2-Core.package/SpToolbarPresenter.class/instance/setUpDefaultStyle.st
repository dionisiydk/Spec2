styles-default
setUpDefaultStyle
	<styleSpec>
	
	| menu |
	menu := SpToolbarActivation buildMenuInContext: parent createCommandContext.
	menu buildSpecToolbar: self