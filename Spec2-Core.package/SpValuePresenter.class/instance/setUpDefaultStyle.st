styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout addPanelWith: [ :panel | 
			panel horizontal fitContent.
			panel vertical fitContent.
			layout beFlow horizontal.
			layout add: namePresenter with: [ :c | c vertical fitContent].
			layout add: (SpLabelPresenter textual: ':') with: [ :c | c vertical fitContent]].
		layout add: valuePresenter with: [ :c | 
			c margin: 4@4.
			c vertical fitContent.
			c horizontal matchParent].		
		model isOptional ifFalse: [
			layout add: (SpLabelPresenter textual: '*') with: [ :c | c vertical fitContent]].
	]