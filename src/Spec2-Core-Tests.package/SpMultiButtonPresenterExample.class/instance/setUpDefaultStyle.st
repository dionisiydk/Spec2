styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout |
		layout beFlow vertical.
		layout alignCenter.
		
		layout add: buttonRed with: [ :c | 
			c horizontal exact: 100.
			c vertical fitContent].
		layout add: buttonGreen with: [ :c | 
			c horizontal exact: 100.
			c vertical fitContent ]
	]