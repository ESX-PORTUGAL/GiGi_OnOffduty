ESX = nil            
local PlayerData = {}

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

--Police
Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)
      local playerPed = GetPlayerPed(-1)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 440.57,-975.68,30.00, true) <= 3.0 then
        DrawText3Ds(440.57,-975.68,30.00 + 0.5, "[~g~E~w~] Entrar / Sair Servico")
        if IsControlJustReleased(0, 38) then
        RequestAnimDict("missah_2_ext_altleadinout")
        while not HasAnimDictLoaded("missah_2_ext_altleadinout") do
        Citizen.Wait(0)
         end
         TaskPlayAnim(GetPlayerPed(-1), "missah_2_ext_altleadinout","hack_loop", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
            if PlayerData.job.name == 'police' then
            TriggerServerEvent('cartao:daritem')
            exports['progressBars']:startUI(2200, "Registar...")
            Citizen.Wait(2200)
            ClearPedTasksImmediately(playerPed)
             else 
              exports['mythic_notify']:DoHudText('error', 'Nao es um Policia.')
              ClearPedTasksImmediately(playerPed)
            end
          end
        end
      end
    end)

 --Ambulance
  Citizen.CreateThread(function ()
    while true do
      Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 340.05,-582.18, 28.20, true) <= 3.0 then
          DrawText3Ds(340.05,-582.18, 28.20 + 0.5, "[~g~E~w~] Entrar / Sair Servico")
          if IsControlJustReleased(0, 38) then
          RequestAnimDict("missah_2_ext_altleadinout")
          while not HasAnimDictLoaded("missah_2_ext_altleadinout") do
          Citizen.Wait(0)
           end
           TaskPlayAnim(GetPlayerPed(-1), "missah_2_ext_altleadinout","hack_loop", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
              if PlayerData.job.name == 'ambulance' then
              TriggerServerEvent('cartao:daritem')
              exports['progressBars']:startUI(2200, "Registar...")
              Citizen.Wait(2200)
              ClearPedTasksImmediately(playerPed)
               else 
                exports['mythic_notify']:DoHudText('error', 'Nao es um Medico.')
                ClearPedTasksImmediately(playerPed)
              end
            end
          end
        end
      end)

    --Mechanic
    Citizen.CreateThread(function ()
      while true do
        Citizen.Wait(0)
          local playerPed = GetPlayerPed(-1)
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -206.76,-1341.61,34.50, true) <= 3.0 then
            DrawText3Ds(-206.76,-1341.61,34.50 + 0.5, "[~g~E~w~] Entrar / Sair Servico")
            if IsControlJustReleased(0, 38) then
                if PlayerData.job.name == 'mechanic' then
                TriggerServerEvent('cartao:daritem')
                exports['progressBars']:startUI(2200, "Registar...")
                Citizen.Wait(2200)
                 else 
                  exports['mythic_notify']:DoHudText('error', 'Nao es um Mecanico.')
                end
              end
            end
          end
        end)

  function DrawText3Ds(x,y,z,text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(1)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.030, 66, 66, 66, 150)
  end
