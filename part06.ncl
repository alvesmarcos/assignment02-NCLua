<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="part04" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgTV">
				<region id="rgVideo" zIndex="1"/>
				<region id="rgImageMenu" top="3%" left="70%" width="28%" height="38%" zIndex="2"/>
				<region id="rgImageMenuJPA" top="30.2%" left="77%" width="10%" height="3%" zIndex="3"/>
				<region id="rgImageMenuPOA" top="24.9%" left="77%" width="10%" height="3%" zIndex="3"/>
				<region id="rgImageMenuGRU" top="19.4%" left="77%" width="10%" height="3%" zIndex="3"/>
				
				<region id="rgImageInfo" left="88%" width="10%" height="15%" zIndex="2"/>
				<region id="rgTextTemperature" top="2%" left="80%" zIndex="3"/>
			</region>
		</regionBase>
		<descriptorBase>
			<descriptor id="dVideo" region="rgVideo"/>
			<descriptor id="dImageInfo" region="rgImageInfo"/>
			<descriptor id="dTextTemperature" region="rgTextTemperature">
				<descriptorParam name="fontSize" value="30"/>
			</descriptor>
			<descriptor id="dImageMenu" region="rgImageMenu"/>
			
			<descriptor id="dMenuItem1" region="rgImageMenuGRU"
						focusIndex="1" moveUp="3" moveDown="2"
						focusBorderWidth="3" focusBorderColor="white"
						selBorderColor="yellow"
						focusSrc="media/imageSelectedMenuGRU.png"
						/> 
			<descriptor id="dMenuItem2" region="rgImageMenuPOA"
						focusIndex="2" moveUp="1" moveDown="3"
						focusBorderWidth="3" focusBorderColor="white"
						selBorderColor="yellow"
						focusSrc="media/imageSelectedMenuPOA.png"
						/>
			<descriptor id="dMenuItem3" region="rgImageMenuJPA"
						focusIndex="3" moveUp="2" moveDown="1"
						focusBorderWidth="3" focusBorderColor="white"
						selBorderColor="yellow"
						focusSrc="media/imageSelectedMenuJPA.png"
						/>
		</descriptorBase>
		<connectorBase>
			<importBase documentURI="baseConnectors.ncl" alias="baseConnectors"/>
		</connectorBase>
	</head>
	<body>
		<port id="pVideo" component="video"/>
		<port id="pImageInfo" component="imageInfo"/>
		
		<media id="video" src="media/video.mp4" descriptor="dVideo"/>
		<media id="imageMenu" src="media/menu.png" descriptor="dImageMenu"/>
		<media id="menuItem1" src="media/imageMenuGRU.png" descriptor="dMenuItem1"/>
		<media id="menuItem2" src="media/imageMenuPOA.png" descriptor="dMenuItem2"/>
		<media id="menuItem3" src="media/imageMenuJPA.png" descriptor="dMenuItem3"/>
			
		<media id="imageInfo" src="media/info_icon.png" descriptor="dImageInfo"/>
		
		<media id="displayText" src="src/readtexthttp.lua" descriptor="dTextTemperature">
			<property name="mensagem"/>
		</media>
		
		<!-- CURSOR BLUE -->
		<link xconnector="baseConnectors#onKeySelectionStartNStop">
			<bind role="onSelection" component="imageInfo">
				<bindParam name="vKey" value="5"/>
			</bind>
			<bind role="start" component="imageMenu"/>
			<bind role="start" component="menuItem3"/>
			<bind role="start" component="menuItem2"/>
			<bind role="start" component="menuItem1"/>
			
			<bind role="stop" component="imageInfo"/>	
		</link>
		
		<!-- CURSOR GREEN -->
		<link xconnector="baseConnectors#onKeySelectionStartNStop">
			<bind role="onSelection" component="displayText">
				<bindParam name="vKey" value="GREEN"/>
			</bind>
			<bind role="start" component="imageMenu"/>
			<bind role="start" component="menuItem3"/>
			<bind role="start" component="menuItem2"/>
			<bind role="start" component="menuItem1"/>
			<bind role="stop" component="displayText"/>
		</link>
		
		<!-- CURSOR RED -->
		<link xconnector="baseConnectors#onKeySelectionStartStopN">
			<bind role="onSelection" component="imageMenu">
				<bindParam name="vKey" value="RED"/>
			</bind>
			<bind role="start" component="imageInfo"/>
			<bind role="stop" component="imageMenu"/>
			<bind role="stop" component="menuItem1"/>
			<bind role="stop" component="menuItem2"/>
			<bind role="stop" component="menuItem3"/>
		</link>	
		<link xconnector="baseConnectors#onKeySelectionStartStop">
			<bind role="onSelection" component="displayText">
				<bindParam name="vKey" value="RED"/>
			</bind>
			<bind role="start" component="imageInfo"/>
			<bind role="stop" component="displayText"/>
		</link>
		
		<!--  -->

		<link xconnector="baseConnectors#onSelectionStartNStopNSet">
			<bind role="onSelection" component="menuItem1"/>
			<bind role="start" component="displayText"/>
			<bind role="stop" component="imageMenu"/>
			<bind role="stop" component="menuItem1"/>
			<bind role="stop" component="menuItem2"/>
			<bind role="stop" component="menuItem3"/>
			<bind role="set" component="displayText" interface="mensagem">
				<bindParam name="var" value="http://sdcufpb.com.br/wp-content/uploads/2017/01/gru.txt"/>
			</bind>
		</link>		
		
		<link xconnector="baseConnectors#onSelectionStartNStopNSet">
			<bind role="onSelection" component="menuItem2"/>
			<bind role="start" component="displayText"/>
			<bind role="stop" component="imageMenu"/>
			<bind role="stop" component="menuItem1"/>
			<bind role="stop" component="menuItem2"/>
			<bind role="stop" component="menuItem3"/>
			<bind role="set" component="displayText" interface="mensagem">
				<bindParam name="var" value="http://sdcufpb.com.br/wp-content/uploads/2017/01/poa.txt"/>
			</bind>
		</link>		
		
		<link xconnector="baseConnectors#onSelectionStartNStopNSet">
			<bind role="onSelection" component="menuItem3"/>
			<bind role="start" component="displayText"/>
			<bind role="stop" component="imageMenu"/>
			<bind role="stop" component="menuItem1"/>
			<bind role="stop" component="menuItem2"/>
			<bind role="stop" component="menuItem3"/>
			<bind role="set" component="displayText" interface="mensagem">
				<bindParam name="var" value="http://sdcufpb.com.br/wp-content/uploads/2017/01/jpa.txt"/>
			</bind>
		</link>		
	</body>
</ncl>