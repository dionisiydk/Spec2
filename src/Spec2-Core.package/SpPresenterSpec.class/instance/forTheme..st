contexts
forTheme: themeClassName
	"Use pragma <forTheme: #ThemeClass> in presenters
	to mark view or style specs to be only used for concrete UI theme.
	For example for PharoLightTheme it would be:
		<forTheme: #PharoLightTheme>
	"
	self addContext: (SpThemeContext fromClassName: themeClassName)