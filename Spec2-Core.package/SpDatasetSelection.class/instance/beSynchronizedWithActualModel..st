attached model
beSynchronizedWithActualModel: aValueHolder
	"We expect single value change when selection is single.
	And we expect list value change when selection is multiple"
	| newActualItems |
	
	newActualItems := strategy convertSelectionModelToItems: aValueHolder value.		
	self selectItemsWith: newActualItems