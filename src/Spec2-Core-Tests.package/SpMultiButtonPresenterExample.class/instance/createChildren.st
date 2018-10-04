initialization
createChildren
	
	buttonRed := SpCommandPresenter 
		buttonOn: [ self applyStyle: #redStyle ] named: 'Be red' iconName: #classIcon.
	buttonGreen := SpCommandPresenter 
		buttonOn: [ self applyStyle: #greenStyle ] named: 'Be green' iconName: #testGreenIcon