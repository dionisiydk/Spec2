styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout alignCenterLeft.
		
		self isExpandable ifTrue: [ 
			layout add: self createExpansionButton with: [ :c | 
				c horizontal fitContent.
				c vertical fitContent
			]]. 
		
		layout add: contentPresenter with: [ :c | 
			c horizontal fitContent.
			c vertical fitContent]
	]