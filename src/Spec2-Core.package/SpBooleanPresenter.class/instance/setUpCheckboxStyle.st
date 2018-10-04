styles-default
setUpCheckboxStyle
	"No there is no icon for readonly mode. So we simply do not handle clicks.
	Notice that in CheckboxMorph implement disable state directly in drawOn method. Owful"
	<styleSpec>
	<forStyle: #checkbox>
	
	self setUpStyleWithTrueIcon: #checkboxSelected falseIcon: #checkboxUnselected