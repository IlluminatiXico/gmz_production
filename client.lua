local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
func = Tunnel.getInterface("gmz_production")
vRP = Proxy.getInterface("vRP")

local processo = false
local tempo = -1

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(1)

		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(ped))


        for k,v in pairs(Config.producoes) do
            for n,m in pairs(v) do
                -- print(json.encode(m))
                local bowz,cdz = GetGroundZFor_3dCoord(m.x,m.y,m.z)
                local distance = GetDistanceBetweenCoords(m.x,m.y,cdz,x,y,z,true)
				if distance <= 30 and not processo then
					if m.marker then
						DrawMarker(21, m.x,m.y,m.z-0.30,0,0,0,0,180.0,180.0,1.1,0.5,0.5,0,255,0,100,1,0,0,1)
					end
					if distance <= 1.5 then
						if m.text then
							DrawTxt("~r~[E]~w~ "..m.text)
						end
						if IsControlJustPressed(1, 38) then
							if m.permissions then
								if not func.checkPermissions(m.permissions) then
									TriggerEvent("Notify", "sucesso", "Você não tem as permissões necessárias.")
									break
								end
							end
							func.startProduction(m.receiveItems, m.recipe, m.duration, m.anim)
						end
					end
				end
            end
        end

    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if processo then
			if tempo >= 0 then
				tempo = tempo - 1
				if tempo == 0 then
					processo = false
					func.checkPayment()
					TriggerEvent("emotes", "")
				end
			end
		end
	end
end)

RegisterNetEvent('producao:iniciar')
AddEventHandler('producao:iniciar', function(t)
	TriggerEvent("progress", t, "")
	local te = t / 1000
	-- print('Iniciando produção, tempo estimado: '..te..'min.')
	processo = true
	tempo = parseInt(te)
	-- print('Tempo setado para: '..tempo)
end)

function DrawTxt(text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.45)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)

    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.400, 0.855)
end