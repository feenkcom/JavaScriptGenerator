Extension { #name : #Symbol }

{ #category : #'*JavaScriptGenerator' }
Symbol >> jsCall [
	"Syntax sugar to make the DSL better."
	^ self asJSGIdentifier jsCall
]

{ #category : #'*JavaScriptGenerator' }
Symbol >> jsCallWith: anArrayOrADictionary [
	"Syntax sugar to make the DSL better."
	^ self asJSGIdentifier jsCallWith: anArrayOrADictionary
]

{ #category : #'*JavaScriptGenerator' }
Symbol >> require [
	"Syntax sugar to make the DSL better."
	^ JSGRequire moduleNamed: self
]
