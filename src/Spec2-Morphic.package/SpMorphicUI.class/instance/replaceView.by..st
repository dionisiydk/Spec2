presenter building
replaceView: existingMorph by: newMorph
	
	newMorph 
		extent: existingMorph extent;
		position: existingMorph position;
		layoutPolicy: existingMorph layoutPolicy.
	existingMorph layoutFrame ifNotNil: [ 
		newMorph layoutFrame: existingMorph layoutFrame ].
	
	existingMorph owner replaceSubmorph: existingMorph by: newMorph.
	existingMorph becomeForward: newMorph 
	"Become is required to ensure that new morph will process upcoming UI events which correspond to old morph. For example mouseUp can be evaluated just after click. 
	It happens when presenter replaces view for new style just inside event procesing logic"