<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="part05" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgTV">
				<region id="rgVideo" zIndex="1"/>
				<region id="rgImageInfo" left="88%" width="10%" height="15%" zIndex="2"/>
				<region id="rgTextTemperature" top="2%" left="80%" zIndex="2"/>
				<region id="rgIconTemperature" top="11%" left="82%" width="16%" height="16%" zIndex="2"/>
			</region>
		</regionBase>
		
		<descriptorBase>
			<descriptor id="dVideo" region="rgVideo"/>
			<descriptor id="dImageInfo" region="rgImageInfo"/>
			<descriptor id="dTextTemperatureGRU" region="rgTextTemperature"> 
				<descriptorParam name="fontSize" value="30"/>
			</descriptor>
			<descriptor id="dTextTemperaturePOA" region="rgTextTemperature"> 
				<descriptorParam name="fontSize" value="30"/>
			</descriptor>
			<descriptor id="dTextTemperatureJPA" region="rgTextTemperature"> 
				<descriptorParam name="fontSize" value="30"/>
			</descriptor>
			
			<descriptor id="dIconTemperature" region="rgIconTemperature"/>
		</descriptorBase>
		
		<connectorBase>
			<importBase documentURI="baseConnectors.ncl" alias="baseConnectors"/>
		</connectorBase>
	</head>
	<body>
		<port id="pVideo" component="video"/>
		<port id="pImageInfo" component="imageInfo"/>
		
		<media id="video" src="media/video.mp4" descriptor="dVideo"/>
		<media id="displayImageTemperature" src="src/temperature.lua" descriptor="dIconTemperature">
			<property name="temperature"/>
		</media>
		<media id="imageInfo" src="media/info_icon.png" descriptor="dImageInfo"/>
		<media id="textTemperatureGRU" src="media/gru.txt" descriptor="dTextTemperatureGRU"/>
		<media id="textTemperaturePOA" src="media/poa.txt" descriptor="dTextTemperaturePOA"/>
		<media id="textTemperatureJPA" src="media/jpa.txt" descriptor="dTextTemperatureJPA"/>
		
		<link xconnector="baseConnectors#onBeginStart">
			<bind role="onBegin" component="video"/>
			<bind role="start" component="displayImageTemperature"/>
		</link>
		
		<!-- CURSOR BLUE -->
		<link xconnector="baseConnectors#onKeySelectionSetStartStop">
			<bind role="onSelection" component="imageInfo">
				<bindParam name="vKey" value="BLUE"/>
			</bind>
			<bind role="set" component="displayImageTemperature" interface="temperature">
				<bindParam name="var" value="../media/gru.txt"/>
			</bind>
			<bind role="start" component="textTemperatureGRU"/>
			<bind role="stop" component="imageInfo"/>
		</link>
		
		<!-- CURSOR RIGHT -->
		<link xconnector="baseConnectors#onKeySelectionStartStop">
			<bind role="onSelection" component="textTemperatureGRU">
				<bindParam name="vKey" value="CURSOR_RIGHT"/>
			</bind>
			<bind role="start" component="textTemperaturePOA"/>
			<bind role="stop" component="textTemperatureGRU"/>
		</link>
		<link xconnector="baseConnectors#onKeySelectionStartStop">
			<bind role="onSelection" component="textTemperaturePOA">
				<bindParam name="vKey" value="CURSOR_RIGHT"/>
			</bind>
			<bind role="start" component="textTemperatureJPA"/>
			<bind role="stop" component="textTemperaturePOA"/>
		</link>
		
		<!-- CURSOR LEFT -->
		<link xconnector="baseConnectors#onKeySelectionStartStop">
			<bind role="onSelection" component="textTemperaturePOA">
				<bindParam name="vKey" value="CURSOR_LEFT"/>
			</bind>
			<bind role="start" component="textTemperatureGRU"/>
			<bind role="stop" component="textTemperaturePOA"/>
		</link>
		<link xconnector="baseConnectors#onKeySelectionStartStop">
			<bind role="onSelection" component="textTemperatureJPA">
				<bindParam name="vKey" value="CURSOR_LEFT"/>
			</bind>
			<bind role="start" component="textTemperaturePOA"/>
			<bind role="stop" component="textTemperatureJPA"/>
		</link>
		
		<link xconnector="baseConnectors#onBeginStopStartSet">
			<bind role="onBegin" component="textTemperaturePOA"/>
			<bind role="stop" component="displayImageTemperature"/>
			<bind role="start" component="displayImageTemperature"/>
			<bind role="set" component="displayImageTemperature" interface="temperature">
				<bindParam name="var" value="../media/poa.txt"/>
			</bind>
		</link>
		<link xconnector="baseConnectors#onBeginStopStartSet">
			<bind role="onBegin" component="textTemperatureGRU"/>
			<bind role="stop" component="displayImageTemperature"/>
			<bind role="start" component="displayImageTemperature"/>
			<bind role="set" component="displayImageTemperature" interface="temperature">
				<bindParam name="var" value="../media/gru.txt"/>
			</bind>
		</link>
		<link xconnector="baseConnectors#onBeginStopStartSet">
			<bind role="onBegin" component="textTemperatureJPA"/>
			<bind role="stop" component="displayImageTemperature"/>
			<bind role="start" component="displayImageTemperature"/>
			<bind role="set" component="displayImageTemperature" interface="temperature">
				<bindParam name="var" value="../media/jpa.txt"/>
			</bind>
		</link>
		
		<!-- RED -->
		<link xconnector="baseConnectors#onKeySelectionStartStopN">
			<bind role="onSelection" component="textTemperatureJPA">
				<bindParam name="vKey" value="RED"/>
			</bind>
			<bind role="start" component="imageInfo"/>
			<bind role="stop" component="textTemperatureJPA"/>
			<bind role="stop" component="displayImageTemperature"/>
		</link>
		<link xconnector="baseConnectors#onKeySelectionStartStopN">
			<bind role="onSelection" component="textTemperaturePOA">
				<bindParam name="vKey" value="RED"/>
			</bind>
			<bind role="start" component="imageInfo"/>
			<bind role="stop" component="textTemperaturePOA"/>
			<bind role="stop" component="displayImageTemperature"/>
		</link>
		<link xconnector="baseConnectors#onKeySelectionStartStopN">
			<bind role="onSelection" component="textTemperatureGRU">
				<bindParam name="vKey" value="RED"/>
			</bind>
			<bind role="start" component="imageInfo"/>
			<bind role="stop" component="textTemperatureGRU"/>
			<bind role="stop" component="displayImageTemperature"/>
		</link>
		
	</body>
</ncl>