styles-default
setUpInvalidStyle
	<styleSpec>
	<forStyle: #invalid>
	self setUpDefaultStyle.
	
	ui layout: self with: [ :layout | 
		layout add: (SpLabelPresenter iconic: #uncommentedClass) with: [ :c | ].
	]