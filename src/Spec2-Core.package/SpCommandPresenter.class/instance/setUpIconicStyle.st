styles-button
setUpIconicStyle
	<styleSpec>
	<forStyle: #iconic>
	
	ui layout: self with: [ :layout |
		layout beFlow horizontal.
				
		layout add: (SpImagePresenter on: model menuItemIcon) with: [ :c | 
			c fitContent ]]