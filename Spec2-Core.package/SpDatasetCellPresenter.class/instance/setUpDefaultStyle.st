styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout alignCenterLeft.
		layout padding: 2@2.
		
		model depth > 0 ifTrue: [ 
			layout addPanelWith: [ :c | 
				c margin: 3@0.
				c horizontal exact: model depth * 9.
				c vertical matchParent ] ].
		column isExpandable ifTrue: [ 
			model isExpandable
				ifTrue: [ 
					layout add: self createExpansionButton with: [ :c | 
						c margin: 3@0.
						c horizontal fitContent.
						c vertical fitContent]]
				ifFalse: [ 
					layout addPanelWith: [ :c | 
						c margin: 3@0.
						c horizontal exact: 9.
						c vertical matchParent ]]
		]. 
		
		layout add: contentPresenter with: [ :c | 
			c horizontal fitContent.
			c vertical fitContent]
	]