"
I define methods to allow easy call on Python 3 object's.
"
Trait {
	#name : #JSGCallable,
	#category : #'JavaScriptGenerator-Traits'
}

{ #category : #call }
JSGCallable >> jsCall [
	^ self jsCallWith: #()
]

{ #category : #call }
JSGCallable >> jsCallWith: anArrayOrADictionary [
	^ anArrayOrADictionary jsgCallArgumentsOf: self
]
