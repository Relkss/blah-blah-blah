--// Exploit Fix \\--
if not pcall(function() return syn.protect_gui end) then
    syn = {}
    syn.protect_gui = function(A_1)
        A_1.Parent = game:GetService("CoreGui")
    end
end

Library = loadstring(game:HttpGet('https://lindseyhost.com/UI/LinoriaLib.lua'))();



local Window = Library:CreateWindow('Creepr Aww Man..');
Library:SetWatermark('Brickmane#0447');
Library:Notify('Loading UI...');

local function AdminSucks()
   local A1 = "TP";
   local Event = game:GetService("ReplicatedStorage").OwSw;
   Event:FireServer(A1);
end;
local function BESTWEAPONWOWW()
local args = {
    [1] = "BestSwordEver";
    [2] = "OmegaRebirths";
    [3] = 0;
    [4] = "Unlock";
};

game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer(unpack(args));
end;

local GetItemsTab = Window:AddTab('Giver');
local GetitemsTabBox1 = GetItemsTab:AddLeftTabbox('Item Giver');
local Hi = GetitemsTabBox1:AddTab([[Item's]]);
Hi:AddButton('Get Admin Weapon', AdminSucks)
Hi:AddButton('Get the 60k omega rebirth weapon', BESTWEAPONWOWW)

local AutoFarmTab = Window:AddTab('AutoFarm');

local function JeezStopBeingANoLife()
   _G.AutoOMEGARebirth = true 
loadstring(game:HttpGet("https://raw.githubusercontent.com/Relkss/Testing_Exploit/main/Auto%20OMEGA%20Rebirth%20%232"))()
end

local AutoFarmTabBox1 = AutoFarmTab:AddLeftTabbox('sheesh');
local XD = AutoFarmTabBox1:AddTab('Auto Give Omega Rebirth');
XD:AddButton('Toggle Auto Omega', JeezStopBeingANoLife);



local SettingsTab = Window:AddTab('Settings');

local function UpdateTheme()
    Library.BackgroundColor = Options.BackgroundColor.Value;
    Library.MainColor = Options.MainColor.Value;
    Library.AccentColor = Options.AccentColor.Value;
    Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);
    Library.OutlineColor = Options.OutlineColor.Value;
    Library.FontColor = Options.FontColor.Value;

    Library:UpdateColorsUsingRegistry();
end;

local function SetDefault()
    Options.FontColor:SetValueRGB(Color3.fromRGB(255, 255, 255));
    Options.MainColor:SetValueRGB(Color3.fromRGB(28, 28, 28));
    Options.BackgroundColor:SetValueRGB(Color3.fromRGB(20, 20, 20));
    Options.AccentColor:SetValueRGB(Color3.fromRGB(0, 85, 255));
    Options.OutlineColor:SetValueRGB(Color3.fromRGB(50, 50, 50));
    Toggles.Rainbow:SetValue(false);

    UpdateTheme();
end;

local Theme = SettingsTab:AddLeftGroupbox('Theme');
Theme:AddLabel('Background Color'):AddColorPicker('BackgroundColor', { Default = Library.BackgroundColor });
Theme:AddLabel('Main Color'):AddColorPicker('MainColor', { Default = Library.MainColor });
Theme:AddLabel('Accent Color'):AddColorPicker('AccentColor', { Default = Library.AccentColor });
Theme:AddToggle('Rainbow', { Text = 'Rainbow Accent Color' });
Theme:AddLabel('Outline Color'):AddColorPicker('OutlineColor', { Default = Library.OutlineColor });
Theme:AddLabel('Font Color'):AddColorPicker('FontColor', { Default = Library.FontColor });
Theme:AddButton('Default Theme', SetDefault);
Theme:AddToggle('Keybinds', { Text = 'Show Keybinds Menu', Default = true }):OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.Keybinds.Value;
end);
Theme:AddToggle('Watermark', { Text = 'Show Watermark', Default = true }):OnChanged(function()
    Library:SetWatermarkVisibility(Toggles.Watermark.Value);
end);

task.spawn(function()
    while game:GetService('RunService').RenderStepped:Wait() do
        if Toggles.Rainbow.Value then
            local Registry = TestWindow.Holder.Visible and Library.Registry or Library.HudRegistry;

            for Idx, Object in next, Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if ColorIdx == 'AccentColor' or ColorIdx == 'AccentColorDark' then
                        local Instance = Object.Instance;
                        local yPos = Instance.AbsolutePosition.Y;

                        local Mapped = Library:MapValue(yPos, 0, 1080, 0, 0.5) * 1.5;
                        local Color = Color3.fromHSV((Library.CurrentRainbowHue - Mapped) % 1, 0.8, 1);

                        if ColorIdx == 'AccentColorDark' then
                            Color = Library:GetDarkerColor(Color);
                        end;

                        Instance[Property] = Color;
                    end;
                end;
            end;
        end;
    end;
end);

Toggles.Rainbow:OnChanged(function()
    if not Toggles.Rainbow.Value then
        UpdateTheme();
    end;
end);

Options.BackgroundColor:OnChanged(UpdateTheme);
Options.MainColor:OnChanged(UpdateTheme);
Options.AccentColor:OnChanged(UpdateTheme);
Options.OutlineColor:OnChanged(UpdateTheme);
Options.FontColor:OnChanged(UpdateTheme);

Library:Notify('Loaded UI!');




