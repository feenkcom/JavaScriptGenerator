"
I define methods to allow easy call on Python 3 object's.
"
Trait {
	#name : #JSGCallable,
	#category : #'JavaScriptGenerator-Traits'
}

{ #category : #call }
JSGCallable >> call [
	^ self callWith: #()
]

{ #category : #call }
JSGCallable >> callWith: anArrayOrADictionary [
	^ anArrayOrADictionary jsgCallArgumentsOf: self
]

{ #category : #call }
JSGCallable >> callWith: anArray with: aDictionary [
	^ JSGCall target: self positionalArguments: anArray keywordArguments: aDictionary
]
