"
I model a Python 3 typle.
That is to say, I will be written as a Python 3 tuple when serialized as source code.

"
Class {
	#name : #JSGTuple,
	#superclass : #OrderedCollection,
	#category : #'JavaScriptGenerator-Core'
}

{ #category : #writing }
JSGTuple >> writeJavaScriptOn: aStream [
	aStream << '('.
	self 
		do: [ :elem | 
			elem writeJavaScriptOn: aStream.
			aStream << ',' ].
	aStream << ')'.
]
