Class {
	#name : #TravelAdminHeaderComponent,
	#superclass : #TravelHeaderComponent,
	#category : #ProjekatPharo
}

{ #category : #rendering }
TravelAdminHeaderComponent >> renderButtonsOn: html [
	html form: [
		self renderDisconnectButtonOn: html.
		self renderPublicViewButtonOn: html ]

]

{ #category : #rendering }
TravelAdminHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton 
		tbsPullRight;
		callback: [ self session reset ];
		with: [
			html text: 'Disconnect '.
			html tbsGlyphIcon iconLogout ]
]

{ #category : #rendering }
TravelAdminHeaderComponent >> renderPublicViewButtonOn: html [
	self session isLogged ifTrue: 
		[ html tbsNavbarButton
		  	tbsPullRight;
		  	callback: [ component goToPostListView ];
		   with: 
				[ html tbsGlyphIcon iconEyeOpen.
				  html text: 'Public View' 
	]]
]
