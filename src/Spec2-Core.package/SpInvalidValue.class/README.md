I represent invalid value.
I am used when actual object can't be parsed from string.
For example presenter for number aspect shows text input to get number from string.
User can type unparsable value. In that case value holder for number should be set to some invalid value. And I am used for that purpose. I allow lead to "mopde isValid => false" in such cases.