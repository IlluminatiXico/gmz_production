local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
func = {}
Tunnel.bindInterface("gmz_production",func)

local receives = {}
local recipes = {}

function func.checkPermissions(permissions)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if permissions then
            for p, m in pairs(permissions) do
                if vRP.hasPermission(user_id, m) then
                    return true
                end
            end
            return false
        end
        return true
    end
end

function func.startProduction(receiveItems, recipe, duration, anim)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then

        if recipes[source] then
            recipes[source] = nil
        end

        receives[source] = receiveItems

        if recipe then
            recipes[source] = recipe
        end

        for k,v in pairs(receives[source]) do
            if v.min and v.max then
                v.total = math.random(v.min, v.max)
            end
        end

        if hasItensInRecipe(user_id, source) then
            if hasInventoryWeight(user_id, source) then
                TriggerClientEvent("producao:iniciar", source, duration*1000)
                TriggerClientEvent("emotes", source, anim)
            else
                TriggerClientEvent("Notify", source, "negado", "Você não tem espaço em seu inventário.")
            end
        else
            TriggerClientEvent("Notify", source, "sucesso", "Você não tem os itens necessários da receita.")

        end

    end
end

function hasItensInRecipe(user_id, source)
    -- print('Obtendo itens da receita: '..json.encode(recipes[source]))
    if recipes[source] then
        local data = vRP.getUserDataTable(user_id)
        if data then
            for k,v in pairs(recipes[source]) do
                if data and data.inventory then
                    for i,o in pairs(data.inventory) do
                        -- print('Comparando item: '..i.. ' com item '..v.item)
                        if i == v.item then
                            v.enabledToReceive = false
                            if o.amount >= v.total then
                                v.enabledToReceive = true
                            end
                        end
                    end
                end
                if not v.enabledToReceive then
                    return false
                end
            end
            return true
        end
    else
        return true
    end
end

function hasInventoryWeight(user_id, source)
    local espacoOcupado = vRP.getInventoryWeight(user_id)
    local espacoReceita = 0
    -- print('Espaço ocupado: '.. espacoOcupado)
    local espacoParaItem = 0
    for k,v in pairs(receives[source]) do
        espacoParaItem = espacoParaItem + (vRP.getItemWeight(v.item) * v.total)
    end
    -- print('Espaço para item: '.. espacoParaItem)
    
    if recipes[source] then
        for k,v in pairs(recipes[source]) do
            espacoReceita = espacoReceita + vRP.getItemWeight(v.item)
        end
    end

    local espacoTotal = espacoOcupado + espacoParaItem - espacoReceita
    -- print('Espaço total: '.. espacoTotal)

    if espacoTotal <= vRP.getInventoryMaxWeight(user_id) then
        -- print('Espaço Espaco ocupado: '..espacoOcupado..', espaço total: '..espacoTotal)
        return true
    end
    return false
end

function getItensInRecipe(user_id, source)
    if hasItensInRecipe(user_id, source) then
        local data = vRP.getUserDataTable(user_id)
        if data then
            for k,v in pairs(recipes[source]) do
                if data and data.inventory then
                    for i,o in pairs(data.inventory) do
                        -- print('Comparando item: '..i.. ' com item '..v.item)
                        if i == v.item then
                            if o.amount >= v.total then
                                vRP.tryGetInventoryItem(user_id, v.item, v.total,false)
                            end
                        end
                    end
                end
            end
        end
    end
end

function func.checkPayment()
    local source = source
    local user_id = vRP.getUserId(source)
    if receives[source] then
        if hasInventoryWeight(user_id, source) then
            if hasItensInRecipe(user_id, source) then
                if recipes[source] then
                    getItensInRecipe(user_id, source)
                end
                for k,v in pairs(receives[source]) do
                    vRP.giveInventoryItem(user_id, v.item, v.total)
                end
            end

        end
    else
        TriggerClientEvent("Notify", source, "sucesso", "Você não tem itens para receber...")
    end
end