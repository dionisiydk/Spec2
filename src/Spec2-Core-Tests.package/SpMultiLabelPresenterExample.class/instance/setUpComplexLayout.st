styles
setUpComplexLayout
	<styleSpec>
	<forStyle: #complexLayout>
	
	ui layout: self with: [:layout |
		layout beFlow vertical.
		
		layout addPanelWith: [ :p | 
			layout beFlow horizontal.
			p horizontal matchParent.
			p vertical fitContent.
			
			layout add: label1 with: [:c |
				c horizontal matchParent.
				c vertical fitContent]].
		layout addPanelWith: [ :p | 
			layout beFlow horizontal.
			p horizontal matchParent.
			p vertical fitContent.
			layout add: label2 with: [:c |
				c horizontal matchParent.
				c vertical exact: 150]].		
	]