"
Interpreter using LibC>>#system: method.

Far to be stable, no error management for example, use at you own risks!
"
Class {
	#name : #JSGFFIInterpreter,
	#superclass : #JSGInterpreter,
	#instVars : [
		'pathToPython'
	],
	#classInstVars : [
		'pathToPython'
	],
	#category : #'JavaScriptGenerator-Interpreters'
}

{ #category : #python }
JSGFFIInterpreter >> executePythonCode: aString [
	| file baseFileName errFile |
	baseFileName := UUID new asString.
	file := FileLocator temp / (baseFileName , '.py').
	file writeStreamDo: [ :s |
		s << aString ].
	errFile := FileLocator temp / (baseFileName , '.pyerr').
	LibC system: ('{1} {2} 2> {3}' format: {self pathToPython . file pathString . errFile pathString}).
	file ensureDelete.
	[ errFile contents isNotEmpty
		ifTrue: [ JSGPythonException signal: errFile contents ]
	] ensure: [ errFile ensureDelete ]
]

{ #category : #accessing }
JSGFFIInterpreter >> pathToPython [
	"If the user set a path and the file exists, returns it."
	pathToPython ifNotNil: [ 
		pathToPython asFileReference exists
			ifFalse: [ self error: ('The path {1} to the python3 interpreter binary references a file that does not exist.' format: { pathToPython }) ].
		^ pathToPython ].
	
	"Else, check for a default path..."
	OSPlatform current jsgJavaScriptPath asFileReference exists
		ifFalse: [ self error: ('The path {1} to the python3 interpreter binary references a file that does not exist.' format: { OSPlatform current jsgJavaScriptPath }) ].
	
	^ OSPlatform current jsgJavaScriptPath
]

{ #category : #accessing }
JSGFFIInterpreter >> pathToPython: anObject [
	pathToPython := anObject
]
