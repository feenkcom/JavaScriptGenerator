"
I define #execute method that let the code generated by my user be executed by the current P3GInterpreter.

My users must implement:
- generate: that returns a string containing Python code.
- bridge: that returns the bridge that can execute Python code.
"
Trait {
	#name : #JSGTExecutable,
	#category : #'JavaScriptGenerator-Traits'
}

{ #category : #executing }
JSGTExecutable >> execute [
	JSGInterpreter current
		executeJavaScriptCode: self generate
]
