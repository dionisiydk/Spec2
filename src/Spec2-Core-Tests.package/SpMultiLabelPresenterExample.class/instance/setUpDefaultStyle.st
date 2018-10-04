styles
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [:layout |
		layout beFlow vertical.
		
		layout add: label1 with: [:c |
			c horizontal matchParent.
			c vertical fitContent].
		
		layout add: label2 with: [:c |
			c horizontal matchParent.
			c vertical exact: 150].		
	]