local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

  --Police
  RegisterServerEvent('cartao:daritem')
  AddEventHandler('cartao:daritem', function()
  local xPlayer = ESX.GetPlayerFromId(source)
     if xPlayer.job.name == 'police' then
     if xPlayer.getInventoryItem('estadoid')['count'] == 0 then
        xPlayer.setInventoryItem('estadoid', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Entraste ao Servico' })
        else
        xPlayer.setInventoryItem('estadoid', 0)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Saieste de Servico' })
      end
    end
  end)

  --Ambulance
  RegisterServerEvent('cartao:daritem')
  AddEventHandler('cartao:daritem', function()
  local xPlayer = ESX.GetPlayerFromId(source)
     if xPlayer.job.name == 'ambulance' then
     if xPlayer.getInventoryItem('estadoid')['count'] == 0 then
        xPlayer.setInventoryItem('estadoid', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Entraste ao Servico' })
        else
        xPlayer.setInventoryItem('estadoid', 0)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Saieste de Servico' })
      end
    end
  end)

  --Mechanic
  RegisterServerEvent('cartao:daritem')
  AddEventHandler('cartao:daritem', function()
  local xPlayer = ESX.GetPlayerFromId(source)
     if xPlayer.job.name == 'mechanic' then
     if xPlayer.getInventoryItem('estadoid')['count'] == 0 then
        xPlayer.setInventoryItem('estadoid', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Entraste ao Servico' })
        else
        xPlayer.setInventoryItem('estadoid', 0)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Saieste de Servico' })
      end
    end
  end)