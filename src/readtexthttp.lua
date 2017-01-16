local util = require 'util'
local http = require 'http'

-- CONFIGURA��ES
fontFace = 'vera'
fontSize = 24
fontColor = "white"
bgcolor = 'black'

PROPRIEDADE_NOME = 'mensagem'

function handler (e)

	if e.class == 'ncl' and e.type == 'attribution' then
		if e.name == PROPRIEDADE_NOME then 
			print('Valor sendo atribuindo:', e.value) io.flush()
			
			readTextFromHtml(e.value) 
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
	temp = parser(body)
	-- escolhendo qual icone desenhar	
	if temp > 20 then ic = 'sun.png'
	elseif temp <= 20 and temp >= 10 then ic = 'cloud.png'
	elseif temp < 10 then ic = 'snow.png' end
	
	canvas:attrFont(fontFace, fontSize)
	canvas:attrColor(fontColor)
	canvas:drawText(0,0, body)
	
	local imageCanvas = canvas:new('../media/'..ic); --carrega a imagem
	canvas:compose(0, 30, imageCanvas)       -- desenha a imagem na posicao

	canvas:flush()

	print("<><> Texto desenhada!") io.flush()
end


function parser(content)
	return tonumber(string.sub(content, 5, string.find(content, 'º')-1))
end

event.register(handler)
