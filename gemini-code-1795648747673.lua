-- BY Supremo Gestao v5.6 - Zero Delay + Toggle ESP + Auto-Textura Novas Paredes + 50 Texturas
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

for _, name in ipairs({"SUPREMO_PANEL_GUI", "DARK_LAG_HUB", "DARK_LAG_FPS"}) do
	local old = playerGui:FindFirstChild(name)
	if old then
		pcall(function() old:Destroy() end)
	end
end

local TEXTURE_PRESETS = {
	{ name = "Azul + Rosa", color = Color3.fromRGB(235, 85, 175), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(165, 95, 145), fog = Color3.fromRGB(68, 16, 48), brightness = 1.35 },
	{ name = "Neon Roxo", color = Color3.fromRGB(170, 55, 255), material = Enum.Material.Neon, ambient = Color3.fromRGB(120, 70, 190), fog = Color3.fromRGB(35, 12, 65), brightness = 1.25 },
	{ name = "Ciano Cyber", color = Color3.fromRGB(0, 235, 255), material = Enum.Material.Neon, ambient = Color3.fromRGB(70, 165, 195), fog = Color3.fromRGB(10, 42, 65), brightness = 1.3 },
	{ name = "Verde Toxina", color = Color3.fromRGB(75, 255, 115), material = Enum.Material.Neon, ambient = Color3.fromRGB(85, 170, 105), fog = Color3.fromRGB(14, 52, 24), brightness = 1.25 },
	{ name = "Vermelho Carmim", color = Color3.fromRGB(235, 45, 75), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(175, 85, 95), fog = Color3.fromRGB(65, 12, 20), brightness = 1.25 },
	{ name = "Ouro Real", color = Color3.fromRGB(255, 195, 45), material = Enum.Material.Metal, ambient = Color3.fromRGB(185, 155, 90), fog = Color3.fromRGB(62, 46, 12), brightness = 1.3 },
	{ name = "Gelo Polar", color = Color3.fromRGB(185, 235, 255), material = Enum.Material.Ice, ambient = Color3.fromRGB(150, 195, 220), fog = Color3.fromRGB(32, 65, 92), brightness = 1.4 },
	{ name = "Lava Magma", color = Color3.fromRGB(255, 95, 20), material = Enum.Material.CrackedLava, ambient = Color3.fromRGB(185, 95, 65), fog = Color3.fromRGB(68, 22, 8), brightness = 1.2 },
	{ name = "Obsidiana Dark", color = Color3.fromRGB(32, 28, 42), material = Enum.Material.Slate, ambient = Color3.fromRGB(85, 75, 105), fog = Color3.fromRGB(15, 12, 22), brightness = 1.05 },
	{ name = "Marmore Branco", color = Color3.fromRGB(242, 242, 248), material = Enum.Material.Marble, ambient = Color3.fromRGB(205, 205, 215), fog = Color3.fromRGB(85, 85, 100), brightness = 1.35 },
	{ name = "Aco Escovado", color = Color3.fromRGB(145, 155, 172), material = Enum.Material.CorrodedMetal, ambient = Color3.fromRGB(130, 138, 152), fog = Color3.fromRGB(38, 42, 50), brightness = 1.2 },
	{ name = "Madeira Clara", color = Color3.fromRGB(205, 155, 98), material = Enum.Material.Wood, ambient = Color3.fromRGB(175, 145, 110), fog = Color3.fromRGB(58, 42, 24), brightness = 1.25 },
	{ name = "Tabua Escura", color = Color3.fromRGB(115, 72, 42), material = Enum.Material.WoodPlanks, ambient = Color3.fromRGB(135, 105, 80), fog = Color3.fromRGB(40, 25, 15), brightness = 1.15 },
	{ name = "Grama Esmeralda", color = Color3.fromRGB(52, 205, 95), material = Enum.Material.Grass, ambient = Color3.fromRGB(105, 175, 120), fog = Color3.fromRGB(18, 56, 28), brightness = 1.3 },
	{ name = "Areia Deserto", color = Color3.fromRGB(235, 202, 125), material = Enum.Material.Sand, ambient = Color3.fromRGB(195, 175, 130), fog = Color3.fromRGB(78, 62, 32), brightness = 1.35 },
	{ name = "Concreto Limpo", color = Color3.fromRGB(165, 168, 176), material = Enum.Material.Concrete, ambient = Color3.fromRGB(155, 158, 166), fog = Color3.fromRGB(48, 50, 56), brightness = 1.2 },
	{ name = "Vidro Cristal", color = Color3.fromRGB(160, 225, 255), material = Enum.Material.Glass, ambient = Color3.fromRGB(150, 190, 215), fog = Color3.fromRGB(30, 55, 78), brightness = 1.35 },
	{ name = "Laranja Sunset", color = Color3.fromRGB(255, 125, 55), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(190, 125, 95), fog = Color3.fromRGB(72, 32, 18), brightness = 1.3 },
	{ name = "Violeta Royal", color = Color3.fromRGB(135, 65, 245), material = Enum.Material.Plastic, ambient = Color3.fromRGB(125, 95, 185), fog = Color3.fromRGB(36, 18, 66), brightness = 1.25 },
	{ name = "Menta Pastel", color = Color3.fromRGB(125, 245, 205), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(135, 195, 175), fog = Color3.fromRGB(25, 62, 52), brightness = 1.3 },
	{ name = "Rosa Choque", color = Color3.fromRGB(255, 45, 165), material = Enum.Material.Neon, ambient = Color3.fromRGB(185, 75, 140), fog = Color3.fromRGB(70, 12, 46), brightness = 1.3 },
	{ name = "Azul Eletrico", color = Color3.fromRGB(35, 120, 255), material = Enum.Material.Neon, ambient = Color3.fromRGB(80, 125, 205), fog = Color3.fromRGB(12, 28, 72), brightness = 1.3 },
	{ name = "Amarelo Laser", color = Color3.fromRGB(245, 255, 45), material = Enum.Material.Neon, ambient = Color3.fromRGB(185, 190, 85), fog = Color3.fromRGB(65, 68, 12), brightness = 1.35 },
	{ name = "Lilas Fantasma", color = Color3.fromRGB(195, 145, 255), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(155, 130, 195), fog = Color3.fromRGB(52, 35, 78), brightness = 1.3 },
	{ name = "Turquesa Abyss", color = Color3.fromRGB(20, 195, 185), material = Enum.Material.Glass, ambient = Color3.fromRGB(75, 165, 160), fog = Color3.fromRGB(12, 52, 50), brightness = 1.3 },
	{ name = "Vinho Sangue", color = Color3.fromRGB(125, 18, 38), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(125, 55, 68), fog = Color3.fromRGB(42, 8, 14), brightness = 1.15 },
	{ name = "Cobre Antigo", color = Color3.fromRGB(184, 115, 72), material = Enum.Material.Metal, ambient = Color3.fromRGB(165, 120, 92), fog = Color3.fromRGB(55, 34, 20), brightness = 1.2 },
	{ name = "Chumbo Fosco", color = Color3.fromRGB(78, 82, 92), material = Enum.Material.Slate, ambient = Color3.fromRGB(105, 110, 120), fog = Color3.fromRGB(26, 28, 34), brightness = 1.1 },
	{ name = "Neve Pura", color = Color3.fromRGB(248, 252, 255), material = Enum.Material.Snow, ambient = Color3.fromRGB(215, 225, 235), fog = Color3.fromRGB(95, 110, 125), brightness = 1.4 },
	{ name = "Pedra Vulcao", color = Color3.fromRGB(54, 42, 46), material = Enum.Material.Basalt, ambient = Color3.fromRGB(115, 85, 92), fog = Color3.fromRGB(28, 16, 20), brightness = 1.1 },
	{ name = "Arenito Dourado", color = Color3.fromRGB(218, 178, 112), material = Enum.Material.Sandstone, ambient = Color3.fromRGB(185, 160, 118), fog = Color3.fromRGB(68, 52, 28), brightness = 1.25 },
	{ name = "Asfalto Wet", color = Color3.fromRGB(45, 48, 58), material = Enum.Material.Pavement, ambient = Color3.fromRGB(95, 105, 125), fog = Color3.fromRGB(20, 24, 34), brightness = 1.15 },
	{ name = "Tijolo Vermelho", color = Color3.fromRGB(178, 68, 52), material = Enum.Material.Brick, ambient = Color3.fromRGB(155, 95, 85), fog = Color3.fromRGB(54, 20, 16), brightness = 1.2 },
	{ name = "Folhagem Limo", color = Color3.fromRGB(110, 185, 55), material = Enum.Material.LeafyGrass, ambient = Color3.fromRGB(125, 165, 85), fog = Color3.fromRGB(32, 54, 16), brightness = 1.25 },
	{ name = "Coral Vivo", color = Color3.fromRGB(255, 110, 110), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(190, 115, 115), fog = Color3.fromRGB(72, 28, 28), brightness = 1.3 },
	{ name = "Safira Profunda", color = Color3.fromRGB(24, 68, 175), material = Enum.Material.Glass, ambient = Color3.fromRGB(75, 105, 175), fog = Color3.fromRGB(10, 22, 58), brightness = 1.25 },
	{ name = "Esmeralda Real", color = Color3.fromRGB(25, 195, 115), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(80, 170, 125), fog = Color3.fromRGB(10, 56, 34), brightness = 1.3 },
	{ name = "Ameixa Escura", color = Color3.fromRGB(95, 35, 125), material = Enum.Material.Plastic, ambient = Color3.fromRGB(125, 75, 150), fog = Color3.fromRGB(34, 10, 46), brightness = 1.2 },
	{ name = "Pessego Suave", color = Color3.fromRGB(255, 185, 145), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(205, 165, 140), fog = Color3.fromRGB(78, 52, 38), brightness = 1.35 },
	{ name = "Limao Neon", color = Color3.fromRGB(165, 255, 45), material = Enum.Material.Neon, ambient = Color3.fromRGB(145, 185, 85), fog = Color3.fromRGB(45, 65, 12), brightness = 1.3 },
	{ name = "Magenta Hyper", color = Color3.fromRGB(235, 35, 235), material = Enum.Material.Neon, ambient = Color3.fromRGB(175, 75, 175), fog = Color3.fromRGB(62, 10, 62), brightness = 1.3 },
	{ name = "Prata Cromado", color = Color3.fromRGB(215, 222, 232), material = Enum.Material.Metal, ambient = Color3.fromRGB(185, 192, 202), fog = Color3.fromRGB(68, 72, 80), brightness = 1.35 },
	{ name = "Carvao Queimado", color = Color3.fromRGB(24, 22, 26), material = Enum.Material.Rock, ambient = Color3.fromRGB(75, 70, 80), fog = Color3.fromRGB(12, 10, 14), brightness = 1.05 },
	{ name = "Mostarda Retro", color = Color3.fromRGB(215, 165, 38), material = Enum.Material.Plastic, ambient = Color3.fromRGB(180, 150, 75), fog = Color3.fromRGB(66, 48, 12), brightness = 1.25 },
	{ name = "Roxo Galaxia", color = Color3.fromRGB(105, 35, 215), material = Enum.Material.Neon, ambient = Color3.fromRGB(110, 65, 185), fog = Color3.fromRGB(26, 8, 58), brightness = 1.25 },
	{ name = "Azul Celeste", color = Color3.fromRGB(115, 195, 255), material = Enum.Material.SmoothPlastic, ambient = Color3.fromRGB(145, 185, 215), fog = Color3.fromRGB(32, 58, 82), brightness = 1.35 },
	{ name = "Carmesim Escuro", color = Color3.fromRGB(155, 22, 48), material = Enum.Material.Plastic, ambient = Color3.fromRGB(145, 65, 80), fog = Color3.fromRGB(48, 8, 16), brightness = 1.15 },
	{ name = "Verde Floresta", color = Color3.fromRGB(34, 125, 58), material = Enum.Material.Grass, ambient = Color3.fromRGB(85, 135, 95), fog = Color3.fromRGB(12, 40, 20), brightness = 1.2 },
	{ name = "Bronze Medalha", color = Color3.fromRGB(168, 112, 58), material = Enum.Material.CorrodedMetal, ambient = Color3.fromRGB(155, 118, 82), fog = Color3.fromRGB(52, 34, 16), brightness = 1.2 },
	{ name = "Branco Gelo UV", color = Color3.fromRGB(235, 248, 255), material = Enum.Material.Neon, ambient = Color3.fromRGB(195, 215, 230), fog = Color3.fromRGB(72, 92, 110), brightness = 1.4 }
}

local textureIndexByName = {}
for idx, preset in ipairs(TEXTURE_PRESETS) do
	textureIndexByName[preset.name] = idx
end

local config = {
	hubActive = true,
	panelOpen = true,
	minimizedToSquare = false,

	aimAssistEnabled = true,
	punchAssistRange = 60,
	punchAssistStrength = 0.65,
	ignoreTeam = false,

	fovEnabled = true,
	fovValue = 60,
	fovRadius = 120,
	fovOpacity = 0,
	showFovCircle = false,
	fovFilled = false,

	espEnabled = true,
	espBox = false,
	espName = false,
	espDistance = false,
	espHealth = false,
	espLines = false,
	espStyle = "Cheia",
	espMaxDistance = 500,

	mapVisualsEnabled = true,
	mapTheme = "Azul + Rosa",
	lineColorPreset = "Roxo",
	lagOptEnabled = true,
	spiderVisualEnabled = true,
	dashImpulse = 64,
	dashNoclipEnabled = false,
	zeroDelayJumpEnabled = true,
	zeroDelayDashEnabled = true,
	zeroDelayPunchEnabled = true,
	activeChannel = "Aimbot"
}

local savedProfiles = {
	["Padrao"] = table.clone(config),
	["Supremo"] = table.clone(config)
}

local espHighlights = {}
local originalFov = nil
local cachedChar = nil
local cachedHum = nil
local cachedRoot = nil

local function refreshCharacterCache(char)
	cachedChar = char or player.Character
	if cachedChar then
		cachedHum = cachedChar:FindFirstChildOfClass("Humanoid")
		cachedRoot = cachedChar:FindFirstChild("HumanoidRootPart")
			or cachedChar:FindFirstChild("UpperTorso")
			or cachedChar:FindFirstChild("Torso")
	else
		cachedHum = nil
		cachedRoot = nil
	end
	return cachedChar, cachedHum, cachedRoot
end

refreshCharacterCache(player.Character)

local function getCharacterRoot(char)
	if not char then return nil end
	return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
end

local function isEnemyPlayer(targetPlayer)
	if not targetPlayer or targetPlayer == player then return false end
	if config.ignoreTeam then return true end
	local okLocal, localTeam = pcall(function() return player.Team end)
	local okTarget, targetTeam = pcall(function() return targetPlayer.Team end)
	if okLocal and okTarget and localTeam and targetTeam then
		return localTeam ~= targetTeam
	end
	return true
end

local function speedUpAnimations(hum)
	local animator = hum and hum:FindFirstChildOfClass("Animator")
	if not animator then return end
	for _, track in ipairs(animator:GetPlayingTracks()) do
		if track.Speed < 2.5 then
			track:AdjustSpeed(2.5)
		end
	end
end

local function triggerZeroDelayJump()
	if not config.hubActive or not config.zeroDelayJumpEnabled then return end
	if not cachedHum or not cachedHum.Parent or cachedHum.Parent ~= player.Character then
		refreshCharacterCache(player.Character)
	end
	local hum = cachedHum
	local root = cachedRoot
	if hum and hum.Health > 0 then
		hum.Jump = true
		hum:ChangeState(Enum.HumanoidStateType.Jumping)
		if root then
			local jumpVel = hum.UseJumpPower and hum.JumpPower or 50
			local vel = root.AssemblyLinearVelocity
			if vel.Y < jumpVel then
				root.AssemblyLinearVelocity = Vector3.new(vel.X, jumpVel, vel.Z)
			end
		end
	end
end

local function triggerZeroDelayDash()
	if not config.hubActive or not config.zeroDelayDashEnabled then return end
	if not cachedHum or not cachedRoot or cachedHum.Parent ~= player.Character then
		refreshCharacterCache(player.Character)
	end
	local char, hum, root = cachedChar, cachedHum, cachedRoot
	if not char or not root or not hum then return end

	speedUpAnimations(hum)

	local moveDir = hum.MoveDirection
	if moveDir.Magnitude < 0.05 then
		local cam = Workspace.CurrentCamera
		moveDir = cam and Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z) or root.CFrame.LookVector
		if moveDir.Magnitude < 0.05 then
			moveDir = root.CFrame.LookVector
		end
	end
	moveDir = moveDir.Unit
	root.AssemblyLinearVelocity = Vector3.new(
		moveDir.X * config.dashImpulse,
		math.max(root.AssemblyLinearVelocity.Y, 6),
		moveDir.Z * config.dashImpulse
	)
end

local function triggerZeroDelayPunch()
	if not config.hubActive or not config.zeroDelayPunchEnabled then return end
	if not cachedChar or cachedChar ~= player.Character then
		refreshCharacterCache(player.Character)
	end
	local char, hum = cachedChar, cachedHum
	if not char then return end
	if hum then
		speedUpAnimations(hum)
	end
	for _, item in ipairs(char:GetChildren()) do
		if item:IsA("Tool") then
			item:Activate()
		end
	end
end

local function getActiveTexturePreset()
	local idx = textureIndexByName[config.mapTheme] or 1
	return TEXTURE_PRESETS[idx], idx
end

local function isMapPart(obj)
	if not obj or not obj:IsA("BasePart") or obj:IsA("Terrain") then return false end
	local model = obj:FindFirstAncestorOfClass("Model")
	if model and model:FindFirstChildOfClass("Humanoid") then
		return false
	end
	return true
end

local function paintSinglePart(obj, preset)
	if not isMapPart(obj) then return end
	obj.Color = preset.color
	obj.Material = preset.material
end

local function applyLightingPreset(preset)
	Lighting.Ambient = preset.ambient
	Lighting.OutdoorAmbient = preset.ambient
	Lighting.FogColor = preset.fog
	Lighting.FogEnd = 420
	Lighting.Brightness = preset.brightness
end

local function applyMapTexture()
	if not config.hubActive or not config.mapVisualsEnabled then return end
	local preset = getActiveTexturePreset()
	applyLightingPreset(preset)

	for _, obj in ipairs(Workspace:GetDescendants()) do
		paintSinglePart(obj, preset)
	end
end

local function cycleTexturePreset(step)
	local _, curIdx = getActiveTexturePreset()
	local total = #TEXTURE_PRESETS
	local nextIdx = ((curIdx - 1 + step) % total) + 1
	config.mapTheme = TEXTURE_PRESETS[nextIdx].name
	config.mapVisualsEnabled = true
	applyMapTexture()
	return TEXTURE_PRESETS[nextIdx], nextIdx
end

local function applyCameraFov()
	local cam = Workspace.CurrentCamera
	if not cam or not config.hubActive or not config.fovEnabled then return end
	if originalFov == nil then
		local cur = cam.FieldOfView
		if type(cur) == "number" then originalFov = cur end
	end
	cam.FieldOfView = config.fovValue
end

local function setFovValue(newVal)
	local num = tonumber(newVal)
	if not num then return end
	config.fovValue = math.clamp(math.floor(num + 0.5), 30, 120)
	config.fovEnabled = true
	config.showFovCircle = false
	config.fovFilled = false
	applyCameraFov()
end

local function setEspHighlightsEnabled(state)
	for _, hl in pairs(espHighlights) do
		if hl then
			hl.Enabled = state
		end
	end
end

local function updateEspCheia()
	if not cachedRoot or cachedRoot.Parent ~= player.Character then
		refreshCharacterCache(player.Character)
	end
	local myRoot = cachedRoot

	if not config.hubActive or not config.espEnabled then
		setEspHighlightsEnabled(false)
		return
	end

	for _, targetPlayer in ipairs(Players:GetPlayers()) do
		if targetPlayer ~= player then
			local char = targetPlayer.Character
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			local root = getCharacterRoot(char)
			local dist = (myRoot and root) and (root.Position - myRoot.Position).Magnitude or 0
			local valid = isEnemyPlayer(targetPlayer) and char and char.Parent and hum and hum.Health > 0 and dist <= config.espMaxDistance

			if valid then
				local hl = espHighlights[targetPlayer]
				if not hl or not hl.Parent then
					hl = Instance.new("Highlight")
					hl.Name = "SUPREMO_ESP_CHEIA"
					hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					hl.Parent = playerGui
					espHighlights[targetPlayer] = hl
				end
				hl.Adornee = char
				hl.FillColor = Color3.fromRGB(220, 255, 40)
				hl.FillTransparency = 0.35
				hl.OutlineColor = Color3.fromRGB(220, 255, 40)
				hl.OutlineTransparency = 0
				hl.Enabled = true
			elseif espHighlights[targetPlayer] then
				espHighlights[targetPlayer].Enabled = false
			end
		end
	end
end

local function toggleEspEnabled(forceState)
	if type(forceState) == "boolean" then
		config.espEnabled = forceState
	else
		config.espEnabled = not config.espEnabled
	end
	if not config.espEnabled then
		setEspHighlightsEnabled(false)
	else
		updateEspCheia()
	end
	return config.espEnabled
end

local function applySupremoPreset()
	config.hubActive = true
	config.aimAssistEnabled = true
	config.punchAssistRange = 60
	config.ignoreTeam = false

	config.fovEnabled = true
	config.fovValue = 60
	config.showFovCircle = false
	config.fovFilled = false

	config.espEnabled = true
	config.espStyle = "Cheia"
	config.espMaxDistance = 500
	config.espLines = false

	config.mapVisualsEnabled = true
	if not textureIndexByName[config.mapTheme] then
		config.mapTheme = TEXTURE_PRESETS[1].name
	end

	config.zeroDelayJumpEnabled = true
	config.zeroDelayDashEnabled = true
	config.zeroDelayPunchEnabled = true

	savedProfiles["Supremo"] = table.clone(config)
	applyCameraFov()
	applyMapTexture()
	updateEspCheia()
end

-- Garante que novas paredes/blocos que surgirem no mapa recebam a textura imediatamente
Workspace.DescendantAdded:Connect(function(descendant)
	if not config.hubActive or not config.mapVisualsEnabled then return end
	if descendant:IsA("BasePart") then
		local preset = getActiveTexturePreset()
		paintSinglePart(descendant, preset)
	end
end)

player.CharacterAdded:Connect(function(newChar)
	refreshCharacterCache(newChar)
	applyCameraFov()
	updateEspCheia()
end)

UIS.JumpRequest:Connect(triggerZeroDelayJump)
UIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.Q then
		triggerZeroDelayDash()
	elseif input.KeyCode == Enum.KeyCode.F or input.UserInputType == Enum.UserInputType.MouseButton1 then
		triggerZeroDelayPunch()
	end
end)

RunService.RenderStepped:Connect(function()
	if not config.hubActive then return end
	applyCameraFov()
	if config.espEnabled then
		updateEspCheia()
	end
end)

local function buildPanel()
	local gui = Instance.new("ScreenGui")
	gui.Name = "SUPREMO_PANEL_GUI"
	gui.ResetOnSpawn = false
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	gui.Parent = playerGui

	local miniBtn = Instance.new("TextButton")
	miniBtn.Name = "MiniSP"
	miniBtn.Size = UDim2.fromOffset(42, 42)
	miniBtn.Position = UDim2.new(0, 14, 0.85, 0)
	miniBtn.BackgroundColor3 = Color3.fromRGB(95, 38, 195)
	miniBtn.Text = "SP"
	miniBtn.Font = Enum.Font.GothamBold
	miniBtn.TextSize = 13
	miniBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	miniBtn.Visible = false
	miniBtn.Active = true
	miniBtn.Draggable = true
	miniBtn.Parent = gui
	Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, 8)

	local main = Instance.new("Frame")
	main.Name = "MainPanel"
	main.Size = UDim2.fromOffset(440, 276)
	main.Position = UDim2.new(0.5, -220, 0.22, 0)
	main.BackgroundColor3 = Color3.fromRGB(14, 8, 24)
	main.BorderSizePixel = 0
	main.Active = true
	main.Draggable = true
	main.Parent = gui
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
	local stroke = Instance.new("UIStroke", main)
	stroke.Color = Color3.fromRGB(175, 65, 255)
	stroke.Thickness = 2

	local topBar = Instance.new("Frame")
	topBar.Size = UDim2.new(1, 0, 0, 34)
	topBar.BackgroundColor3 = Color3.fromRGB(26, 14, 46)
	topBar.BorderSizePixel = 0
	topBar.Parent = main
	Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 10)

	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -90, 1, 0)
	title.Position = UDim2.fromOffset(12, 0)
	title.BackgroundTransparency = 1
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Font = Enum.Font.GothamBold
	title.TextSize = 12
	title.TextColor3 = Color3.fromRGB(235, 190, 255)
	title.Text = "Supremo Gestão  v5.6"
	title.Parent = topBar

	local minBtn = Instance.new("TextButton")
	minBtn.Size = UDim2.fromOffset(26, 24)
	minBtn.Position = UDim2.new(1, -62, 0.5, -12)
	minBtn.BackgroundColor3 = Color3.fromRGB(65, 30, 115)
	minBtn.Text = "-"
	minBtn.Font = Enum.Font.GothamBold
	minBtn.TextSize = 16
	minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	minBtn.Parent = topBar
	Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

	local closeBtn = Instance.new("TextButton")
	closeBtn.Size = UDim2.fromOffset(26, 24)
	closeBtn.Position = UDim2.new(1, -32, 0.5, -12)
	closeBtn.BackgroundColor3 = Color3.fromRGB(130, 25, 70)
	closeBtn.Text = "X"
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 13
	closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeBtn.Parent = topBar
	Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

	local sideBar = Instance.new("Frame")
	sideBar.Size = UDim2.new(0, 132, 1, -44)
	sideBar.Position = UDim2.fromOffset(8, 40)
	sideBar.BackgroundColor3 = Color3.fromRGB(22, 13, 38)
	sideBar.BorderSizePixel = 0
	sideBar.Parent = main
	Instance.new("UICorner", sideBar).CornerRadius = UDim.new(0, 8)

	local content = Instance.new("Frame")
	content.Size = UDim2.new(1, -152, 1, -44)
	content.Position = UDim2.fromOffset(146, 40)
	content.BackgroundColor3 = Color3.fromRGB(20, 11, 35)
	content.BorderSizePixel = 0
	content.Parent = main
	Instance.new("UICorner", content).CornerRadius = UDim.new(0, 8)

	local supremoBtn = Instance.new("TextButton")
	supremoBtn.Size = UDim2.new(1, -12, 0, 30)
	supremoBtn.Position = UDim2.fromOffset(6, 6)
	supremoBtn.BackgroundColor3 = Color3.fromRGB(115, 45, 215)
	supremoBtn.Text = "Config Supremo"
	supremoBtn.Font = Enum.Font.GothamBold
	supremoBtn.TextSize = 11
	supremoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	supremoBtn.Parent = sideBar
	Instance.new("UICorner", supremoBtn).CornerRadius = UDim.new(0, 6)

	local channels = {"Canal Aimbot", "Canal FOV", "Canal ESP", "Canal Textura"}
	local pages = {}

	for i, ch in ipairs(channels) do
		local b = Instance.new("TextButton")
		b.Size = UDim2.new(1, -12, 0, 28)
		b.Position = UDim2.fromOffset(6, 36 + i * 32)
		b.BackgroundColor3 = (i == 1) and Color3.fromRGB(95, 38, 175) or Color3.fromRGB(38, 22, 62)
		b.Text = ch
		b.Font = Enum.Font.GothamBold
		b.TextSize = 10
		b.TextColor3 = Color3.fromRGB(235, 215, 255)
		b.Parent = sideBar
		Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)

		local p = Instance.new("Frame")
		p.Size = UDim2.fromScale(1, 1)
		p.BackgroundTransparency = 1
		p.Visible = (i == 1)
		p.Parent = content
		pages[ch] = p

		b.MouseButton1Click:Connect(function()
			for _, pg in pairs(pages) do pg.Visible = false end
			p.Visible = true
		end)
	end

	local statusLbl = Instance.new("TextLabel")
	statusLbl.Size = UDim2.new(1, -16, 0, 24)
	statusLbl.Position = UDim2.fromOffset(8, 188)
	statusLbl.BackgroundTransparency = 1
	statusLbl.Font = Enum.Font.GothamBold
	statusLbl.TextSize = 10
	statusLbl.TextColor3 = Color3.fromRGB(215, 165, 255)
	statusLbl.Text = "Zero Delay + Auto-Textura ativos"
	statusLbl.Parent = content

	local saveBtn = Instance.new("TextButton")
	saveBtn.Size = UDim2.new(1, -16, 0, 28)
	saveBtn.Position = UDim2.fromOffset(8, 154)
	saveBtn.BackgroundColor3 = Color3.fromRGB(125, 45, 215)
	saveBtn.Text = "Salvar perfil"
	saveBtn.Font = Enum.Font.GothamBold
	saveBtn.TextSize = 11
	saveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	saveBtn.Parent = content
	Instance.new("UICorner", saveBtn).CornerRadius = UDim.new(0, 6)

	local function makeInfoLabel(parent, txt, y)
		local l = Instance.new("TextLabel")
		l.Size = UDim2.new(1, -16, 0, 28)
		l.Position = UDim2.fromOffset(8, y)
		l.BackgroundColor3 = Color3.fromRGB(34, 19, 58)
		l.Font = Enum.Font.GothamBold
		l.TextSize = 10
		l.TextColor3 = Color3.fromRGB(245, 225, 255)
		l.Text = txt
		l.Parent = parent
		Instance.new("UICorner", l).CornerRadius = UDim.new(0, 6)
		return l
	end

	local aimLbl = makeInfoLabel(pages["Canal Aimbot"], "AIMBOT: ON | Alcance extra: 60 st | Ignorar time: OFF", 12)
	local fovLbl = makeInfoLabel(pages["Canal FOV"], "FOV: ATIVO (60) | Sem círculo na tela", 12)
	local espLbl = makeInfoLabel(pages["Canal ESP"], "ESP: ON | Cheia | Max: 500 m | Sem linhas/círculo", 12)
	local texLbl = makeInfoLabel(pages["Canal Textura"], "TEXTURA: ON | Azul + Rosa (1/50)", 12)

	-- Toggle ON/OFF do ESP no Canal ESP
	local espToggleBtn = Instance.new("TextButton")
	espToggleBtn.Size = UDim2.new(1, -16, 0, 32)
	espToggleBtn.Position = UDim2.fromOffset(8, 48)
	espToggleBtn.BackgroundColor3 = Color3.fromRGB(115, 45, 215)
	espToggleBtn.Text = "ESP: LIGADO (Clique para Desligar)"
	espToggleBtn.Font = Enum.Font.GothamBold
	espToggleBtn.TextSize = 10
	espToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	espToggleBtn.Parent = pages["Canal ESP"]
	Instance.new("UICorner", espToggleBtn).CornerRadius = UDim.new(0, 6)

	-- Controles de 50 texturas no Canal Textura
	local texControls = Instance.new("Frame")
	texControls.Size = UDim2.new(1, -16, 0, 34)
	texControls.Position = UDim2.fromOffset(8, 48)
	texControls.BackgroundTransparency = 1
	texControls.Parent = pages["Canal Textura"]

	local prevTexBtn = Instance.new("TextButton")
	prevTexBtn.Size = UDim2.fromOffset(34, 30)
	prevTexBtn.Position = UDim2.fromOffset(0, 2)
	prevTexBtn.BackgroundColor3 = Color3.fromRGB(75, 32, 135)
	prevTexBtn.Text = "<"
	prevTexBtn.Font = Enum.Font.GothamBold
	prevTexBtn.TextSize = 12
	prevTexBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	prevTexBtn.Parent = texControls
	Instance.new("UICorner", prevTexBtn).CornerRadius = UDim.new(0, 6)

	local texNameBtn = Instance.new("TextButton")
	texNameBtn.Size = UDim2.new(1, -118, 0, 30)
	texNameBtn.Position = UDim2.fromOffset(38, 2)
	texNameBtn.BackgroundColor3 = Color3.fromRGB(34, 19, 58)
	texNameBtn.Text = config.mapTheme
	texNameBtn.Font = Enum.Font.GothamBold
	texNameBtn.TextSize = 10
	texNameBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	texNameBtn.Parent = texControls
	Instance.new("UICorner", texNameBtn).CornerRadius = UDim.new(0, 6)

	local nextTexBtn = Instance.new("TextButton")
	nextTexBtn.Size = UDim2.fromOffset(34, 30)
	nextTexBtn.Position = UDim2.new(1, -76, 0, 2)
	nextTexBtn.BackgroundColor3 = Color3.fromRGB(115, 45, 215)
	nextTexBtn.Text = ">"
	nextTexBtn.Font = Enum.Font.GothamBold
	nextTexBtn.TextSize = 12
	nextTexBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	nextTexBtn.Parent = texControls
	Instance.new("UICorner", nextTexBtn).CornerRadius = UDim.new(0, 6)

	local jump10TexBtn = Instance.new("TextButton")
	jump10TexBtn.Size = UDim2.fromOffset(34, 30)
	jump10TexBtn.Position = UDim2.new(1, -38, 0, 2)
	jump10TexBtn.BackgroundColor3 = Color3.fromRGB(55, 25, 105)
	jump10TexBtn.Text = "+10"
	jump10TexBtn.Font = Enum.Font.GothamBold
	jump10TexBtn.TextSize = 10
	jump10TexBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	jump10TexBtn.Parent = texControls
	Instance.new("UICorner", jump10TexBtn).CornerRadius = UDim.new(0, 6)

	-- Controles para mudar o FOV quanto quiser no Canal FOV
	local fovControls = Instance.new("Frame")
	fovControls.Size = UDim2.new(1, -16, 0, 34)
	fovControls.Position = UDim2.fromOffset(8, 48)
	fovControls.BackgroundTransparency = 1
	fovControls.Parent = pages["Canal FOV"]

	local minusFovBtn = Instance.new("TextButton")
	minusFovBtn.Size = UDim2.fromOffset(42, 30)
	minusFovBtn.Position = UDim2.fromOffset(0, 2)
	minusFovBtn.BackgroundColor3 = Color3.fromRGB(75, 32, 135)
	minusFovBtn.Text = "-5"
	minusFovBtn.Font = Enum.Font.GothamBold
	minusFovBtn.TextSize = 11
	minusFovBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	minusFovBtn.Parent = fovControls
	Instance.new("UICorner", minusFovBtn).CornerRadius = UDim.new(0, 6)

	local fovInput = Instance.new("TextBox")
	fovInput.Size = UDim2.fromOffset(82, 30)
	fovInput.Position = UDim2.fromOffset(48, 2)
	fovInput.BackgroundColor3 = Color3.fromRGB(34, 19, 58)
	fovInput.Text = tostring(config.fovValue)
	fovInput.PlaceholderText = "60"
	fovInput.ClearTextOnFocus = false
	fovInput.Font = Enum.Font.GothamBold
	fovInput.TextSize = 11
	fovInput.TextColor3 = Color3.fromRGB(255, 255, 255)
	fovInput.Parent = fovControls
	Instance.new("UICorner", fovInput).CornerRadius = UDim.new(0, 6)

	local plusFovBtn = Instance.new("TextButton")
	plusFovBtn.Size = UDim2.fromOffset(42, 30)
	plusFovBtn.Position = UDim2.fromOffset(136, 2)
	plusFovBtn.BackgroundColor3 = Color3.fromRGB(115, 45, 215)
	plusFovBtn.Text = "+5"
	plusFovBtn.Font = Enum.Font.GothamBold
	plusFovBtn.TextSize = 11
	plusFovBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	plusFovBtn.Parent = fovControls
	Instance.new("UICorner", plusFovBtn).CornerRadius = UDim.new(0, 6)

	local function refreshLabels()
		local _, texIdx = getActiveTexturePreset()
		aimLbl.Text = string.format("AIMBOT: %s | Alcance extra: %d st | Ignorar time: %s",
			config.aimAssistEnabled and "ON" or "OFF",
			config.punchAssistRange,
			config.ignoreTeam and "ON" or "OFF")
		fovLbl.Text = string.format("FOV: %s (%d) | Sem círculo na tela",
			config.fovEnabled and "ATIVO" or "OFF",
			config.fovValue)
		fovInput.Text = tostring(config.fovValue)
		espLbl.Text = string.format("ESP: %s | %s | Max: %d m | Sem linhas/círculo",
			config.espEnabled and "ON" or "OFF",
			config.espStyle,
			config.espMaxDistance)
		espToggleBtn.Text = config.espEnabled and "ESP: LIGADO (Clique p/ Desligar)" or "ESP: DESLIGADO (Clique p/ Ligar)"
		espToggleBtn.BackgroundColor3 = config.espEnabled and Color3.fromRGB(115, 45, 215) or Color3.fromRGB(75, 25, 55)
		texLbl.Text = string.format("TEXTURA: %s | %s (%d/%d)",
			config.mapVisualsEnabled and "ON" or "OFF",
			config.mapTheme,
			texIdx,
			#TEXTURE_PRESETS)
		texNameBtn.Text = config.mapTheme
	end

	espToggleBtn.MouseButton1Click:Connect(function()
		local active = toggleEspEnabled()
		refreshLabels()
		statusLbl.Text = active and "ESP ativado!" or "ESP desativado!"
	end)

	prevTexBtn.MouseButton1Click:Connect(function()
		local preset, idx = cycleTexturePreset(-1)
		refreshLabels()
		statusLbl.Text = "Textura (" .. idx .. "/50): " .. preset.name
	end)

	nextTexBtn.MouseButton1Click:Connect(function()
		local preset, idx = cycleTexturePreset(1)
		refreshLabels()
		statusLbl.Text = "Textura (" .. idx .. "/50): " .. preset.name
	end)

	jump10TexBtn.MouseButton1Click:Connect(function()
		local preset, idx = cycleTexturePreset(10)
		refreshLabels()
		statusLbl.Text = "Textura (" .. idx .. "/50): " .. preset.name
	end)

	texNameBtn.MouseButton1Click:Connect(function()
		local preset, idx = cycleTexturePreset(1)
		refreshLabels()
		statusLbl.Text = "Textura (" .. idx .. "/50): " .. preset.name
	end)

	minusFovBtn.MouseButton1Click:Connect(function()
		setFovValue(config.fovValue - 5)
		refreshLabels()
		statusLbl.Text = "FOV ajustado para " .. tostring(config.fovValue)
	end)

	plusFovBtn.MouseButton1Click:Connect(function()
		setFovValue(config.fovValue + 5)
		refreshLabels()
		statusLbl.Text = "FOV ajustado para " .. tostring(config.fovValue)
	end)

	fovInput.FocusLost:Connect(function()
		setFovValue(fovInput.Text)
		refreshLabels()
		statusLbl.Text = "FOV definido em " .. tostring(config.fovValue)
	end)

	supremoBtn.MouseButton1Click:Connect(function()
		applySupremoPreset()
		refreshLabels()
		statusLbl.Text = "Config Supremo aplicado e salvo!"
	end)

	saveBtn.MouseButton1Click:Connect(function()
		savedProfiles["Supremo"] = table.clone(config)
		statusLbl.Text = "Perfil Supremo salvo com sucesso!"
	end)

	minBtn.MouseButton1Click:Connect(function()
		main.Visible = false
		miniBtn.Visible = true
	end)

	miniBtn.MouseButton1Click:Connect(function()
		main.Visible = true
		miniBtn.Visible = false
	end)

	closeBtn.MouseButton1Click:Connect(function()
		config.hubActive = false
		setEspHighlightsEnabled(false)
		for _, hl in pairs(espHighlights) do
			if hl then pcall(function() hl:Destroy() end) end
		end
		gui:Destroy()
	end)

	refreshLabels()
end

applySupremoPreset()
pcall(buildPanel)