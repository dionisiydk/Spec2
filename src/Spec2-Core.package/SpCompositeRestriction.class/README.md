My subclasses represent composition of two restrictions: option1 and option2.

Create my instances using following expression: 

	SpCompositeRestriction option1: aRestriction1 option2: aRestriction2.
	
Or use composition messages directly on restrictions:

	aRestriction and: aRestriction2.
	aRestriction or: aRestriction2
 
Internal Representation and Key Implementation Points.

    Instance Variables
	option1:		<SpValueRestriction>
	option2:		<SpValueRestriction>


    Implementation Points