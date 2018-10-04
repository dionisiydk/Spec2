"
I am used to avoid crappy rubric logic when handler of RubTextChanged or RubTextAccepted can't normally fail. Any error inside these event handlers are eaten by rubric decorattors which use MessageNotUnderstood trick (with exception handling) for delegation.
I am announced out of their logic. And therfore I allow any errors to be normally debugged
"
Class {
	#name : #SpTextMorphContentsAccepted,
	#superclass : #Announcement,
	#category : 'Spec2-Morphic-Views'
}
