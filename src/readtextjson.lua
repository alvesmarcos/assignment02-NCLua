local util = require 'util'
local http = require 'http'
require 'parserJSON'

-- CONFIGURA��ES
fontFace = 'vera'
fontSize = 24
fontColor = "white"
bgcolor = 'black'

PROPRIEDADE_NOME = 'mensagem'
local JSON = (loadfile "parserJSON.lua")() -- one-time load of the routines

function handler (e)

	if e.class == 'ncl' and e.type == 'attribution' then
		if e.name == PROPRIEDADE_NOME then 
			print('Valor sendo atribuindo:', e.value) io.flush()
			local URL = ''
			if(e.value == 'gru') then
				URL = "https://api.hgbrasil.com/weather/?format=json&cid=BRXX0232"
			elseif (e.value == 'poa') then
				URL = "https://api.hgbrasil.com/weather/?format=json&cid=BRXX0186"
			elseif (e.value == 'jpa') then
				URL = "https://api.hgbrasil.com/weather/?format=json&cid=BRXX0128"
			end
			readTextFromHtml(URL) 
		end
	end

end


function readTextFromHtml(url)
	print("<><> Acessando:", url) io.flush()

	http.request(url, display)
end


--funcao callback para exibir a imagem baixada
--header: cabecalho da resposta do http
--body: corpo da resposta (neste caso, a imagem do icone)
function display(header, body)
	print("<><> valor lido:", body) io.flush()
	local ic = ''
	
	temp = 10
	
	T = JSON:decode(body)
	
	print("city:   ", T.results.temp)
	
	-- escolhendo qual icone desenhar	
	if T.results.temp > 20 then ic = 'sun.png'
	elseif T.results.temp <= 20 and T.results.temp>= 10 then ic = 'cloud.png'
	elseif T.results.temp < 10 then ic = 'snow.png' end
	
	text = T.results.city.." "..T.results.temp
	
	canvas:attrFont(fontFace, fontSize)
	canvas:attrColor(fontColor)
	canvas:drawText(0,0, text)
	
	local imageCanvas = canvas:new('../media/'..ic); --carrega a imagem
	canvas:compose(0, 30, imageCanvas)       -- desenha a imagem na posicao

	canvas:flush()

	print("<><> Texto desenhada!") io.flush()
end


function parser(content)
	return tonumber(string.sub(content, 5, string.find(content, 'º')-1))
end

event.register(handler)
