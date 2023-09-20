Class {
	#name : #TravelBApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#classInstVars : [
		'main'
	],
	#category : #ProjekatPharo
}

{ #category : #'class initialization' }
TravelBApplicationRootComponent class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
TravelBApplicationRootComponent class >> initialize [ 
	| app |
	app := WAAdmin register: self asApplicationAt: 'TravelBlog'.
	app
		preferenceAt: #sessionClass put: TravelSession.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary.
		
	"super initialize ."
	"main := TravelBScreenComponent new"
]

{ #category : #testing }
TravelBApplicationRootComponent >> children [ 
	^ { main }
]

{ #category : #initialization }
TravelBApplicationRootComponent >> initialize [ 
	"super initialize .
	main := TravelBScreenComponent  new"
	super initialize .
	main := TravelListComponent   new
]

{ #category : #accessing }
TravelBApplicationRootComponent >> main: aComponent [
	main := aComponent 
]

{ #category : #testing }
TravelBApplicationRootComponent >> renderContentOn: html [ 
	"html text: 'TravelBlog'"
	html render: main
]

{ #category : #testing }
TravelBApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TravelBlog'
]
