-- NCLua módulo responsável pelo ícone do tempo de acordo com a temperatura da cidade

local PROPERTY_NAME = 'temperature'

function handler(evt)
	if evt.class == 'ncl' and evt.type == 'attribution' then
		local ic = ''
		print('recebendo evento...', evt.action) io.flush()
		if evt.name ==  PROPERTY_NAME then
			temp = parser(evt.value)
			-- escolhendo qual icone desenhar	
			if temp > 20 then ic = 'sun.png'
			elseif temp <= 20 and temp >= 10 then ic = 'cloud.png'
			elseif temp < 10 then ic = 'snow.png' end
			
			display('../media/'..ic)
		end
	end
end

function parser(file)
	local f = io.open(file, "r")
	local content = f:read("*all")

	return tonumber(string.sub(content, 5, string.find(content, 'º')-1))
end

function display(image)
	local imageCanvas = canvas:new(image); --carrega a imagem
	canvas:compose(0, 0, imageCanvas)       -- desenha a imagem na posicao
	canvas:flush()
end

event.register(handler)