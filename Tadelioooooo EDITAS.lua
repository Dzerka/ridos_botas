function _()
    (""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
end


function _()
    (""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
    (""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
    (""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
    (""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
    (""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
end


script_version("1.0")
local dlstatus = require('moonloader').download_status
local color = 0x348cb2

require "lib.sampfuncs"
require "lib.moonloader"
local requests = require('requests')
local sampev = require 'lib.samp.events'
local inicfg = require "inicfg"
local imgui = require "imgui"
local encoding = require "encoding"
encoding.default = "CP1251"
local utf8 = encoding.UTF8
local config =
	inicfg.load(
	{
		setting = {
			activationKey = 57,
			recordingKey = 110,
			recordingDelay = 200,
			radius = 5,
			angle = 5,
			color = "FF00FF",
			warnings = true,
			gas = true,
			gaskey = 10,
			panickey = 163,
			force = true,
			forcekey = 2,
			additionalspeed = 0,
			points = true,
			diffrence = 1,
			brakes = true,
			stateloop = false,
			markerkey = 90,
			markerdelay = 20000,
			gaspower = 255,
			brakepower = 255,
			steerleftpower = 128,
			steerrightpower = 128,
			backpower = 64,
			warningsvolume = 10,
			skip = false,
			dialogs = false,
			console = false,
			chat = false,
			arbotas6 = false,
			linija = true,
			autopildyti = false,
			autoisjungimas = false,
			looptimer = 0,
			adapt = true,
			skipbutton = 67,
			dialogpause = true,
			dialogpausetime = 3000,
			speedskipvalue = 10,
			smartskipvalue = 10,
			silentmode = false,
			arbotas = false,
			arbotas5 = false
		}
	},
	"[routes recorder] settings"
)
local myImgui = {
	windows = {status = {main = imgui.ImBool(false)}, size = {main = {X = 300.0, Y = 175.0}}},
	textBuffer = {
		setting = {
			recordingDelay = imgui.ImBuffer(tostring(config.setting.recordingDelay), 256),
			recordingKey = imgui.ImBuffer(tostring(config.setting.recordingKey), 256),
			activationKey = imgui.ImBuffer(tostring(config.setting.activationKey), 256),
			radius = imgui.ImBuffer(tostring(config.setting.radius), 256),
			angle = imgui.ImBuffer(tostring(config.setting.angle), 256),
			color = imgui.ImBuffer(tostring(config.setting.color), 7),
			warnings = imgui.ImBool(config.setting.warnings),
			gas = imgui.ImBool(config.setting.gas),
			gaskey = imgui.ImBuffer(tostring(config.setting.gaskey), 256),
			panickey = imgui.ImBuffer(tostring(config.setting.panickey), 256),
			force = imgui.ImBool(config.setting.force),
			forcekey = imgui.ImBuffer(tostring(config.setting.forcekey), 256),
			additionalspeed = imgui.ImBuffer(tostring(config.setting.additionalspeed), 256),
			points = imgui.ImBool(config.setting.points),
			diffrence = imgui.ImBuffer(tostring(config.setting.diffrence), 256),
			brakes = imgui.ImBool(config.setting.brakes),
			stateloop = imgui.ImBool(config.setting.stateloop),
			markerkey = imgui.ImBuffer(tostring(config.setting.markerkey), 256),
			markerdelay = imgui.ImBuffer(tostring(config.setting.markerdelay), 256),
			gaspower = imgui.ImBuffer(tostring(config.setting.gaspower), 256),
			brakepower = imgui.ImBuffer(tostring(config.setting.brakepower), 256),
			steerleftpower = imgui.ImBuffer(tostring(config.setting.steerleftpower), 256),
			steerrightpower = imgui.ImBuffer(tostring(config.setting.steerrightpower), 256),
			backpower = imgui.ImBuffer(tostring(config.setting.backpower), 256),
			warningsvolume = imgui.ImBuffer(tostring(config.setting.warningsvolume), 256),
			skip = imgui.ImBool(config.setting.skip),
			dialogs = imgui.ImBool(config.setting.dialogs),
			console = imgui.ImBool(config.setting.console),
			chat = imgui.ImBool(config.setting.chat),
			arbotas6 = imgui.ImBool(config.setting.arbotas6),
			arbotas = imgui.ImBool(config.setting.arbotas),
			arbotas5 = imgui.ImBool(config.setting.arbotas5),
			linija = imgui.ImBool(config.setting.linija),
			autopildyti = imgui.ImBool(config.setting.autopildyti),
			autoisjungimas = imgui.ImBool(config.setting.autoisjungimas),
			looptimer = imgui.ImBuffer(tostring(config.setting.looptimer), 256),
			adapt = imgui.ImBool(config.setting.adapt),
			skipbutton = imgui.ImBuffer(tostring(config.setting.skipbutton), 256),
			dialogpause = imgui.ImBool(config.setting.dialogpause),
			dialogpausetime = imgui.ImBuffer(tostring(config.setting.dialogpausetime), 256),
			speedskipvalue = imgui.ImBuffer(tostring(config.setting.speedskipvalue), 256),
			smartskipvalue = imgui.ImBuffer(tostring(config.setting.smartskipvalue), 256),
			silentmode = imgui.ImBool(config.setting.silentmode)
		}
	},
	selectedItem = {routes = imgui.ImInt(0)}
}
local statuses = {reload, pause, stop}
local other = {workType, tick = 0, location}
local panic = false

function warning()
	lua_thread.create(
		function()
			for a = 1, 5 do
				lua_thread.create(
					function()
						for a = 1, tonumber(config.setting.warningsvolume) do
							addOneOffSound(0.0, 0.0, 0.0, 1057)
						end
					end
				)
				wait(300)
			end
		end
	)
end


function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then
		return
	end
	while not isSampAvailable() do
		wait(0)
	end
	if isSampLoaded() then
	CheckName()
	end
    adress, port = sampGetCurrentServerAddress()
    ip = string.format('%s:%s', adress, port)
        if ip == "145.239.0.129:7777" then
            update()
        else
            sampAddChatMessage('Sis{4169E1} scriptas{FFFFFF} gali buti naudojamas tik SARG.lt serveryje.',-1)
            thisScript():unload()
        end
	apply_custom_style()
	check_and_create_directories()
	lua_thread.create(route_record_or_reproduction)
	while true do
		wait(0)
		if markervalue and config.setting.markerdelay then
			local ping = sampGetPlayerPing(sampGetPlayerIdByCharHandle(PLAYER_HANDLE))
			local time = os.clock() * 1000
			local endtime = os.clock() * 1000 + tonumber(config.setting.markerdelay) + ping
			repeat
				wait(0)
				press_brake()
				time = os.clock() * 1000
			until time > endtime
			markervalue = false
		end
		if sampIsDialogActive() and config.setting.dialogpause or sampIsChatInputActive() and config.setting.chat then
				dialogvalue = true
				press_brake()
				else
				if not sampIsDialogActive() or sampIsChatInputActive() then
				dialogvalue = false
		end
	end
		if isKeyDown(32) or isKeyDown(87) or isKeyDown(83) or isKeyDown(65) or isKeyDown(68) then -- W/A/S/D/SPACE MYGTUKAI
			dialogvalue = true
			local ping = sampGetPlayerPing(sampGetPlayerIdByCharHandle(PLAYER_HANDLE))
			local time = os.clock() * 1000
			local endtime = os.clock() * 1000 + tonumber(config.setting.dialogpausetime) + ping
			repeat
			wait(0)
			time = os.clock() * 1000
			until time > endtime
			else
			if not isKeyDown(32) or isKeyDown(87) or isKeyDown(83) or isKeyDown(65) or isKeyDown(68) then
		end
	end
		if isKeyJustPressed(tonumber(config.setting.panickey)) then
			if panic == false then
				statuses.pause = true
				panic = true
				thisScript():reload()
			else
				other.workType = "reproduction"
				statuses.pause = false
				panic = false
			end
		end
		if
			not (sampIsChatInputActive() and not config.setting.chat) and
				not (sampIsDialogActive() and not config.setting.dialogs) and
				not (isSampfuncsConsoleActive() and not config.setting.console)
		 then
			if isKeyJustPressed(config.setting.activationKey) and not sampIsChatInputActive() then
				local request = requests.get('https://pastebin.com/raw/LUi40hZf')
				local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
				local function res()
					for n in request.text:gmatch('[^\r\n]+') do
						if nick:find(n) then
						myImgui.windows.status.main.v = not myImgui.windows.status.main.v
                return true
           end
        end
        return false
    end
    if not res() then
        sampAddChatMessage('{FFFFFF}TU NESI PRIDETAS DUOMENU BAZEJE.',-1)
        thisScript():unload()
    end
			end
		end
		imgui.Process = myImgui.windows.status.main.v
		if statuses.reload then
			imgui.Process = false
			wait(0)
			thisScript():reload()
		end
	end
end

function route_record_or_reproduction()
	while true do
		wait(0)
		if other.workType ~= "reproduction" and other.workType == "record" then
			if
				not (sampIsChatInputActive() and not config.setting.chat) and
					not (sampIsDialogActive() and not config.setting.dialogs) and
					not (isSampfuncsConsoleActive() and not config.setting.console)
			 then
				if isKeyJustPressed(config.setting.recordingKey) then
					local file = open_file("w")
					if file then
						if not config.setting.silentmode then
						sampAddChatMessage("The creation of a new route has begun.", "0x" .. config.setting.color .. "")
						end
						repeat
							wait(0)
							if isCharInAnyCar(PLAYER_PED) then
								car = storeCarCharIsInNoSave(PLAYER_PED)
								posX, posY, _ = getCarCoordinates(car)
								speed = getCarSpeed(car)
								if other.location == "incar" then
									if
										isKeyDown(tonumber(config.setting.forcekey)) and
											not (sampIsChatInputActive() and not config.setting.chat) and
											not (sampIsDialogActive() and not config.setting.dialogs) and
											not (isSampfuncsConsoleActive() and not config.setting.console)
									 then
										file:write(
											"{" ..
												posX ..
													"}:{" ..
														posY ..
															"}:{" ..
																speed + tonumber(config.setting.additionalspeed) ..
																	"}:{nil}\n"
										)
										printStringNow(
											"~r~Forced Recording ~y~X: " ..
												math.floor(posX) ..
													" Y: " .. math.floor(posY) .. " SPEED: " .. math.floor(speed) .. "",
											1000
										)
										wait(tonumber(config.setting.recordingDelay))
									end
									if
										isKeyDown(tonumber(config.setting.markerkey)) and
											not (sampIsChatInputActive() and not config.setting.chat) and
											not (sampIsDialogActive() and not config.setting.dialogs) and
											not (isSampfuncsConsoleActive() and not config.setting.console)
									 then
										file:write(
											"{" ..
												posX ..
													"}:{" ..
														posY ..
															"}:{" ..
																speed + tonumber(config.setting.additionalspeed) ..
																	"}:{marker}\n"
										)
										printStringNow(
											"~p~Marker Recording ~y~X: " ..
												math.floor(posX) ..
													" Y: " .. math.floor(posY) .. " SPEED: " .. math.floor(speed) .. "",
											1000
										)
										wait(tonumber(config.setting.recordingDelay) + 1000)
									end
								end
							end
							local time = os.clock() * 1000
							if
								time - other.tick > tonumber(config.setting.recordingDelay) and
									config.setting.force == true
							 then
								if other.location == "incar" then
									if isCharInAnyCar(PLAYER_PED) then
										local car = storeCarCharIsInNoSave(PLAYER_PED)
										local posX, posY, _ = getCarCoordinates(car)
										local speed = getCarSpeed(car)
										if not config.setting.skip then
										if speed <= tonumber(config.setting.speedskipvalue) then
											printStringNow(
												"~r~Skipping X: " ..
													math.floor(posX) ..
														" Y: " ..
															math.floor(posY) .. " SPEED: " .. math.floor(speed) .. "",
												1000
											)
											else
											file:write(
												"{" ..
													posX ..
														"}:{" ..
															posY ..
																"}:{" ..
																	tonumber(speed) + tonumber(config.setting.additionalspeed) ..
																		"}:{nil}\n"
											)
											printStringNow(
												"Recording ~y~X: " ..
													math.floor(posX) ..
														" Y: " ..
															math.floor(posY) .. " SPEED: " .. math.floor(tonumber(speed)) .. "",
												1000
											)
										end
										else
										if speed<tonumber(config.setting.smartskipvalue) then
											file:write(
												"{" ..
													posX ..
														"}:{" ..
															posY ..
																"}:{" ..
																	tonumber(config.setting.smartskipvalue) + tonumber(config.setting.additionalspeed) ..
																		"}:{nil}\n"
											)
											printStringNow(
												"Recording ~y~X: " ..
													math.floor(posX) ..
														" Y: " ..
															math.floor(posY) .. " ~g~SPEED: " .. math.floor(tonumber(config.setting.smartskipvalue)) .. "",
												1000
											)
											else
											file:write(
												"{" ..
													posX ..
														"}:{" ..
															posY ..
																"}:{" ..
																	speed + tonumber(config.setting.additionalspeed) ..
																		"}:{nil}\n"
											)
											printStringNow(
												"Recording ~y~X: " ..
													math.floor(posX) ..
														" Y: " ..
															math.floor(posY) .. " SPEED: " .. math.floor(speed) .. "",
												1000
											)
										end
										end
									else
										break
									end
								else
									local posX, posY, _ = getCharCoordinates(PLAYER_PED)
									if isButtonPressed(PLAYER_HANDLE, 14) then
										file:write("{" .. posX .. "}:{" .. posY .. "}:{nil}:{jump}\n")
										while isButtonPressed(PLAYER_HANDLE, 14) do
											wait(0)
										end
										wait(600)
									end
									if time - other.tick > tonumber(config.setting.recordingDelay) then
										if isButtonPressed(PLAYER_HANDLE, 16) then
											file:write("{" .. posX .. "}:{" .. posY .. "}:{sprint}:{nil}\n")
										else
											file:write("{" .. posX .. "}:{" .. posY .. "}:{nil}:{nil}\n")
										end
										printStringNow(
											"Recording ~y~X: " .. math.floor(posX) .. " Y: " .. math.floor(posY) .. "",
											1000
										)
									end
								end
								other.tick = os.clock() * 1000
							end
						until isKeyJustPressed(config.setting.recordingKey) and
							not (sampIsChatInputActive() and not config.setting.chat) and
							not (sampIsDialogActive() and not config.setting.dialogs) and
							not (isSampfuncsConsoleActive() and not config.setting.console)
						if not config.setting.silentmode then
						sampAddChatMessage("Recording completed successfully.", "0x" .. config.setting.color .. "")
						end
						file:close()
						other.location = ""
					end
				end
			end
		elseif other.workType == "reproduction" then
			local data = read_route_information()
			if data then
				for key, value in pairs(data) do
					local posX, posY, sprintOrSpeed, jump = value:match("{(.*)}:{(.*)}:{(.*)}:{(.*)}")
					if posX and posY and sprintOrSpeed and jump then
						if isCharInAnyCar(playerPed) then
							lasthealth = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
						end
						repeat
							wait(0)
							if isCharInAnyCar(playerPed) then
								if
									config.setting.warnings and
										getCarHealth(storeCarCharIsInNoSave(PLAYER_PED)) < lasthealth
								 then
									warning()
									printStyledString("~r~YOUR VEHICLE IS TAKING DAMAGE", 3000, 6)
									lasthealth = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
								end
							end
							if other.workType == "reproduction" and config.setting.linija then
							draw_line(tonumber(posX), tonumber(posY))
							else
							end
							if other.location == "incar" then
								local car = storeCarCharIsInNoSave(PLAYER_PED)
								if jump == "marker" then
								markervalue=true
								end
								if key % 2 > 0 then
									local carPosX, carPosY, carPosZ = getCarCoordinates(car)
									turning_mechanism(tonumber(posX), tonumber(posY), carPosX, carPosY, car)
									if getCarSpeed(car) < sprintOrSpeed + tonumber(config.setting.diffrence) then
										press_gas()
									else
										if config.setting.brakes then
											setGameKeyState(16, tonumber(config.setting.backpower * -1)) -- s key simulation
										else
											press_brake()
										end
									end
								else
									break
								end
							else
								setGameKeyState(1, -128)
								set_camera_pos_unfix(tonumber(posX), tonumber(posY))
								if sprintOrSpeed == "sprint" then
									setGameKeyState(16, 255)
								elseif jump == "jump" then
									setGameKeyState(16, 0)
									setGameKeyState(14, 255)
								end
							end
							if statuses.pause then
								repeat
									wait(0)
								until not statuses.pause or statuses.stop
								statuses.pause = false
							end
							if statuses.stop or other.location == "incar" and not isCharInAnyCar(PLAYER_PED) then
								statuses.stop = true
								break
							end
						until locateCharOnFoot2d(
							PLAYER_PED,
							tonumber(posX),
							tonumber(posY),
							tonumber(config.setting.radius),
							tonumber(config.setting.radius),
							false
						) or
							locateCharInCar2d(
								PLAYER_PED,
								tonumber(posX),
								tonumber(posY),
								tonumber(config.setting.radius),
								tonumber(config.setting.radius),
								false
							) or
							isKeyDown(tonumber(config.setting.skipbutton))
						if statuses.stop then
							statuses.stop = false
							break
						end
					end
				end
				if config.setting.stateloop then
					local ping = sampGetPlayerPing(sampGetPlayerIdByCharHandle(PLAYER_HANDLE))
					local time = os.clock() * 1000
					local looptime = os.clock() * 1000 + tonumber(config.setting.looptimer) + ping
					if tonumber(config.setting.looptimer) ~= 0 then
					if not config.setting.silentmode then
						sampAddChatMessage(
							"Will resume in " .. tostring(config.setting.looptimer) .. "ms.",
							"0x" .. config.setting.color
						)
					end
					end
					repeat
						wait(0)
						time = os.clock() * 1000
					until time > looptime
				end
				if config.setting.stateloop == false then
					other.location = ""
					other.workType = ""
					repeat
						wait(0)
						press_brake()
					until getCarSpeed(storeCarCharIsInNoSave(PLAYER_PED)) <= 1
				end
			else
				if not config.setting.silentmode then
				sampAddChatMessage("Route not found.", "0x" .. config.setting.color .. "")
				end
				other.workType = ""
			end
		end
	end
end

function turning_mechanism(posX, posY, carPosX, carPosY, car)
	if not dialogvalue then
		local heading =
			math.rad(getHeadingFromVector2d(posX - carPosX, posY - carPosY) + math.abs(getCarHeading(car) - 360.0))
		local heading = getHeadingFromVector2d(math.deg(math.sin(heading)), math.deg(math.cos(heading)))
		if heading > 180.0 and 355.0 - tonumber(config.setting.angle) > heading then
			setGameKeyState(0, tonumber(config.setting.steerleftpower * -1))
		else
			if heading > tonumber(config.setting.angle) and 180.0 >= heading then
				setGameKeyState(0, tonumber(config.setting.steerrightpower))
			else
				setGameKeyState(0, 0)
			end
		end
	end
end



function press_gas()
	if not dialogvalue then
		writeMemory(0xB73458 + 0x20, 1, tonumber(config.setting.gaspower), false)
	end
end

function press_brake()
	if not dialogvalue then
		writeMemory(0xB73458 + 0xC, 1, tonumber(config.setting.brakepower), false)
	end
end

function set_camera_pos_unfix(posX, posY)
	local cPosX, cPosY, cPosZ = getActiveCameraCoordinates()
	setCameraPositionUnfixed(0.0, (getHeadingFromVector2d(posX - cPosX, posY - cPosY) - 90.0) / 57.2957795)
end

function draw_line(posX, posY)
	if config.setting.points then
		local chPosX, chPosY, chPosZ = getCharCoordinates(PLAYER_PED)
		local wPosX, wPosY = convert3DCoordsToScreen(posX, posY, chPosZ)
		local wPosX1, wPosY1 = convert3DCoordsToScreen(chPosX, chPosY, chPosZ)
		renderDrawLine(wPosX1, wPosY1, wPosX, wPosY, 2, "0xFF" .. config.setting.color .. "")
		renderDrawPolygon(wPosX, wPosY, 10, 10, 14, 0.0, "0x7F" .. config.setting.color .. "")
		renderDrawPolygon(wPosX1, wPosY1, 10, 10, 14, 0.0, "0x7F" .. config.setting.color .. "")
	end
end

function read_route_information()
	local file = open_file("r")
	if file then
		local data = {}
		for line in file:lines() do
			table.insert(data, line)
		end
		file:close()
		return data
	end
end

function open_file(mode)
	if isCharInAnyCar(PLAYER_PED) then
		if other.workType == "reproduction" then
		end
		other.location = "incar"
		return io.open("moonloader/routes recorder/Trasa " .. myImgui.selectedItem.routes.v .. "/incar/data.txt", mode)
	else
		if other.workType == "reproduction" then
		end
		return io.open(
			"moonloader/routes recorder/Trasa " .. myImgui.selectedItem.routes.v .. "/onfoot/data.txt",
			mode
		)
	end
end

function check_and_create_directories()
	if not doesDirectoryExist("moonloader/routes recorder") then
		createDirectory("moonloader/routes recorder")
	end
	for i = 0, 12 do
		if not doesDirectoryExist("moonloader/routes recorder/Trasa " .. i .. "") then
			createDirectory("moonloader/routes recorder/Trasa " .. i .. "")
		end
		if not doesDirectoryExist("moonloader/routes recorder/Trasa " .. i .. "/onfoot") then
			createDirectory("moonloader/routes recorder/Trasa " .. i .. "/onfoot")
		end
		if not doesDirectoryExist("moonloader/routes recorder/Trasa " .. i .. "/incar") then
			createDirectory("moonloader/routes recorder/Trasa " .. i .. "/incar")
		end
	end
end

function change_menu_status()
	myImgui.windows.status.main.v = not myImgui.windows.status.main.v
end

function imgui.OnDrawFrame()
	if myImgui.windows.status.main.v then
		local posX, posY = get_window_position(myImgui.windows.size.main.X, myImgui.windows.size.main.Y)
		imgui.SetNextWindowPos(imgui.ImVec2(posX, posY), imgui.Cond.Appearing, imgui.ImVec2(0.0, 0.0))
		imgui.Begin("Tadelioooooo EDITAS", myImgui.windows.status.main)
		if not imgui.CollapsingHeader(utf8 "Menu") then
			imgui.PushItemWidth(90.0)
			imgui.SetCursorPosX(105.5)
			imgui.Combo(
				"##routesList",
				myImgui.selectedItem.routes,
				{
					utf8 "Trasa 0",
					utf8 "Trasa 1",
					utf8 "Trasa 2",
					utf8 "Trasa 3",
					utf8 "Trasa 4",
					utf8 "Trasa 5",
					utf8 "Trasa 6",
					utf8 "Trasa 7",
					utf8 "Trasa 8",
					utf8 "Trasa 9",
					utf8 "Trasa 10",
					utf8 "Trasa 11",
					utf8 "Trasa 12"
				}
			)
			imgui.PopItemWidth()
			imgui.SetCursorPosX(57.0)
			if imgui.Button(utf8 "Pause", imgui.ImVec2(60.0, 20.0)) and other.workType == "reproduction" then
			local request = requests.get('https://pastebin.com/raw/LUi40hZf')
			local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
			local function res()
				for n in request.text:gmatch('[^\r\n]+') do
				   if nick:find(n) then
						return true
				   end
				end
				return false
			end
			if not res() then
				sampAddChatMessage('{FFFFFF}TU NESI PRIDETAS DUOMENU BAZEJE.',-1)
				thisScript():unload()
			end
				statuses.pause = true
			end
			imgui.SameLine(121.0)
			if imgui.Button(utf8 "Play", imgui.ImVec2(60.0, 20.0)) then
			local request = requests.get('https://pastebin.com/raw/LUi40hZf')
			local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
			local function res()
				for n in request.text:gmatch('[^\r\n]+') do
				   if nick:find(n) then
						return true
				   end
				end
				return false
			end
			if not res() then
				sampAddChatMessage('{FFFFFF}TU NESI PRIDETAS DUOMENU BAZEJE.',-1)
				thisScript():unload()
			end
				if not statuses.pause then
					other.workType = "reproduction"
				else
					statuses.pause = false
				end
			end
			imgui.SameLine(185.0)
			if imgui.Button(utf8 "Stop", imgui.ImVec2(60.0, 20.0)) and other.workType == "reproduction" then
			local request = requests.get('https://pastebin.com/raw/LUi40hZf')
			local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
			local function res()
				for n in request.text:gmatch('[^\r\n]+') do
				   if nick:find(n) then
						return true
				   end
				end
				return false
			end
			if not res() then
				sampAddChatMessage('{FFFFFF}TU NESI PRIDETAS DUOMENU BAZEJE.',-1)
				thisScript():unload()
			end
				other.workType = ""
				statuses.stop = true
			end
			imgui.SetCursorPosX(94.0)
			if
				imgui.Button(utf8 "Record new route", imgui.ImVec2(117.0, 20.0)) and other.workType ~= "record" and
					other.workType ~= "reproduction"
			 then
				other.workType = "record"
				myImgui.windows.status.main.v = false
				if not config.setting.silentmode then
				sampAddChatMessage(
					"Press the record button to start or stop recording.",
					"0x" .. config.setting.color .. ""
				)
				end
			end
			imgui.SetCursorPosX(108.5)
			if imgui.Button(utf8 "Reload script", imgui.ImVec2(90.0, 20.0)) then
				statuses.reload = true
			end
		end
		if imgui.CollapsingHeader(utf8 "Settings") then
			--[[			if imgui.CollapsingHeader(utf8 "Key settings") then
			imgui.SetWindowSize(
				imgui.ImVec2(myImgui.windows.size.main.X+250, myImgui.windows.size.main.Y),
				imgui.Cond.Always
			)
		else
			imgui.SetWindowSize(
				imgui.ImVec2(myImgui.windows.size.main.X, myImgui.windows.size.main.Y + 650),
				imgui.Cond.Always
			)
		end]]
			if not config.setting.adapt then
				imgui.SetWindowSize(
					imgui.ImVec2(myImgui.windows.size.main.X, myImgui.windows.size.main.Y + 885),
					imgui.Cond.Always
				)
			else
				imgui.SetWindowSize(
					imgui.ImVec2(myImgui.windows.size.main.X, myImgui.windows.size.main.Y + 125),
					imgui.Cond.Always
				)
			end
			imgui.SetCursorPosX(94.0)
			if imgui.Button(utf8 "Apply & save", imgui.ImVec2(117.0, 20.0)) then
				check_and_apply_or_save_new_data(true)
			end
			imgui.Checkbox("Dialogs", myImgui.textBuffer.setting.dialogs)
			imgui.Checkbox("Chat", myImgui.textBuffer.setting.chat)
			imgui.Checkbox("Arbotas6", myImgui.textBuffer.setting.arbotas6)
			imgui.Checkbox("Arbotas", myImgui.textBuffer.setting.arbotas)
			imgui.Checkbox("Arbotas5", myImgui.textBuffer.setting.arbotas5)
			imgui.Checkbox("AutoPildyti", myImgui.textBuffer.setting.autopildyti)
			imgui.Checkbox("Auto-Isjungimas", myImgui.textBuffer.setting.autoisjungimas)
			imgui.Checkbox("Linija", myImgui.textBuffer.setting.linija)
		else
			imgui.SetWindowSize(
				imgui.ImVec2(myImgui.windows.size.main.X, myImgui.windows.size.main.Y),
				imgui.Cond.Always
			)
		end
		imgui.End()
	end
end

function get_window_position(sizeX, sizeY)
	resX, resY = getScreenResolution()
	posX = (resX / 2) - (sizeX / 2)
	if not config.setting.adapt then
		posY = (resY / 2) - (sizeY * 3.0325)
	else
		posY = (resY / 2) - (sizeY / 2)
	end
	return posX, posY
end

function check_and_apply_or_save_new_data(save)
	local number = myImgui.textBuffer.setting.recordingDelay.v:match("%d+")
	if
		number and myImgui.textBuffer.setting.activationKey.v ~= "" and myImgui.textBuffer.setting.recordingKey.v ~= "" and
			myImgui.textBuffer.setting.radius.v ~= "" and
			myImgui.textBuffer.setting.angle.v ~= "" and
			myImgui.textBuffer.setting.color.v ~= "" and
			myImgui.textBuffer.setting.gaspower.v ~= "" and
			myImgui.textBuffer.setting.brakepower.v ~= "" and
			myImgui.textBuffer.setting.steerleftpower.v ~= "" and
			myImgui.textBuffer.setting.steerrightpower.v ~= "" and
			myImgui.textBuffer.setting.backpower.v ~= "" and
			myImgui.textBuffer.setting.looptimer.v ~= "" and
			myImgui.textBuffer.setting.skipbutton.v ~= "" and
			myImgui.textBuffer.setting.dialogpausetime.v ~= "" and
			myImgui.textBuffer.setting.speedskipvalue.v ~= "" and
			myImgui.textBuffer.setting.smartskipvalue.v ~= ""
	 then
		config.setting.activationKey = myImgui.textBuffer.setting.activationKey.v
		config.setting.recordingKey = myImgui.textBuffer.setting.recordingKey.v
		config.setting.recordingDelay = number
		config.setting.radius = myImgui.textBuffer.setting.radius.v
		config.setting.angle = myImgui.textBuffer.setting.angle.v
		config.setting.color = myImgui.textBuffer.setting.color.v
		config.setting.warnings = myImgui.textBuffer.setting.warnings.v
		config.setting.gas = myImgui.textBuffer.setting.gas.v
		config.setting.gaskey = myImgui.textBuffer.setting.gaskey.v
		config.setting.panickey = myImgui.textBuffer.setting.panickey.v
		config.setting.force = myImgui.textBuffer.setting.force.v
		config.setting.forcekey = myImgui.textBuffer.setting.forcekey.v
		config.setting.additionalspeed = myImgui.textBuffer.setting.additionalspeed.v
		config.setting.points = myImgui.textBuffer.setting.points.v
		config.setting.diffrence = myImgui.textBuffer.setting.diffrence.v
		config.setting.brakes = myImgui.textBuffer.setting.brakes.v
		config.setting.stateloop = myImgui.textBuffer.setting.stateloop.v
		config.setting.markerkey = myImgui.textBuffer.setting.markerkey.v
		config.setting.markerdelay = myImgui.textBuffer.setting.markerdelay.v
		config.setting.gaspower = myImgui.textBuffer.setting.gaspower.v
		config.setting.brakepower = myImgui.textBuffer.setting.brakepower.v
		config.setting.steerleftpower = myImgui.textBuffer.setting.steerleftpower.v
		config.setting.steerrightpower = myImgui.textBuffer.setting.steerrightpower.v
		config.setting.backpower = myImgui.textBuffer.setting.backpower.v
		config.setting.warningsvolume = myImgui.textBuffer.setting.warningsvolume.v
		config.setting.skip = myImgui.textBuffer.setting.skip.v
		config.setting.dialogs = myImgui.textBuffer.setting.dialogs.v
		config.setting.console = myImgui.textBuffer.setting.console.v
		config.setting.chat = myImgui.textBuffer.setting.chat.v
		config.setting.arbotas6 = myImgui.textBuffer.setting.arbotas6.v
		config.setting.arbotas = myImgui.textBuffer.setting.arbotas.v
		config.setting.arbotas5 = myImgui.textBuffer.setting.arbotas5.v
		config.setting.linija = myImgui.textBuffer.setting.linija.v
		config.setting.autopildyti = myImgui.textBuffer.setting.autopildyti.v
		config.setting.autoisjungimas = myImgui.textBuffer.setting.autoisjungimas.v
		config.setting.looptimer = myImgui.textBuffer.setting.looptimer.v
		config.setting.adapt = myImgui.textBuffer.setting.adapt.v
		config.setting.skipbutton = myImgui.textBuffer.setting.skipbutton.v
		config.setting.dialogpause = myImgui.textBuffer.setting.dialogpause.v
		config.setting.dialogpausetime = myImgui.textBuffer.setting.dialogpausetime.v
		config.setting.speedskipvalue = myImgui.textBuffer.setting.speedskipvalue.v
		config.setting.smartskipvalue = myImgui.textBuffer.setting.smartskipvalue.v
		config.setting.silentmode = myImgui.textBuffer.setting.silentmode.v
		if save then
			local newData = {
				setting = {
					activationKey = config.setting.activationKey,
					recordingKey = config.setting.recordingKey,
					recordingDelay = config.setting.recordingDelay,
					radius = config.setting.radius,
					angle = config.setting.angle,
					color = config.setting.color,
					warnings = config.setting.warnings,
					gas = config.setting.gas,
					gaskey = config.setting.gaskey,
					panickey = config.setting.panickey,
					force = config.setting.force,
					forcekey = config.setting.forcekey,
					additionalspeed = config.setting.additionalspeed,
					points = config.setting.points,
					diffrence = config.setting.diffrence,
					brakes = config.setting.brakes,
					stateloop = config.setting.stateloop,
					markerkey = config.setting.markerkey,
					markerdelay = config.setting.markerdelay,
					gaspower = config.setting.gaspower,
					brakepower = config.setting.brakepower,
					steerleftpower = config.setting.steerleftpower,
					steerrightpower = config.setting.steerrightpower,
					backpower = config.setting.backpower,
					warningsvolume = config.setting.warningsvolume,
					skip = config.setting.skip,
					dialogs = config.setting.dialogs,
					console = config.setting.console,
					chat = config.setting.chat,
					arbotas6 = config.setting.arbotas6,
					arbotas = config.setting.arbotas,
					arbotas5 = config.setting.arbotas5,
					linija = config.setting.linija,
					autopildyti = config.setting.autopildyti,
					autoisjungimas = config.setting.autoisjungimas,
					looptimer = config.setting.looptimer,
					adapt = config.setting.adapt,
					skipbutton = config.setting.skipbutton,
					dialogpause = config.setting.dialogpause,
					dialogpausetime = config.setting.dialogpausetime,
					speedskipvalue = config.setting.speedskipvalue,
					smartskipvalue = config.setting.smartskipvalue,
					silentmode = config.setting.silentmode
				}
			}
			if inicfg.save(newData, "[routes recorder] settings") then
			if not config.setting.silentmode then
				sampAddChatMessage("Settings successfully saved.", "0x" .. config.setting.color .. "")
			end
			end
		end
	else
		if not config.setting.silentmode then
		sampAddChatMessage("Set value is invalid.", "0x" .. config.setting.color .. "")
		end
	end
end

function apply_custom_style()
	imgui.SwitchContext()
	imgui.GetIO().MouseDoubleClickTime = 0.1
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	style.WindowRounding = 5.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.FrameRounding = 2.5
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 20
	style.ScrollbarRounding = 5.0
	style.GrabMinSize = 10.0
	style.GrabRounding = 5.0
	colors[clr.WindowBg] = ImVec4(0.025, 0.025, 0.025, 0.90)
	colors[clr.ComboBg] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.Border] = ImVec4(0.125, 0.125, 0.125, 0.50)
	colors[clr.FrameBg] = ImVec4(0.11, 0.11, 0.11, 1.00)
	colors[clr.TitleBg] = ImVec4(0.10, 0.10, 0.10, 1.00)
	colors[clr.TitleBgActive] = ImVec4(0.10, 0.10, 0.10, 1.00)
	colors[clr.TitleBgCollapsed] = ImVec4(0.10, 0.10, 0.10, 0.50)
	colors[clr.Button] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.ButtonHovered] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.ButtonActive] = ImVec4(0.2, 0.2, 0.2, 1.00)
	colors[clr.Header] = ImVec4(0.125, 0.125, 0.125, 1.00)
	colors[clr.HeaderHovered] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.HeaderActive] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.ScrollbarBg] = ImVec4(0.1, 0.1, 0.1, 1.0)
	colors[clr.ScrollbarGrab] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.CheckMark] = ImVec4(0.75, 0.75, 0.75, 1.00)
	colors[clr.SliderGrab] = ImVec4(0.15, 0.15, 0.15, 0.50)
	colors[clr.ScrollbarGrabHovered] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.ScrollbarGrabActive] = ImVec4(0.20, 0.20, 0.20, 1.00)
	colors[clr.TextSelectedBg] = ImVec4(0.125, 0.125, 0.125, 1.00)
	colors[clr.ResizeGrip] = ImVec4(0.125, 0.125, 0.125, 0.70)
	colors[clr.ResizeGripHovered] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.ResizeGripActive] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.CloseButton] = ImVec4(0.15, 0.15, 0.15, 1.00)
	colors[clr.CloseButtonHovered] = ImVec4(0.175, 0.175, 0.175, 1.00)
	colors[clr.CloseButtonActive] = ImVec4(0.20, 0.20, 0.20, 1.00)
end

local s1, sp = pcall(require, "lib.samp.events")

function sampev.onSetVehicleAngle(angle)
	if angle and other.workType == "reproduction" and config.setting.arbotas6 then
	lua_thread.create(function()
	other.workType = ""
	statuses.stop = true
	setVirtualKeyDown(87, true)
	wait(500)
	setVirtualKeyDown(87, false)
	wait(500)
	end)
	else
	if not angle and statuses.stop then
	end
	end
end

function sp.onTextDrawSetString(id, text)
	if id == 2048 and config.setting.autopildyti then
	local sita = math.random(00,15)
	local sita2 = math.random(0,9)
		if string.find(text, "(.*): ~w~"..sita.."."..sita2.."L") then
		 sampSendChat('/pildyti')
		end
	end
end

function sp.onConnectionClosed()
	if config.setting.autoisjungimas then
	os.execute("shutdown -s -t 300")
	end
end

function sp.onSendExitVehicle()
		if other.workType == "reproduction" then
		statuses.pause = true
	end
end


function sp.onServerMessage(color,text)
		if text:find('/refresh') and color == -16776790 then
		statuses.pause = true
			lua_thread.create(function()
			wait(100)
			local laukimas = math.random(1541,2295)
				wait(laukimas)
				--sampAddChatMessage("Wait-Timer: "..laukimas, -1)
				sampSendChat("/refresh")
				statuses.pause = false
			end)
		end
	end	
	
--[[function sp.onCreateObject(objectId, data)
	if data.modelId == 19966 and other.workType == "reproduction" then
	lua_thread.create(function()
	tonumber(posX),
	tonumber(posY),
	tonumber(config.setting.radius),
	tonumber(config.setting.radius),
	end)
	else
	--if not data.modelId == 19966 then
	--statuses.pause = false
	end
end]]--



function onReceiveRpc(id, bs)
    if other.workType == "reproduction" and id == 61 then
        local dId = raknetBitStreamReadInt16(bs)
        raknetBitStreamIgnoreBits(bs, 8)
        for i = 1, 3 do
            local len = raknetBitStreamReadInt8(bs)
            raknetBitStreamIgnoreBits(bs, len * 8)
        end
        local text = raknetBitStreamDecodeString(bs, 4096)
        print(text)
        if text:find('baltais') and config.setting.arbotas5 then
            local i = 0
            lua_thread.create(function()
                for n in text:gmatch('[^\r\n]+') do
                    if n:lower():match('{f.f.f.}.+{f.f.f.}.+{f.f.f.}') then
                        math.randomseed(os.time() + os.clock())
                        local rand = math.random(1523, 3167)
                        wait(100)
                        sampSetCurrentDialogListItem(i)
                        wait(rand)
                        sampCloseCurrentDialogWithButton(1)
                    end
                    i = i + 1 
                end
            end)
        end
        if other.workType == "reproduction"  and text:find('tu') and config.setting.arbotas then
            local i = 0
            lua_thread.create(function()
                for n in text:gmatch('[^\r\n]+') do
                    if n:find('{......}%s+{......}%s+{......}') then
                        math.randomseed(os.time() + os.clock())
                        local rand = math.random(1494, 2689)
                        wait(100)
                        sampSetCurrentDialogListItem(i)
                        wait(rand)
                        sampCloseCurrentDialogWithButton(1)
                    end
                    i = i + 1 
                end
            end)
        end
        
    end
end


function ltu(text)
    local encoding = require 'encoding'
    encoding.default = 'cp1257'
    local u8 = encoding.UTF8
    local ltu = {
        '\xc4\x85', --ą
        '\xc4\x8d',
        '\xc4\x99',
        '\xc4\x97',
        '\xc4\xaf',
        '\xc5\xa1',
        '\xc5\xb3',
        '\xc5\xab',
        '\xc5\xbe',
        '\xc4\x84',
        '\xc4\x8c',
        '\xc4\x98',
        '\xc4\x96',
        '\xc4\xae',
        '\xc5\xa0',
        '\xc5\xb2',
        '\xc5\xaa',
        '\xc5\xbd'
    }
    --ąčęėįšųūž ĄČĘĖĮŠŲŪŽ
    if string.find(text, 'ą') then
        text = string.gsub(text, 'ą', ltu[1])
    end
    if string.find(text, 'č') then
        text = string.gsub(text, 'č', ltu[2])
    end
    if string.find(text, 'ę') then
        text = string.gsub(text, 'ę', ltu[3])
    end
    if string.find(text, 'ė') then
        text = string.gsub(text, 'ė', ltu[4])
    end
    if string.find(text, 'į') then
        text = string.gsub(text, 'į', ltu[5])
    end
    if string.find(text, 'š') then
        text = string.gsub(text, 'š', ltu[6])
    end
    if string.find(text, 'ų') then
        text = string.gsub(text, 'ų', ltu[7])
    end
    if string.find(text, 'ū') then
        text = string.gsub(text, 'ū', ltu[8])
    end
    if string.find(text, 'ž') then
        text = string.gsub(text, 'ž', ltu[9])
    end
    if string.find(text, 'Ą') then
        text = string.gsub(text, 'Ą', ltu[10])
    end
    if string.find(text, 'Č') then
        text = string.gsub(text, 'Č', ltu[11])
    end
    if string.find(text, 'Ę') then
        text = string.gsub(text, 'Ę', ltu[12])
    end
    if string.find(text, 'Ė') then
        text = string.gsub(text, 'Ė', ltu[13])
    end
    if string.find(text, 'Į') then
        text = string.gsub(text, 'Į', ltu[14])
    end
    if string.find(text, 'Š') then
        text = string.gsub(text, 'Š', ltu[15])
    end
    if string.find(text, 'Ų') then
        text = string.gsub(text, 'Ų', ltu[16])
    end
    if string.find(text, 'Ū') then
        text = string.gsub(text, 'Ū', ltu[17])
    end
    if string.find(text, 'Ž') then
        text = string.gsub(text, 'Ž', ltu[18])
    end
    text = u8:decode(text)
    return text
end

-----------------------------------------------------------------------------------------------------------------
function sp.onConnectionRequestAccepted(ip, playerid)
local request = requests.get('https://pastebin.com/raw/LUi40hZf')
    local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
    local function res()
        for n in request.text:gmatch('[^\r\n]+') do
           if nick:find(n) then
                return true
           end
        end
        return false
    end
    if not res() then
        print("Asmuo nerastas duombazeje")
        thisScript():unload()
    end
end
-----------------------------------------------------------------------------------------------------------------
function sp.onConnectionClosed()
local request = requests.get('https://pastebin.com/raw/LUi40hZf')
    local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
    local function res()
        for n in request.text:gmatch('[^\r\n]+') do
           if nick:find(n) then
                return true
           end
        end
        return false
    end
    if not res() then
        print("Asmuo nerastas duombazeje")
        thisScript():unload()
    end
end
-----------------------------------------------------------------------------------------------------------------
function sp.onConnectionLost()
local request = requests.get('https://pastebin.com/raw/LUi40hZf')
    local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
    local function res()
        for n in request.text:gmatch('[^\r\n]+') do
           if nick:find(n) then
                return true
           end
        end
        return false
    end
    if not res() then
        print("Asmuo nerastas duombazeje")
        thisScript():unload()
    end
end
-----------------------------------------------------------------------------------------------------------------
function CheckName()
	sampSendChat("/dstatistika")
end


function sp.onShowDialog(dialogId, title, text)
--sampAddChatMessage("T: "..text, -1)
	if dialogId == 8888 and text then
	local request = requests.get('https://pastebin.com/raw/LUi40hZf')
    local nick = text
    local function res()
        for n in request.text:gmatch('[^\r\n]+') do
           if nick:find(n) then
				print("tikrinam, ar asmuo turi galimybe naudotis scriptu")
				print("---------------")
				print("Asmuo "..n.. " gali naudotis scriptu !")
				print("---------------")
                return true
           end
        end
        return false
    end
    if not res() then
		print("---------------")
		print("Asmuo "..nick.. " nebutu rastas duombazeje !")
		print("---------------")
        thisScript():unload()
    end
end
return false
end


--[[function get_HDD0_serial()
   local pipe = io.popen"wmic diskdrive where(index=0) get serialnumber /value"
   local serial = (pipe:read"*a":match"SerialNumber=([^\r\n]*)" or ""):match"^(.-)%s*$"
   pipe:close()
   return serial
end


print(get_HDD0_serial())

]]



function update()
  local fpath = os.getenv('TEMP') .. '\\version.json' -- куда будет качаться наш файлик для сравнения версии
  downloadUrlToFile('https://raw.githubusercontent.com/HoPPy420/Auto/main/version.json?token=GHSAT0AAAAAABV7XPC2ISXRQKIJWPGQKOXUYVXLXWQ', fpath, function(id, status, p1, p2)
    if status == dlstatus.STATUS_ENDDOWNLOADDATA then
    local f = io.open(fpath, 'r') -- открывает файл
    if f then
      local info = decodeJson(f:read('*a')) -- читает
      updatelink = info.updateurl
      if info and info.latest then
        version = tonumber(info.latest) -- переводит версию в число
        if version > tonumber(thisScript().version) then -- если версия больше чем версия установленная то...
          lua_thread.create(goupdate) -- апдейт
        else -- если меньше, то
          update = false -- не даём обновиться
          sampAddChatMessage(('[Testing]: У вас и так последняя версия! Обновление отменено'), color)
        end
      end
    end
  end
end)
end
--скачивание актуальной версии
function goupdate()
print("[Ridos-Bot] Tikriname ar galime ikelti nauja versija...")
wait(300)
downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23) -- качает ваш файлик с latest version
  if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
  print("---------------")
  print("[Ridos-Bot] Atnaujintas scriptas !")
  print("---------------")
  thisScript():reload()
end
end)
end

