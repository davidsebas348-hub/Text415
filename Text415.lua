-- ======================
-- SBS HUB COMPLETO FINAL  (Pistol Arena)
-- ======================
repeat task.wait() until game:IsLoaded()

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
screenGui.DisplayOrder = 999999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- poner nombre de textobox que queremos que solo se ponga números
local numericBoxes = {
    ["SPEED"] = true,
    ["JUMPPOWER"] = true,
    ["GRAVITY"] = true,
    ["RANGE"] = true,
    ["SIZE"] = true,
    ["FLY SPEED"] = true,
    ["TRASPARENCY 0-1"] = true,
    ["FOV SIZE"] = true,
}

-- poner título arriba de tal botón 
local topTitles = {
    ["SPEED"] = "MOVEMENT SETTINGS",
    ["INFINITY ZOOM"] = "CAMERA",
}

-- poner títulos abajo de tal botón
local customTitles = {
    ["SPED"] = "MOVEMENT SETTINGS",
    ["AUTO KILL ENEMIES"] = "KILL SYSTEM",
    ["ESP NAE"] = "ESP VISUAL",
}

-- cambiar el nombre de los Titulos de las secciones 
local menuNames = {
    ["MAI"] = "PLAYER MENU",
    ["COMBAT"] = "FIGHT SYSTEM",
    ["ESP"] = "VISUALS",
    ["TELEPORT"] = "TELEPORTS",
}

-- ======================
-- 🔥 MULTI BUTTON CONFIG
-- ======================

local multiButtons = {
    [""] = { 
        variable = "",
        options = {
            {name = "BLACK", color = Color3.fromRGB(0, 0, 0)},
        }
    },

    -- puedes meter 30+ aquí sin problema
}

-- ======================
-- CONFIG GLOBAL BOTONES (FALTABA ESTO)
-- ======================

local BUTTON_SIZE = UDim2.new(1, -20, 0, 30)

local BUTTON_OFFSET_X = 10
local BUTTON_GLOBAL_X = 0
local BUTTON_GLOBAL_Y = 0

-- ======================
-- CONFIG PERSONAL POR BOTÓN
-- ======================

local BUTTON_CUSTOM = {
    ["RANGE"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },

    ["SIZE"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },

    ["AUTOMATICALLY EQUIP THE TOOL"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },

    ["COLOR OF THE ESP"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },
    
    ["AUTOMATICALLY EQUIP THE TOOL "] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },

    ["TRASPARENCY 0-1"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -9 
    }
}

-- TITULOS ARRIBA DE BOTONES (titulos simples)
local buttonTitles = {
    ["SPEED"] = "PLAYER",
    ["AUTO DESTROY TO ALL OBJECTS"] = "TROLL",
    ["FULL BRIGHT"] = "EFFECT",

    ["TP TOOL"] = "CLICK TP",
    ["ABOVE THE MARKET"] = "MAP",
    ["PLAYER NAME"] = "PLAYERS",
    

    ["AIMBOT LIGERO"] = "AIM",
    ["AUTO SHOOT PLAYERS"] = "TROLL",
    
    ["ESP TO ALL ALARMS"] = "END",
    ["ESP TO ALL THE TOKEN"] = "ITEMS",
    ["ESP ENEMIES"] = "ENEMIES",
    ["ESP PLAYERS + NAME + DISTANCE"] = "PLAYERS",

    ["AUTO EAT"] = "EAT",
    ["SELF-HEALING"] = "HEALTH",
    [""] = "ENEMIES",
    [""] = "PLAYERS",

    ["HITBOX EXTENDER"] = "HITBOX",
    ["AUTO KILL ENEMIES"] = "KILL",
    ["MULTIPLY DAMAGE"] = "DAMAGE MULTIPLIER",
    ["INFINITY AMMO"] = "MODIFY GUNS",
    ["INSTANT SWING"] = "MESH WEAPON MODIFICATIONS",

    ["NAME OF THE ITEM"] = "BRING",
    ["NAME OF THE ITEM."] = "GRAB",
    
    ["Fps Boost"] = "PERFORMANCE"
}

getgenv().SBS_BUTTON_STATES = getgenv().SBS_BUTTON_STATES or {}
local buttonStates = getgenv().SBS_BUTTON_STATES
-- BOTONES QUE NO SERAN TOGLE
local noToggleButtons = {
    ["YOUTUBE:SBS HUB"] = true,
    ["SUSCRIBETE:)"] = true,
    ["Gaze Emote"] = true,
    ["LOCALPLAYER"] = true,
    ["RESET STATS"] = true,
    ["DESYNC"] = true,
    ["Fps Boost"] = true,
    [""] = true,
    ["INFINITY STAMINA"] = true,
    ["BRING ITEM"] = true,
    ["GRAB THE ITEM"] = true,
    ["NO FIRE DELAY"] = true,
    ["BRING ALL THE ITEMS"] = true,
    ["INSTANT SWING"] = true,  
    ["ABOVE THE MARKET"] = true,
    ["MANAGER'S OFFICE"] = true,
    ["ELECTRICAL ROOM"] = true,
    ["OUTSIDE THE MARKET"] = true,
    ["WITHIN THE MARKET"] = true,
    ["TP TO PLAYER"] = true,  
}

-- BOTONES SIN EFECTO VERDE
local noGreenFlash = {
    ["SUSCRIBETE:)"] = true
}

local textboxButtons = {
    ["SPEED"] = {
        variable = "SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Speed/refs/heads/main/Speed.lua"
    },

    ["BULLET SPEED"] = {
        variable = "BULLET_SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text397/refs/heads/main/Text397.lua"
    },

    ["BULLETSPERSHOT"] = {
        variable = "BULLETS_PER_SHOT",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text398/refs/heads/main/Text398.lua"
    },

    ["JUMPPOWER"] = {
        variable = "JUMP",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/JumpPower/refs/heads/main/JumpPower.lua"
    },

    ["GRAVITY"] = {
        variable = "GRAVITY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Gravity/refs/heads/main/Gravity.lua"
    },

    ["FLY SPEED"] = {
    variable = "FLY_SPEED",
    url = nil
    },
    ["SIZE"] = {
    variable = "HITBOX_SIZE",
    url = nil
    },
    ["PLAYER NAME"] = {
    variable = "PLAYER",
    url = nil
    },
    ["TRASPARENCY 0-1"] = {
    variable = "HITBOX_TRANSPARENCY",
    url = nil
    },
    ["NAME OF THE ITEM"] = {
    variable = "FIND_TOOL",
    url = nil
    },
    ["FOV SIZE"] = {
    variable = "AIMBOT_FOV",
    url = nil
    },
    ["MULTIPLY DAMAGE"] = {
    variable = "MULTIPLIER",
    url = nil
    },
    ["RANGE"] = {
    variable = "RANGE",
    url = nil
}
}
local old = PlayerGui:FindFirstChild("SBS_HUB")
if old then
    old:Destroy()
end
screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0,500,0,350)
mainFrame.Position = UDim2.new(0.5,-250,0.5,-175)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = false

-- ======================
-- RESIZE CORNER
-- ======================
local resizeCorner = Instance.new("Frame", mainFrame)
resizeCorner.Size = UDim2.new(0,20,0,20)
resizeCorner.Position = UDim2.new(1,-20,1,-20)
resizeCorner.BackgroundTransparency = 0.5
resizeCorner.BackgroundColor3 = Color3.fromRGB(255,255,255)
resizeCorner.BorderSizePixel = 0
resizeCorner.ZIndex = 10

-- ======================
-- RESIZE LOGIC
-- ======================
do
    local dragging, dragStart, startSize
    local function updateSize(input)
        local delta = input.Position - dragStart
        local newWidth = math.max(100, startSize.X + delta.X) -- mínimo ancho 100
        local newHeight = math.max(100, startSize.Y + delta.Y) -- mínimo alto 100
        mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
    end
    resizeCorner.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startSize = Vector2.new(mainFrame.AbsoluteSize.X, mainFrame.AbsoluteSize.Y)
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSize(input)
        end
    end)
end


local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 2


do
    local dragging, dragStart, startPos, dragInput
    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.Text = "SBS HUB | Pistol Arena"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
local line = Instance.new("Frame", mainFrame)
line.Size = UDim2.new(1,0,0,2)
line.Position = UDim2.new(0,0,0,50)
line.BackgroundColor3 = Color3.new(1,1,1)
line.BackgroundTransparency = 0

local rightFrame = Instance.new("ScrollingFrame", mainFrame)
rightFrame.Size = UDim2.new(1,-150,1,-52)
rightFrame.Position = UDim2.new(0,150,0,52)
rightFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
rightFrame.BorderSizePixel = 0

local leftFrame = Instance.new("ScrollingFrame", mainFrame)
leftFrame.Size = UDim2.new(0,150,1,-52)
leftFrame.Position = UDim2.new(0,0,0,52)
leftFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
leftFrame.BorderSizePixel = 0
leftFrame.ScrollBarThickness = 6
leftFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

-- ✅ AHORA SÍ (AQUÍ)
local padding = Instance.new("UIPadding", rightFrame)
padding.PaddingBottom = UDim.new(0,50)



local midLine = Instance.new("Frame", mainFrame)
midLine.Size = UDim2.new(0,2,1,-52)
midLine.Position = UDim2.new(0,150,0,52)
midLine.BackgroundColor3 = Color3.fromRGB(255,255,255)


-- ======================
-- 🔥 EMERGENCY DRAG LINE
-- ======================

local dragLine = Instance.new("Frame", mainFrame)
dragLine.Size = UDim2.new(1, -60, 0, 8) -- ancho completo, altura pequeña
dragLine.Position = UDim2.new(0, 30, 1, 10) -- el último número es para subir y bajar - es subir y sin - es bajar 
dragLine.BackgroundColor3 = Color3.fromRGB(255,255,255)
dragLine.BackgroundTransparency = 0.1 -- invisible
dragLine.BorderSizePixel = 0
dragLine.ZIndex = 20 -- encima de todo
local corner = Instance.new("UICorner", dragLine)
corner.CornerRadius = UDim.new(0, 6) -- puedes cambiar el 6

-- DRAG LOGIC
do
    local dragging, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end

    dragLine.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
end -- aca termina eso 🖕🖕🖕

local function createMenuButton(parent,text,y,callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(15,15,15)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    
    b.MouseButton1Click:Connect(callback)
end

local function createButton(parent,text,y,callback)
    local hasTextbox = textboxButtons[text] ~= nil
    local multiConfig = multiButtons[text]

    local container = Instance.new("Frame", parent)
    local custom = BUTTON_CUSTOM[text]

    local finalSize = BUTTON_SIZE
    local extraX = 0
    local extraY = 0

    if custom then
        if custom.size then
            finalSize = custom.size
        end
        extraX = custom.x or 0
        extraY = custom.y or 0
    end

    container.Size = finalSize
    container.Position = UDim2.new(
        0, BUTTON_OFFSET_X + BUTTON_GLOBAL_X + extraX,
        0, y + BUTTON_GLOBAL_Y + extraY
    )
    container.BackgroundTransparency = 1

    local button = Instance.new("TextButton", container)
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.BorderSizePixel = 0

    -- ======================
    -- 🔥 MULTI MODE
    -- ======================
    if multiConfig then
        button.Size = UDim2.new(1,0,1,0)
        button.Text = ""
        button.BackgroundColor3 = Color3.fromRGB(20,20,20)

        getgenv().SBS_MULTI = getgenv().SBS_MULTI or {}
        local index = getgenv().SBS_MULTI[text] or 0
        local options = multiConfig.options

        local label = Instance.new("TextLabel", button)
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.TextSize = 14
        label.Font = Enum.Font.GothamBold

        local function update()
            if index == 0 then
                label.Text = text
                label.TextColor3 = Color3.fromRGB(255,255,255)
            else
                local opt = options[index]
                label.Text = opt.name
                label.TextColor3 = opt.color
                if multiConfig.variable then
                    getgenv()[multiConfig.variable] = opt.name
                end
            end
        end

        update()

        button.MouseButton1Click:Connect(function()
            index += 1
            if index > #options then index = 1 end
            getgenv().SBS_MULTI[text] = index
            update()
        end)

        return
    end

-- ======================
-- TEXTBOX MODE (CORTO Y FIXED)
-- ======================
if hasTextbox then
    button:Destroy()

    local box = Instance.new("TextBox", container)
    box.Size = UDim2.new(1,0,1,0)
    box.BackgroundColor3 = Color3.fromRGB(25,25,25)
    box.TextColor3 = Color3.fromRGB(255,255,255)
    box.PlaceholderText = text
    box.Text = ""
    box.Font = Enum.Font.GothamBold
    box.TextSize = 14
    box.BorderSizePixel = 0

    local data = textboxButtons[text]

    -- 🔥 cargar valor guardado
    if data and getgenv()[data.variable] ~= nil then
        box.Text = tostring(getgenv()[data.variable])
    end

    -- 🔢 SOLO NÚMEROS (EN TIEMPO REAL)
    box:GetPropertyChangedSignal("Text"):Connect(function()
        if numericBoxes[text] then
            box.Text = box.Text:gsub("[^%d%.%-]", "")
        end
    end)

    -- 💾 GUARDAR
    box.FocusLost:Connect(function()
        local input = box.Text
        if input == "" then return end

        local value

        if numericBoxes[text] then
            value = tonumber(input)
            if not value then
                box.Text = tostring(getgenv()[data.variable] or "")
                return
            end
        else
            value = input
        end

        -- ❌ no repetir
        if getgenv()[data.variable] == value then return end

        getgenv()[data.variable] = value

        if data.url then
            loadstring(game:HttpGet(data.url))()
        end
    end)

    return -- 🔥 CLAVE
    end
    -- 🔹 BOTÓN NORMAL (TU SISTEMA)
    button.Size = UDim2.new(1,0,1,0)

    local isToggle = not noToggleButtons[text]

    if isToggle then
        if buttonStates[text] == nil then
            buttonStates[text] = false
        end

        local function updateVisual()
            if buttonStates[text] then
                button.Text = text.." [ON]"
                button.BackgroundColor3 = Color3.fromRGB(0,120,0)
            else
                button.Text = text.." [OFF]"
                button.BackgroundColor3 = Color3.fromRGB(20,20,20)
            end
        end

        updateVisual()

        button.MouseButton1Click:Connect(function()
            buttonStates[text] = not buttonStates[text]
            updateVisual()
            callback(buttonStates[text])
        end)

    else
        button.Text = text
        button.BackgroundColor3 = Color3.fromRGB(20,20,20)

        local clicking = false

button.MouseButton1Click:Connect(function()
    if clicking then return end -- 🔥 evita spam
    clicking = true

    if not noGreenFlash[text] then
        local oldColor = button.BackgroundColor3
        button.BackgroundColor3 = Color3.fromRGB(0,120,0)

        task.delay(0.5,function() -- más rápido
            if button then
                button.BackgroundColor3 = oldColor
            end
            clicking = false
        end)
    else
        clicking = false
    end

    if callback then
        callback()
    end
end)
    end
end
    
-- ======================
-- SCROLL POR SUBMENU
-- ======================
local scrollConfig = {
    ["MAIN"] = true,
    ["COMBAT"] = true,
    ["ESP"] = true,
    ["TELEPORT"] = true,
    ["BRING/GRAB"] = true,
    ["AUTO/ANTI"] = true,
    ["AUTO FARM"] = true,
    ["FLING"] = true,
    ["Fps"] = false,
    ["YOUTUBE"] = false
}
-- ======================
-- MENUS
-- ======================
local menuOrder = {"MAIN","COMBAT","ESP","TELEPORT","BRING/GRAB","AUTO/ANTI","DODGE","AUTO FARM","FLING","Fps","YOUTUBE"}
local menuData = {
    ["MAIN"] = {
    "DESYNC",
    "INVISIBLE",
    "SPEED",
    "JUMPPOWER",
    "GRAVITY",
    "RESET STATS",
    "NOCLIP",
    "INFINITI JUMP",
    "FLY SPEED",
    "FLY",
},
    ["COMBAT"] = {
        "AIMBOT LIGERO",
        "AIMBOT INSTANT",
        "FOV SIZE",
        "AIMBOT OP",
        "AUTO SHOOT PLAYERS",
        "HITBOX EXTENDER",
        "SIZE",
        "TRASPARENCY 0-1",
    },
    ["BRING/GRAB"] = {
        "NAME OF THE ITEM",
        "BRING ITEM",
        "BRING ALL THE ITEMS",
        "NAME OF THE ITEM.",
        "GRAB THE ITEM",
        "GRAB THE ITEM (BUTTON)",
    },
    ["ESP"] = {
        "ESP PLAYERS",
        "ESP PLAYERS (NO LAG)",
        "ESP NAME",
        "ESP DISTANCE",
        "ESP TRACERS",
        "X-RAY",
        
    },
    ["TELEPORT"] = {
        "hola"
    },
    ["AUTO FARM"] = {
        "AUTO FARM KILLS (beta)",
    },
    ["Fps"] = {
        "Fps Boost"
    },
    ["YOUTUBE"] = {
        "YOUTUBE:SBS HUB",
        "SUSCRIBETE:)"
    }
}


local function clearFrame(frame)
    for _,v in pairs(frame:GetChildren()) do
        if not v:IsA("UIPadding") then
            if v:IsA("TextButton") or v:IsA("TextLabel") or v:IsA("Frame") then
                v:Destroy()
            end
        end
    end
    frame.CanvasPosition = Vector2.new(0,0)
end

for i,menu in ipairs(menuOrder) do
    createMenuButton(leftFrame, menu, 10+(i-1)*35, function()
    clearFrame(rightFrame)
        -- scroll
        if scrollConfig[menu] then
            rightFrame.ScrollBarThickness = 6
            rightFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        else
            rightFrame.ScrollBarThickness = 0
            rightFrame.AutomaticCanvasSize = Enum.AutomaticSize.None
            rightFrame.CanvasSize = UDim2.new(0,0,0,0)
        end

        local titleLabel = Instance.new("TextLabel", rightFrame)
        titleLabel.Size = UDim2.new(1,0,0,30)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = menuNames[menu] or menu
        titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 18

        local oy = 40

        for _,opt in ipairs(menuData[menu]) do

    -- CREAR TITULO SI EXISTE
    if buttonTitles[opt] then
        local section = Instance.new("TextLabel", rightFrame)
        section.Size = UDim2.new(1,-20,0,25)
        section.Position = UDim2.new(0,10,0,oy)
        section.BackgroundTransparency = 1
        section.Text = buttonTitles[opt]
        section.TextColor3 = Color3.fromRGB(200,200,200)
        section.Font = Enum.Font.GothamBold
        section.TextSize = 16
        section.TextXAlignment = Enum.TextXAlignment.Left

        oy += 30
    end

    local topTitle = topTitles[opt]

if topTitle then
    local section = Instance.new("TextLabel", rightFrame)
    section.Size = UDim2.new(1,0,0,30)
    section.Position = UDim2.new(0,0,0,oy)
    section.BackgroundTransparency = 1
    section.Text = topTitle
    section.TextColor3 = Color3.fromRGB(255,255,255)
    section.Font = Enum.Font.GothamBold
    section.TextSize = 18
    section.TextXAlignment = Enum.TextXAlignment.Center

    oy += 35 -- 🔥 baja el botón
                end

    createButton(rightFrame,opt,oy,function(state)

        if opt == "RESET STATS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Reset-speed-jumpPower-y-gravedad-/refs/heads/main/Reset.lua"))()

        elseif opt == "ESP PLAYERS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text416/refs/heads/main/Text416.lua"))()
            
        elseif opt == "ESP PLAYERS (NO LAG)" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text417/refs/heads/main/Text417.lua"))()

        elseif opt == "ESP NAME" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text418/refs/heads/main/Text418.lua"))()
                            
        elseif opt == "ESP DISTANCE" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text419/refs/heads/main/Text419.lua"))()
                            
        elseif opt == "ESP TRACERS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text420/refs/heads/main/Text420.lua"))()

        elseif opt == "AUTO SHOOT PLAYERS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text424/refs/heads/main/Text424.lua"))()
                            
        elseif opt == "HITBOX EXTENDER" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text425/refs/heads/main/Text425.lua"))()
                            
        elseif opt == "AUTO FARM KILLS (beta)" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text426/refs/heads/main/Text426.lua"))()

        elseif opt == "INVISIBLE" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text427/refs/heads/main/Text427.lua"))()
                            
        elseif opt == "AUTO KILL ENEMIES" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text383/refs/heads/main/Text383.lua"))()
                            
        elseif opt == "INFINITY ZOOM" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text384/refs/heads/main/Text384.lua"))()

        elseif opt == "UNLOCK THIRD PERSON" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text385/refs/heads/main/Text385.lua"))()
                            
        elseif opt == "ESP TO ALL GUNS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text386/refs/heads/main/Text386.lua"))()

        elseif opt == "ESP TO OTHER ITEMS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text387/refs/heads/main/Text387.lua"))()
                            
        elseif opt == "ESP ENEMIES" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text388/refs/heads/main/Text388.lua"))()

        elseif opt == "AIMBOT LIGERO" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text422/refs/heads/main/Text422.lua"))()
                            
        elseif opt == "AIMBOT INSTANT" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text423/refs/heads/main/Text423.lua"))()
                            
        elseif opt == "AIMBOT OP" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text421/refs/heads/main/Text421.lua"))()

        elseif opt == "" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text392/refs/heads/main/Text392.lua"))()
                            
        elseif opt == "TP TO PLAYER" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text408/refs/heads/main/Text408.lua"))()

        elseif opt == "FULL BRIGHT" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text409/refs/heads/main/Text409.lua"))()
                            
        elseif opt == "CAMERA NOCLIP" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text410/refs/heads/main/Text410.lua"))()
                            
        elseif opt == "AUTO EAT" then 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text411/refs/heads/main/Text411.lua"))()

        elseif opt == "AUTOMATICALLY EQUIP THE TOOL" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text412/refs/heads/main/Text412.lua"))()
                            
        elseif opt == "SELF-HEALING" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text413/refs/heads/main/Text413.lua"))()
                            
        elseif opt == "AUTOMATICALLY EQUIP THE TOOL " then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text414/refs/heads/main/Text414.lua"))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()

        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "SHIFT LOCK" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Shift-lock/refs/heads/main/Shift_Lock_.lua"))()

        elseif opt == "FLY" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Fly/refs/heads/main/Fly.lua"))()

        elseif opt == "INFINITI JUMP" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/INFINITI-JUMP/refs/heads/main/Salto%20infinito.lua",true))()

        elseif opt == "DESYNC" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text24/refs/heads/main/Text23.lua",true))()

        elseif opt == "FULL BRIGHT" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text279/refs/heads/main/Text279.lua"))()

        elseif opt == "LOCALPLAYER" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text8/refs/heads/main/Text8.lua"))()

        elseif opt == "NOCLIP" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/NOCLIP/refs/heads/main/NOCLIP.lua"))()

        elseif opt == "HITBOX EXTENDER" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text368/refs/heads/main/Text368.lua"))()

        elseif opt == "Fps Boost" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Fps-Boost-/refs/heads/main/FPS_BOOST_UNIVERSAL.lua"))()

        elseif opt == "YOUTUBE:SBS HUB" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Copiar-canal/refs/heads/main/Suscribete.lua"))()

        elseif opt == "TP TOOL" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text331/refs/heads/main/Text331.lua"))()

        elseif opt == "X-RAY" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text147/refs/heads/main/Text147.lua"))()

        elseif opt == "KILL AURA" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text372/refs/heads/main/Text372.lua"))()

        elseif opt == "INFINITY STAMINA" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text373/refs/heads/main/Text373.lua"))()
                            
        elseif opt == "Gaze Emote" then
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gaze-emote-74592"))()

        end

    end)

    oy += 40

local customTitle = customTitles[opt]

if customTitle then
    local section = Instance.new("TextLabel", rightFrame)
    section.Size = UDim2.new(1,-20,0,30)
    section.Position = UDim2.new(0,10,0,oy)
    section.BackgroundTransparency = 1
    section.Text = customTitle
    section.TextColor3 = Color3.fromRGB(255,255,255)
    section.Font = Enum.Font.GothamBold
    section.TextSize = 18
    section.TextXAlignment = Enum.TextXAlignment.Center
    
    oy += 35
                end
            end

end)
end

-- ICONO SBS PARA ABRIR/CERRAR
local toggle = Instance.new("TextButton", screenGui)
toggle.Size = UDim2.new(0,60,0,60)
toggle.Position = UDim2.new(1,-80,0,20)
toggle.BackgroundColor3 = Color3.fromRGB(20,20,20)
toggle.Text = "SBS"
toggle.TextColor3 = Color3.fromRGB(255,255,255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 24
toggle.BorderSizePixel = 0
local corner = Instance.new("UICorner", toggle)
corner.CornerRadius = UDim.new(0.3,0)
do
    local dragging, dragStart, startPos, dragInput
    local function update(input)
        local delta = input.Position - dragStart
        toggle.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
    toggle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = toggle.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    toggle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end
local open = true
toggle.MouseButton1Click:Connect(function()
    open = not open
    mainFrame.Visible = open
end)
