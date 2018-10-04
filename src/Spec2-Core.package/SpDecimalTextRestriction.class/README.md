I match strings which represent decimal numbers with:

- decimalSeparators, a collection (string) of possible decimal separators
- decimalDigitsCount, max decimal digits which allowed for given string

By default I describe numbers eigher with dot or comma decimal separator and two decimal digits:

- 123
- 123.12

You can create my instances with desired decimal digits: 

	SpDecimalTextRestriction maxDecimalDigits: 3
	
Instance Variables
	decimalSeparators:		<String>
	decimalDigitsCount:		<Integer>