# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Jihoon Suh"
	twitter: ""
	description: ""

{VRComponent, VRLayer} = require "VRComponent"
{TextLayer} = require 'TextLayer'
Framer.Device.orientationName = "landscape"

# using six images we create the environment
# images from Humus: http://www.humus.name/index.php?page=Textures

vrForeground = new VRComponent 
	front: "images/0001.png"
	right: "images/0004.png"
	left: "images/0002.png"
	back: "images/0003.png"
	bottom: "images/0005.png"
	top: "images/0006.png"

screenRatio = Screen.height/Screen.width


window.onresize = ->
	vrForeground.size = Screen.size


vrForeground.heading = 180
heading = vrForeground.heading



alertRotate = ->
	
	bg_overlay = new Layer
		backgroundColor: "#000000"
		width: Screen.width
		height: Screen.height
		opacity: 0.5
		z:0
		
	turn = new Layer
		originX:0.5
		originY:0.5
		x:Align.center
		y:Screen.height/2-230
		image : 'images/turn.png'
		
	al = new TextLayer
		heading: 0
		elevation: 0
		x:Align.center
		y:Screen.height/2+30
		color: "rgb(255,255,255)"
		textAlign: "center"
		text:"Rotate device to landscape mode for best result"
		fontSize: 40
		width: 500
		fontFamily: 'Helvetica'
		fontWeight: '400'	
		
	window.onresize = ->
		al.destroy()
		turn.destroy()
		bg_overlay.destroy()

mainScene = ->
	
	vrForeground.orientationLayer = true
	
	vrForeground.on Events.MouseDown, ->
		document.body.style.cursor = "move"
	
	vrForeground.on Events.MouseUp, ->
		document.body.style.cursor = "auto"
	
	#Add tooltips and define their positions
	vrVideo = new VRLayer
		heading: 180
		elevation: -10
	
	vrInfo = new VRLayer
		heading: 140
		elevation: 0
		
	vrMake = new VRLayer
		heading: 200
		elevation: 0
		
	vrWeb = new VRLayer
		heading: 220
		elevation: 0
		
	vrMe = new VRLayer
		heading: 160
		elevation: 0
		
	introText = new TextLayer
		heading: 180
		elevation: 0
		color: "rgba(255,255,255,0.7)"
		textAlign: "center"
		text:"JIHOON SUH"
		fontSize: 40
		width: 624
		fontFamily: 'Helvetica'
		fontWeight: '700'
			
		
	introText2 = new TextLayer
		heading: 180
		elevation: -3
		color: "#fff"
		textAlign: "center"
		text:"I design human-centered interactions for digital and tangible products"
		fontSize: 35
		width: 624
		fontFamily: 'Helvetica'
		fontWeight: '400'
			
	
	introHide = new Animation
		layer: introText
		properties:
			opacity:0
		time:0.2
		
	intro2Hide = new Animation
		layer: introText2
		properties:
			opacity:0
		time:0.2
		
	introShow = introHide.reverse()	
	intro2Show = intro2Hide.reverse()	

		
# 	closeVid = new TextLayer
# 		heading: 0
# 		elevation: 20
# 		color: "rgb(255,255,255)"
# 		textAlign: "center"
# 		text:"CLOSE VIDEO"
# 		fontSize: 40
# 		width: 624
# 		fontFamily: 'Helvetica'
# 		fontWeight: '700'
	
	#Create array from tooltips
	vrTooltips = [vrVideo, vrMe, vrMake,vrWeb, vrInfo]
	# create the video layer
	
	videoContainer = new VRLayer
# 		heading: -30
# 		elevation: 0
		#x: Align.center
		#y: Align.center
		originX:0.5
		originY:0.5
		width:900
		height:506
		backgroundColor:'transparant'
		#scaleX:0.2
		#scaleY:0.4
		z:20
		
	
	videoLayer = new VideoLayer
		width:900
		height:506
		#x: Align.center
		#y: Align.center
		originX:0.5
		originY:0.5
		video: "images/low.mp4"
		#scaleX:0.2
		#scaleY:0.4
		opacity: 0
		z:21
		superLayer: videoContainer
		
	videoLayer.player.loop = true
		
	bg_overlay = new Layer
		backgroundColor: "#000000"
		width: 2000
		height: 2000
		opacity: 0.1
		z:-5
		
	bgShow = new Animation
		layer: bg_overlay
		properties:
			opacity:0.6
		time:0.3
		
	bgHide = bgShow.reverse()
	
	icons = new Layer
		width: 700
		height: 560
		originX: 0.5
		originY: 0.5
		backgroundColor: "transparant"
		image: 'images/icons.png'
		opacity: 0
		scale:0
		z:20
		
	iconsShow = new Animation
		layer: icons
		properties:
			opacity: 1
			scale:1
		time: 0.2
	
	iconsHide = iconsShow.reverse()
	
	meimg = new Layer
		width: 400
		height: 400
		originX: 0.5
		originY: 0.5
		backgroundColor: "transparant"
		image: 'images/meme.png'
		opacity: 0
		scale:0
		z:20
		
	meShow = new Animation
		layer: meimg
		properties:
			opacity: 1
			scale:1
		time: 0.2
	
	meHide = meShow.reverse()

	#Textbox initialisation
	textBox = new Layer
		width: 600
		height: 350
		originX: 0.5
		originY: 0.5
		backgroundColor: "#272727"
		opacity: 0
		scaleX:0.3
		scaleY:0.5
		borderRadius: 400
		shadowBlur: 4
		shadowSpread: 2
		shadowColor: "rgba(0,0,0,0.1)"
		z:20
		
	textBoxShow = new Animation
		layer: textBox
		properties:
			opacity: 1
			scaleX:1
			scaleY:1
			borderRadius: 20
		time: 0.2
		

			
	textBoxHide = textBoxShow.reverse()
	
	#Textbox content initialisation
	text = new TextLayer
		color: "#fff"
		opacity: 0
		textAlign: "left"
		fontSize: 30
		width: 520
		height: 300
		fontFamily: 'Helvetica'
		fontWeight: '400'
		lineHeight: 1.5
		paddingTop: 85
		letterSpacing: 0
		z:21
	
	textShow = new Animation
		layer: text
		properties:
			opacity: 1
		time: 0.2
			
	textHide = textShow.reverse()

	
	#Textbox title initialisation
	textTitle = new TextLayer
		color: "#fff"
		opacity: 0
		textAlign: "left"
		fontSize: 30
		width: 520
		height: 22
		fontFamily: "Verdana"
		fontWeight: "900"
		textTransform: "uppercase"
		z:21
	
	textTitleShow = new Animation
		layer: textTitle
		properties:
			opacity: 1
		time: 0.2
	
	textTitleHide=textTitleShow.reverse()
	
	#Project text elements to cubemap distortion
	vrForeground.projectLayer(textBox)
	vrForeground.projectLayer(textTitle)
	vrForeground.projectLayer(text)
	vrForeground.projectLayer(introText)
	vrForeground.projectLayer(introText2)
	
	#Style tooltips via for-loop
	for i in [0...vrTooltips.length]
		vrTooltips[i].image = switch i
			when 0 then "images/play.png"
			when 1 then "images/info.png"
			when 2 then "images/make.png"
			when 3 then "images/web.png"
			when 4 then "images/me.png"
		vrTooltips[i].width = 100
		vrTooltips[i].height = 100
		vrTooltips[i].borderRadius = 50
		vrTooltips[i].shadowBlur = 4
		vrTooltips[i].shadowSpread = 5
		vrTooltips[i].shadowColor = "rgba(0,0,0,0.07)"
		vrForeground.projectLayer(vrTooltips[i])
	
	#Add & style reticle
	reticle = new Layer
		width: 90
		height: 90
		borderRadius: 80
		backgroundColor: "rgba(23,249,145,0.2)"
		shadowBlur: 4
		shadowSpread: 5
		shadowColor: "rgba(0,0,0,0.1)"
		scale: 0.25
		
	reticle.style.border = "16px solid rgba(23,249,145,0.85)"
	reticle.center()
	
	reticleScaleUp = new Animation
		layer: reticle
		properties: 
			scale: 0.5
			opacity:0.3
		time: 0.1
		curve: "linear"
		
	reticleScaleDown = new Animation
		layer: reticle
		properties: 
			scale: 0.25
			opacity:1
		time: 0.1
		curve: "linear"
	
	#On foreground position change event do stuff
	tooltipFound = false
	crntTpHeading = 0
	crntTpElevation = 0
	currentTooltipID = 0
	
	tooltipHandler = ->
		vrForeground.on Events.OrientationDidChange, (data) ->
		
			heading = data.heading
			elevation = data.elevation
			tilt = data.tilt
			
			#Tooltip behaviour
			for i in [0...vrTooltips.length]
				triggerDistance = 3
				headingProximity = Math.abs(heading - vrTooltips[i].heading)
				elevationProximity = Math.abs(elevation - vrTooltips[i].elevation)
				if (headingProximity < triggerDistance)
					if (elevationProximity < triggerDistance)
						if (tooltipFound is false)
							currentTooltipID = i
							reticleScaleUp.start()
							tooltipActivator(currentTooltipID)
							crntTpHeading = vrTooltips[i].heading
							crntTpElevation = vrTooltips[i].elevation
							tooltipFound = true
							onTooltipFound(crntTpHeading, crntTpElevation)
				if (tooltipFound is true)
					if (Math.abs(heading - crntTpHeading) > triggerDistance)
						reticleScaleDown.start()
						tooltipDisabler(currentTooltipID)
						tooltipFound = false
						onTooltipLost()
					else if (Math.abs(elevation - crntTpElevation) > triggerDistance)
						reticleScaleDown.start()
						tooltipDisabler(currentTooltipID)
						tooltipFound = false
						onTooltipLost()
				
	tooltipHandler()	
	
	#Tooltip animations
	tooltipActivator = (currentTooltip) ->
		vrTooltips[currentTooltip].animate
			properties: 
				opacity: 0
			time: 0.1
			curve: "linear"
	
	tooltipDisabler = (currentTooltip) ->
		vrTooltips[currentTooltip].animate
			properties: 
				opacity:1
			time: 0.1
			curve: "linear"
	
	#Do stuff if reticle is over a tooltip
	onTooltipFound = (currentToolTipHeading, currentTooltipElevation) ->
		print currentTooltipID
		introHide.start()
		intro2Hide.start()
		bgShow.start()

		if currentTooltipID == 0 
			videoLayer.opacity=1
			videoLayer.player.play()

			tooltipArray = vrTooltips.slice(0)
			tooltipArray.splice(currentTooltipID, 1)
			for i in [0...tooltipArray.length]
				tooltipFadeOut = new Animation
					layer: tooltipArray[i]
					properties:
						opacity: 0
					time: 0.5
				tooltipFadeOut.start()
				
			videoContainer.heading = currentToolTipHeading + 0
			videoContainer.elevation = currentTooltipElevation 
			videoLayer.heading = currentToolTipHeading
			videoLayer.elevation = currentTooltipElevation+0
			
			vrForeground.projectLayer(videoContainer)
			vrForeground.projectLayer(videoLayer)
			
		else if currentTooltipID == 1 
			
			meShow.start()
			text.text = textContent[currentTooltipID]
			textTitle.text = textTitles[currentTooltipID]
			textTitleShow.start()
			textShow.start()
				
			tooltipArray = vrTooltips.slice(0)
			tooltipArray.splice(currentTooltipID, 1)
			for i in [0...tooltipArray.length]
				tooltipFadeOut = new Animation
					layer: tooltipArray[i]
					properties:
						opacity: 0
					time: 0.5
				tooltipFadeOut.start()
				
			textTitle.width=400
			text.width=400
			meimg.heading = currentToolTipHeading-10
			meimg.elevation = currentTooltipElevation
			textTitle.heading = currentToolTipHeading+12
			textTitle.elevation = currentTooltipElevation+5
			text.heading = currentToolTipHeading+12
			text.elevation = currentTooltipElevation-1

			vrForeground.projectLayer(meimg)
			vrForeground.projectLayer(textTitle)
			vrForeground.projectLayer(text)
				
		else if currentTooltipID == 2 
			
			iconsShow.start()
				
			tooltipArray = vrTooltips.slice(0)
			tooltipArray.splice(currentTooltipID, 1)
			for i in [0...tooltipArray.length]
				tooltipFadeOut = new Animation
					layer: tooltipArray[i]
					properties:
						opacity: 0
					time: 0.5
				tooltipFadeOut.start()
				
		
			icons.heading = currentToolTipHeading
			icons.elevation = currentTooltipElevation
			vrForeground.projectLayer(icons)

		else
			text.text = textContent[currentTooltipID]
			textTitle.text = textTitles[currentTooltipID]
			textBoxShow.start()
			textTitleShow.start()
			textShow.start()
			
			tooltipArray = vrTooltips.slice(0)
			tooltipArray.splice(currentTooltipID, 1)
			for i in [0...tooltipArray.length]
				tooltipFadeOut = new Animation
					layer: tooltipArray[i]
					properties:
						opacity: 0
					time: 0.5
				tooltipFadeOut.start()
			
			textBox.heading = currentToolTipHeading + 0
			textBox.elevation = currentTooltipElevation 
			textTitle.heading = currentToolTipHeading
			textTitle.elevation = currentTooltipElevation+6
			text.heading = currentToolTipHeading + 0
			text.elevation = currentTooltipElevation
			
			textBox.backgroundColor = bgColors[currentTooltipID]
			vrForeground.projectLayer(textBox)
			vrForeground.projectLayer(textTitle)
			vrForeground.projectLayer(text)
	
	#Do stuff if reticle is out of a tooltip
	onTooltipLost = ->
		introShow.start()
		intro2Show.start()
		bgHide.start()
		if currentTooltipID == 0 
			videoLayer.opacity=0
			videoLayer.player.pause()
				
			tooltipArray = vrTooltips.slice(0)
			tooltipArray.splice(currentTooltipID, 1)
			for i in [0...tooltipArray.length]
				tooltipFadeIn = new Animation
					layer: tooltipArray[i]
					properties:
						opacity: 1
					time: 0.5
				tooltipFadeIn.start()
				
		else if currentTooltipID == 1 
			
			meHide.start()
			textTitleHide.start()
			textHide.start()
			textTitle.width=520
			text.width=520
			
			tooltipArray = vrTooltips.slice(0)
			tooltipArray.splice(currentTooltipID, 1)
			for i in [0...tooltipArray.length]
				tooltipFadeIn = new Animation
					layer: tooltipArray[i]
					properties:
						opacity: 1
					time: 0.5
				tooltipFadeIn.start()
				
		else if currentTooltipID == 2 
			
			iconsHide.start()
			
			
			tooltipArray = vrTooltips.slice(0)
			tooltipArray.splice(currentTooltipID, 1)
			for i in [0...tooltipArray.length]
				tooltipFadeIn = new Animation
					layer: tooltipArray[i]
					properties:
						opacity: 1
					time: 0.5
				tooltipFadeIn.start()
				
		else

			textBoxHide.start()
			textTitleHide.start()
			textHide.start()
			
			tooltipArray = vrTooltips.slice(0)
			tooltipArray.splice(currentTooltipID, 1)
			for i in [0...tooltipArray.length]
				tooltipFadeIn = new Animation
					layer: tooltipArray[i]
					properties:
						opacity: 1
					time: 0.5
				tooltipFadeIn.start()

	#On window resize make sure elements are on their correct place and size
	window.onresize = ->
		vrForeground.size = Screen.size
		
		reticle.center()
		introText.center()
		bg_overlay.center()
		videoLayer.center()
		videoContainer.center()
		
	
			
			
# if Framer.Device.orientation == 0 
# 	alertRotate()
# else mainScene()
# 
# window.onresize = ->
# 	if Framer.Device.orientation == 0 
# 		alertRotate()
# 	else mainScene()

mainScene()


monitorTitle = "Video"
monitorText = ""

infoTitle = "About me"
infoText = "I am a maker and designer interested in natural interaction and augmented & immersive experience"

toolTitle = "Skills and Tools"
toolText = "My expertise lie hardware/software prototyping, product/UX design, and user research."

webTitle = "Experience"
webText = "I have been at various tech startups designing mobile & web products, and wearable products. Also I researched HCI at design laboratories at KAIST."

meTitle = "Education"
meText = "Current Human-Centered Design & Engineering master candidate at UW. Previously received B.S. of Industrial Design at KAIST, South Korea "


#Store texts in arrays
textTitles = [monitorTitle, infoTitle, toolTitle, webTitle, meTitle]
textContent = [monitorText, infoText, toolText, webText, meText] 
bgColors = ["#7A7A7A", "#DBAB93", "#948CBD", "#85A8BC","EE6B6B"]






# Rotate on click

# Create layer
centerClick = new Layer
	x: Align.center
	y: Align.center
	opacity:0
	width:120
	height:120
	
centerClick.onTap ->
	vrForeground.heading = 180
	vrForeground.elevation = 0
	heading = vrForeground.heading
	elevation = vrForeground.elevation
		

