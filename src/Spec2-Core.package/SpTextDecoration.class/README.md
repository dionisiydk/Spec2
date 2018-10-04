My subclasses decorate strings with specific way. They can format given string by inserting extra characters. Or they ca affect string modification operations.

They shoud implement mappings between decorated string and native string: 

- convertNativeTextToDecorated: nativeString 
- convertDecoratedTextToNative: decoratedString
- convertNativePosition: indexInNativeString toDecoratedOn: decoratedString
- convertDecoratedPosition: indexInDecoratedString toNativeOn: decoratedString

And they should implement decoration of insertion operation:
- decorateInsertionOf: newString into: decoratedString from: startIndex to: stopIndex

