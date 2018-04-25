styles-default
setUpRadioButtonStyle
	"No there is no icon for readonly mode. So we simply do not handle clicks.
	Notice that in CheckboxMorph implement disable state directly in drawOn method. Owful"
	<styleSpec>
	<forStyle: #radioButton>
	
	self setUpStyleWithTrueIcon: #radioButtonSelected falseIcon: #radioButtonUnselected