styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout |
		layout beFlow horizontal.
		layout add: valuePresenter with: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
		layout add: optionsButton with: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
	].

	ui when: SpMouseDown on: valuePresenter view do: [ self popUpOptions ].