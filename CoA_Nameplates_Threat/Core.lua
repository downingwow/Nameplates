TidyPlatesThreat = LibStub("AceAddon-3.0"):NewAddon("TidyPlatesThreat", "AceConsole-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("TidyPlatesThreat", false)
local LDS = LibStub("LibDualSpec-1.0", true)
local DB

local PlayerClass = select(2, UnitClass("player"))
local Active = function()
	return (GetActiveTalentGroup and GetActiveTalentGroup()) or 1
end
local HEX_CLASS_COLOR = {
	SHAMAN = "2459FF",
	MAGE = "69CCF0",
	WARLOCK = "9482C9",
	HUNTER = "ABD473",
	ROGUE = "FFF569",
	PRIEST = "FFFFFF",
	DRUID = "FF7D0A",
	DEATHKNIGHT = "C41F3B",
	WARRIOR = "C79C6E",
	PALADIN = "F58CBA"
}
-- CoA custom classes may not exist in the original ten-class color table.
setmetatable(HEX_CLASS_COLOR, { __index = function() return "FFFFFF" end })
local tankRole = L["|cff00ff00tanking|r"]
local dpsRole = L["|cffff0000dpsing / healing|r"]
--

TidyPlatesThemeList = TidyPlatesThemeList or {}
TidyPlatesThemeList["Threat Plates"] = {} -- legacy internal theme key retained for existing profiles

-- Callback Functions
function TidyPlatesThreat:ProfChange()
	TidyPlatesThreat:ConfigRefresh()
end

-- Dual Spec Functions
local currentSpec = {}
function TidyPlatesThreat:currentRoleBool(number)
	currentSpec[1] = TidyPlatesThreat.db.char.spec.primary
	currentSpec[2] = TidyPlatesThreat.db.char.spec.secondary
	if currentSpec[number] then
		return currentSpec[number]
	end
end
function TidyPlatesThreat:setSpecTank(number)
	if number == 1 then
		TidyPlatesThreat.db.char.spec["primary"] = true
	elseif number == 2 then
		TidyPlatesThreat.db.char.spec["secondary"] = true
	end
end
function TidyPlatesThreat:setSpecDPS(number)
	if number == 1 then
		TidyPlatesThreat.db.char.spec["primary"] = false
	elseif number == 2 then
		TidyPlatesThreat.db.char.spec["secondary"] = false
	end
end

function TidyPlatesThreat:dualSpec()
	currentSpec[3] = ""
	if Active() == 1 then
		currentSpec[3] = L["primary"]
	elseif Active() == 2 then
		currentSpec[3] = L["secondary"]
	else
		currentSpec[3] = L["unknown"]
	end
	return currentSpec[3]
end

function TidyPlatesThreat:roleText()
	if Active() == 1 then
		if TidyPlatesThreat.db.char.spec.primary then
			return tankRole
		else
			return dpsRole
		end
	elseif Active() == 2 then
		if TidyPlatesThreat.db.char.spec.secondary then
			return tankRole
		else
			return dpsRole
		end
	end
end

function TidyPlatesThreat:specName()
	local Spec = TidyPlatesThreat.db.char.specName
	local t = TidyPlatesThreat.db.char.specInfo[Active()] or {0, 0, 0}
	local spentTotal = t[1] + t[2] + t[3]
	if t[1] > t[2] and t[1] > t[3] then
		return Spec[1] or L["Undetermined"]
	elseif t[2] > t[1] and t[2] > t[3] then
		return Spec[2] or L["Undetermined"]
	elseif t[3] > t[1] and t[3] > t[2] then
		return Spec[3] or L["Undetermined"]
	else
		return (spentTotal < 1) and L["Undetermined"] or ""
	end
end
--

function TidyPlatesThreat:OnInitialize()
	local defaults = {
		char = {
			welcome = false,
			specInfo = {
				[1] = {[1] = 0, [2] = 0, [3] = 0},
				[2] = {[1] = 0, [2] = 0, [3] = 0}
			},
			threat = {tanking = true},
			spec = {primary = true, secondary = false},
			specName = {[1] = nil, [2] = nil, [3] = nil},
			stances = {
				ON = false,
				[0] = false, -- No Stance
				[1] = false, -- Battle Stance
				[2] = true, -- Defensive Stance
				[3] = false -- Berserker Stance
			},
			shapeshifts = {
				ON = false,
				[0] = false, -- Caster Form
				[1] = true, -- Bear Form
				[2] = false, -- Aquatic Form
				[3] = false, -- Cat Form
				[4] = false, -- Travel Form
				[5] = false, -- Moonkin Form, Tree of Life, (Swift) Flight Form
				[6] = false -- Flight Form (if moonkin or tree spec'd)
			},
			presences = {
				ON = false,
				[0] = false, -- No Presence
				[1] = true, -- Blood
				[2] = false, -- Frost
				[3] = false -- Unholy
			},
			auras = {
				ON = false,
				[0] = false, -- No Aura
				[1] = true, -- Devotion Aura
				[2] = false, -- Retribution Aura
				[3] = false, -- Concentration Aura
				[4] = false, -- Resistance Aura
				[5] = false -- Crusader Aura
			}
		},
		profile = {
			cache = {},
			OldSetting = true,
			verbose = true,
			blizzFade = {toggle = true, amount = -0.3},
			healthColorChange = false,
			customColor = true,
			allowClass = true,
			friendlyClass = false,
			friendlyNameOnly = false,
			friendlyClickThrough = false,
			friendlyClassIcon = true,
			cacheClass = false,
			castbarColor = {toggle = true, r = 1, g = 0, b = 0.8549019607843137, a = 1},
			castbarColorShield = {toggle = true, r = 0.1019607843137255, g = 0.09803921568627451, b = 0.7294117647058823, a = 1},
			aHPbarColor = {r = 0, g = 1, b = 0},
			bHPbarColor = {r = 1, g = 0, b = 0},
			fHPbarColor = {r = 0.2862745098039216, g = 0.8352941176470589, b = 0.4431372549019608},
			nHPbarColor = {r = 1, g = 0.9058823529411765, b = 0.196078431372549},
			HPbarColor = {r = 1, g = 0.2627450980392157, b = 0.2941176470588235},
			tHPbarColor = {r = 0, g = 0.5, b = 1},
			totemSettings = {
				hideHealthbar = true,
				-- Air Totems
				["A1"] = {true, true, true, nil, nil, nil, "special", color = {r = 0.67, g = 1, b = 1}},
				["A2"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.67, g = 1, b = 1}},
				["A3"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.67, g = 1, b = 1}},
				["A4"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.67, g = 1, b = 1}},
				["A5"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.67, g = 1, b = 1}},
				["A6"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.67, g = 1, b = 1}},
				-- Earth Totems
				["E1"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.7, b = 0.12}},
				["E2"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.7, b = 0.12}},
				["E3"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.7, b = 0.12}},
				["E4"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.7, b = 0.12}},
				["E5"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.7, b = 0.12}},
				["E6"] = {true, true, true, nil, nil, nil, "special", color = {r = 1, g = 0.7, b = 0.12}},
				-- Fire Totems
				["F1"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.4, b = 0.4}},
				["F2"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.4, b = 0.4}},
				["F3"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.4, b = 0.4}},
				["F4"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.4, b = 0.4}},
				["F5"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.4, b = 0.4}},
				["F6"] = {true, true, true, nil, nil, nil, "normal", color = {r = 1, g = 0.4, b = 0.4}},
				-- Water Totems
				["W1"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.58, g = 0.72, b = 1}},
				["W2"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.58, g = 0.72, b = 1}},
				["W3"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.58, g = 0.72, b = 1}},
				["W4"] = {true, true, true, nil, nil, nil, "normal", color = {r = 0.58, g = 0.72, b = 1}},
				["W5"] = {true, true, true, nil, nil, nil, "special", color = {r = 0.58, g = 0.72, b = 1}}
			},
			coaSummons = {},
			uniqueSettings = {
				list = {},
				["**"] = {
					name = "",
					showNameplate = true,
					showIcon = true,
					useStyle = true,
					useColor = true,
					allowMarked = true,
					overrideScale = false,
					overrideAlpha = false,
					icon = "",
					scale = 1,
					alpha = 1,
					color = {r = 1, g = 1, b = 1}
				},
			},
			text = {
				amount = true,
				percent = true,
				full = false,
				max = false,
				deficit = false,
				truncate = true
			},
			totemWidget = {
				ON = true,
				scale = 35,
				x = 0,
				y = 35,
				level = 1,
				anchor = "CENTER"
			},
			debuffWidget = {
				ON = false,
				x = 32,
				y = 32,
				mode = "all",
				scale = 1,
				anchor = "CENTER",
				filter = {}
			},
			uniqueWidget = {
				ON = true,
				scale = 35,
				x = 0,
				y = 35,
				level = 1,
				anchor = "CENTER"
			},
			classWidget = {
				ON = false,
				scale = 15,
				x = -70,
				y = 0,
				theme = "default",
				anchor = "CENTER"
			},
			targetWidget = {
				ON = false,
				theme = "arrow0",
				width = 30,
				height = 30,
				r = 1,
				g = 0.8509803921568627,
				b = 0.2666666666666667,
				a = 1,
				inverted = true
			},
			threatWidget = {
				ON = false,
				x = 0,
				y = 26,
				anchor = "CENTER"
			},
			tankedWidget = {
				ON = false,
				scale = 16,
				x = 65,
				y = 6,
				anchor = "CENTER"
			},
			comboWidget = {
				ON = false,
				scale = 64,
				x = 0,
				y = -8
			},
			eliteWidget = {
				ON = true,
				theme = "default",
				scale = 15,
				x = 64,
				y = 9,
				anchor = "CENTER"
			},
			socialWidget = {
				ON = false,
				scale = 16,
				x = 75,
				y = 0,
				anchor = "CENTER"
			},
			clickthrough = {
				friendly = false,
				enemy = false,
			},
			settings = {
				frame = {
					y = 0,
					x = 0,
					width = 124
				},
				highlight = {
					texture = "TP_HealthBarHighlight",
					width = 260
				},
				target = {
					texture = "TP_Target"
				},
				elitehealthborder = {
					texture = "TP_HealthBarEliteOverlay",
					show = true
				},
				healthborder = {
					texture = "TP_HealthBarOverlay",
					backdrop = "",
					show = true,
					width = 260
				},
				threatborder = {
					show = false,
					width = 260
				},
				healthbar = {
					texture = "ElvUI Norm",
					width = 120,
					height = 10
				},
				castnostop = {
					texture = "TP_CastBarLock",
					x = 0,
					y = -15,
					show = true,
					width = 260
				},
				castborder = {
					texture = "TP_CastBarOverlay",
					x = 0,
					y = -15,
					show = true,
					width = 260
				},
				castbar = {
					texture = "Solid",
					x = 0,
					y = -15,
					show = true,
					width = 120
				},
				name = {
					typeface = "Expressway",
					width = 200,
					height = 14,
					size = 11,
					x = 0,
					y = 10,
					align = "CENTER",
					vertical = "CENTER",
					shadow = true,
					flags = "OUTLINE",
					color = {
						r = 1,
						g = 1,
						b = 1
					},
					show = true
				},
				level = {
					typeface = "Expressway",
					size = 12,
					width = 20,
					height = 15,
					x = 50,
					y = 0,
					align = "RIGHT",
					vertical = "TOP",
					shadow = true,
					flags = "OUTLINE",
					show = true
				},
				eliteicon = {
					show = true,
					theme = "default",
					scale = 15,
					x = 70,
					y = 10,
					level = 22,
					anchor = "CENTER"
				},
				customtext = {
					typeface = "Accidental Presidency",
					size = 12,
					width = 110,
					height = 14,
					x = 0,
					y = 1,
					align = "CENTER",
					vertical = "CENTER",
					shadow = true,
					flags = "NONE",
					show = false
				},
				spelltext = {
					typeface = "Expressway",
					size = 10,
					width = 120,
					height = 14,
					x = 0,
					y = -14,
					align = "CENTER",
					vertical = "CENTER",
					shadow = true,
					flags = "OUTLINE",
					show = true
				},
				raidicon = {
					scale = 35,
					x = -35,
					y = 0,
					anchor = "LEFT",
					hpColor = false,
					show = true,
					hpMarked = {
						STAR = {r = 0.85, g = 0.81, b = 0.27},
						MOON = {r = 0.60, g = 0.75, b = 0.85},
						CIRCLE = {r = 0.93, g = 0.51, b = 0.06},
						SQUARE = {r = 0, g = 0.64, b = 1},
						DIAMOND = {r = 0.7, g = 0.06, b = 0.84},
						CROSS = {r = 0.82, g = 0.18, b = 0.18},
						TRIANGLE = {r = 0.14, g = 0.66, b = 0.14},
						SKULL = {r = 0.89, g = 0.83, b = 0.74}
					}
				},
				spellicon = {
					scale = 15,
					x = -75,
					y = -14,
					anchor = "CENTER",
					show = true
				},
				customart = {
					scale = 22,
					x = -74,
					y = -7,
					anchor = "CENTER",
					show = true
				},
				skullicon = {
					scale = 16,
					x = 70,
					y = -5,
					anchor = "CENTER",
					show = true
				},
				unique = {
					threatcolor = {
						LOW = {r = 0, g = 0, b = 0, a = 0},
						MEDIUM = {r = 0, g = 0, b = 0, a = 0},
						HIGH = {r = 0, g = 0, b = 0, a = 0}
					}
				},
				totem = {
					threatcolor = {
						LOW = {r = 0, g = 0, b = 0, a = 0},
						MEDIUM = {r = 0, g = 0, b = 0, a = 0},
						HIGH = {r = 0, g = 0, b = 0, a = 0}
					}
				},
				normal = {
					threatcolor = {
						LOW = {r = 1, g = 1, b = 1, a = 1},
						MEDIUM = {r = 1, g = 1, b = 0, a = 1},
						HIGH = {r = 1, g = 0.2549019607843137, b = 0.2313725490196079, a = 1}
					}
				},
				dps = {
					threatcolor = {
						LOW = {r = 1, g = 0.9058823529411765, b = 0, a = 0},
						MEDIUM = {r = 1, g = 0.6039215686274509, b = 0, a = 1},
						HIGH = {r = 1, g = 0.1450980392156863, b = 0.1607843137254902, a = 1}
					}
				},
				tank = {
					threatcolor = {
						LOW = {r = 1, g = 0.1450980392156863, b = 0.1607843137254902, a = 1},
						MEDIUM = {r = 1, g = 1, b = 0, a = 1},
						HIGH = {r = 0, g = 1, b = 0, a = 1}
					}
				}
			},
			threat = {
				ON = true,
				nonCombat = true,
				hideNonCombat = false,
				useType = true,
				useScale = false,
				useAlpha = true,
				useHPColor = true,
				art = {
					ON = false,
					theme = "default"
				},
				scaleType = {
					["Normal"] = -0.2,
					["Elite"] = 0,
					["Boss"] = 0.2
				},
				toggle = {
					["Boss"] = true,
					["Elite"] = true,
					["Normal"] = true,
					["Neutral"] = true
				},
				dps = {
					scale = {
						LOW = 1,
						MEDIUM = 1,
						HIGH = 1
					},
					alpha = {
						LOW = 1,
						MEDIUM = 1,
						HIGH = 1
					}
				},
				tank = {
					scale = {
						LOW = 1.25,
						MEDIUM = 0.9,
						HIGH = 0.8
					},
					alpha = {
						LOW = 1,
						MEDIUM = 0.85,
						HIGH = 0.75
					}
				},
				marked = {
					alpha = false,
					art = false,
					scale = false
				}
			},
			nameplate = {
				toggle = {
					["Boss"] = true,
					["Elite"] = true,
					["Normal"] = true,
					["Neutral"] = true,
					["Totem"] = true
				},
				scale = {
					["Totem"] = 0.75,
					["Boss"] = 0.95,
					["Elite"] = 0.95,
					["Normal"] = 0.95,
					["Target"] = 1,
					["Neutral"] = 0.95,
					["Marked"] = 1
				},
				alpha = {
					["Totem"] = 1,
					["Boss"] = 0.9,
					["Elite"] = 0.7,
					["Normal"] = 0.7,
					["Neutral"] = 0.7,
					["Marked"] = 1
				}
			}
		}
	}
	local db = LibStub("AceDB-3.0"):New("ThreatPlatesDB", defaults, "Default")
	self.db = db
    -- One-time migration: remove all preinstalled custom entries from existing profiles.
    if not db.global.coaEmptyCustomMigration then
        for _, profile in pairs(db.profiles or {}) do
            if type(profile.uniqueSettings) == "table" then
                for key in pairs(profile.uniqueSettings) do
                    if type(key) == "number" then profile.uniqueSettings[key] = nil end
                end
                profile.uniqueSettings.list = {}
            end
        end
        db.global.coaEmptyCustomMigration = true
    end

	-- dual spec profiles
	if LDS then LDS:EnhanceDatabase(self.db, "CoA Nameplates - Threat System") end

	local RegisterCallback = db.RegisterCallback

	RegisterCallback(self, "OnProfileChanged", "ProfChange")
	RegisterCallback(self, "OnProfileCopied", "ProfChange")
	RegisterCallback(self, "OnProfileReset", "ProfChange")

	self:SetUpInitialOptions()
end

local UnitInGroup = TidyPlatesUtility.UnitInGroup
local TotemNameFallback = TidyPlatesUtility.TotemNameFallback
-- Unit Classification
function TidyPlatesThreat.UnitType(unit)
	DB = TidyPlatesThreat.db.profile
	local totem = (unit.name and DB.coaSummons and DB.coaSummons[unit.name] and "COA_SUMMON")
		or TPtotemList[unit.name] or TPtotemList[TotemNameFallback(unit.name)]

	-- a totem?
	if totem == "COA_SUMMON" then
		return "Normal"
	elseif totem then
		return "Totem"
	end

	-- a unique unit?
	local unique = tContains(DB.uniqueSettings.list, unit.name)
	if unique then
		for k_c, k_v in pairs(DB.uniqueSettings.list) do
			if k_v == unit.name then
				if DB.uniqueSettings[k_c].useStyle then
					return "Unique"
				else
					if (unit.isDangerous and (unit.reaction == "FRIENDLY" or unit.reaction == "HOSTILE")) then
						return "Boss"
					elseif (unit.isElite and not unit.isDangerous and (unit.reaction == "FRIENDLY" or unit.reaction == "HOSTILE")) then
						return "Elite"
					elseif (not unit.isElite and not unit.isDangerous and (unit.reaction == "FRIENDLY" or unit.reaction == "HOSTILE")) then
						return "Normal"
					elseif unit.reaction == "NEUTRAL" then
						return "Neutral"
					end
				end
			end
		end
	end

	-- a group member with hidden nameplates?
	if (tContains(DB.uniqueSettings.list, "GROUP") and unit.name and UnitInGroup(unit.name)) then
		if DB.friendlyNameOnly then
			return "Normal", true
		end
		for k_c, k_v in pairs(DB.uniqueSettings.list) do
			if k_v == "GROUP" then
				if DB.uniqueSettings[k_c].useStyle then
					return "Unique", true
				else
					return "Normal", true
				end
			end
		end
	end

	-- aboss?
	if (unit.isDangerous and (unit.reaction == "FRIENDLY" or unit.reaction == "HOSTILE")) then
		return "Boss"
	end

	-- an elite?
	if (unit.isElite and not unit.isDangerous and (unit.reaction == "FRIENDLY" or unit.reaction == "HOSTILE")) then
		return "Elite"
	end

	-- just an oridinary unit?
	if (not unit.isElite and not unit.isDangerous and (unit.reaction == "FRIENDLY" or unit.reaction == "HOSTILE")) then
		return "Normal"
	end

	-- a neutral unit?
	if unit.reaction == "NEUTRAL" then
		return "Neutral"
	end

	-- well, fallback to normal.
	return "Normal"
end

function TidyPlatesThreat.SetStyle(unit)
	DB = TidyPlatesThreat.db.profile
	local T, custom = TidyPlatesThreat.UnitType(unit)
	if T == "Totem" then
		local tS = DB.totemSettings[TPtotemList[unit.name] or TPtotemList[TotemNameFallback(unit.name)]]
		if tS[1] then
			if DB.totemSettings.hideHealthbar then
				return "etotem"
			else
				return "totem"
			end
		else
			return "empty"
		end
	elseif T == "Unique" then
		for k_c, k_v in pairs(DB.uniqueSettings.list) do
			if custom and k_v == "GROUP" then
				if DB.friendlyNameOnly then
					return "text"
				elseif DB.uniqueSettings[k_c].showNameplate then
					return "unique", true
				else
					return "empty", true
				end
			elseif k_v == unit.name then
				if DB.uniqueSettings[k_c].showNameplate then
					return "unique"
				else
					return "empty"
				end
			end
		end
	elseif T then
		if unit.reaction == "HOSTILE" or unit.reaction == "NEUTRAL" then
			if DB.nameplate.toggle[T] then
				if DB.threat.toggle[T] and DB.threat.ON and unit.class == "UNKNOWN" and InCombatLockdown() then
					if DB.threat.nonCombat then
						if unit.isInCombat or (unit.health < unit.healthmax) then
							if TidyPlatesThreat.db.char.threat.tanking then
								return "tank"
							else
								return "dps"
							end
						else
							if not DB.threat.hideNonCombat then
								return "normal"
							else
								return "empty"
							end
						end
					else
						if TidyPlatesThreat.db.char.threat.tanking then
							return "tank"
						else
							return "dps"
						end
					end
				else
					return "normal"
				end
			else
				return "empty"
			end
		elseif unit.reaction == "FRIENDLY" then
			if DB.friendlyNameOnly then
				return "text"
			elseif DB.nameplate.toggle[T] then
				return "normal"
			else
				return "empty"
			end
		else
			return "empty"
		end
	else
		return "empty"
	end
end

local function ShowConfigPanel()
	TidyPlatesThreat:OpenOptions()
end
------------
-- EVENTS --
------------
function TidyPlatesThreat:specInfo()
	for i = 1, (GetNumTalentGroups and GetNumTalentGroups() or 1) do
		self.db.char.specInfo[i] = self.db.char.specInfo[i] or {0, 0, 0}
		for z = 1, math.min(3, (GetNumTalentTabs and GetNumTalentTabs() or 0)) do
			local name, _, pointsSpent = GetTalentTabInfo(z, false, false, i)
			self.db.char.specInfo[i][z] = pointsSpent or 0
			self.db.char.specName[z] = name or "Unknown"
		end
	end
end

function TidyPlatesThreat:StartUp()
	TidyPlatesThreat:specInfo()
	local t = self.db.char.specInfo[Active()] or {0, 0, 0}
	-- Welcome
	local Welcome = L["|cff89f559Welcome to |rTidy Plates: |cff89f559Threat Plates!\nThis is your first time using Threat Plates and you are a(n):\n|r|cff"] .. HEX_CLASS_COLOR[PlayerClass] .. TidyPlatesThreat:specName() .. " " .. UnitClass("player") .. ": " .. t[1] .. "/" .. t[2] .. "/" .. t[3] .. "|r|cff89F559.|r\n"
	-- Body
	local NotTank = Welcome .. L["|cff89f559Your dual spec's have been set to |r"] .. dpsRole .. "|cff89f559.|r"
	local CurrentlyDPS = Welcome .. L["|cff89f559You are currently in your "] .. dpsRole .. L["|cff89f559 role.|r"]
	local CurrentlyTank = Welcome .. L["|cff89f559You are currently in your "] .. tankRole .. L["|cff89f559 role.|r"]
	local Undetermined = Welcome .. L["|cff89f559Your role can not be determined.\nPlease set your dual spec preferences in the |rThreat Plates|cff89f559 options.|r"]
	-- End
	local Conclusion = L["|cff89f559Additional options can be found by typing |r'/tptp'|cff89F559.|r"]

	-- Welcome Setup / Display
	if not self.db.char.welcome then
		self.db.char.welcome = true
		if ((TidyPlatesOptions.primary ~= "Threat Plates") and (TidyPlatesOptions.secondary ~= "Threat Plates")) then
			local spec = TidyPlatesThreat:dualSpec()
			StaticPopupDialogs["SetToThreatPlates"] = {
				text = GetAddOnMetadata("CoA_Nameplates_Threat", "title") .. L[":\n----------\nWould you like to \nset your theme to |cff89F559Threat Plates|r?\n\nClicking '|cff00ff00Yes|r' will set you to Threat Plates & reload UI. \n Clicking '|cffff0000No|r' will open the Tidy Plates options."],
				button1 = YES,
				button2 = CANCEL,
				button3 = NO,
				timeout = 0,
				whileDead = 1,
				hideOnEscape = 1,
				OnAccept = function()
					TidyPlatesOptions.primary = "Threat Plates"
					TidyPlatesOptions.secondary = "Threat Plates"
					ReloadUI()
				end,
				OnAlt = function()
					InterfaceOptionsFrame_OpenToCategory("CoA Nameplates")
				end,
				OnCancel = function()
					if TidyPlatesThreat.db.profile.verbose then
						print(L["-->>|cffff0000Activate Threat Plates from the Tidy Plates options!|r<<--"])
					end
				end
			}
			StaticPopup_Show("SetToThreatPlates")
		end
		if
			PlayerClass == "SHAMAN" or
			PlayerClass == "MAGE" or
			PlayerClass == "HUNTER" or
			PlayerClass == "ROGUE" or
			PlayerClass == "PRIEST" or
			PlayerClass == "WARLOCK"
		then
			if TidyPlatesThreat.db.profile.verbose then
				print(NotTank)
			end
			for i = 1, GetNumTalentGroups() do
				TidyPlatesThreat:setSpecDPS(i)
			end
		elseif PlayerClass == "WARRIOR" then
			if t[3] > t[2] and t[3] > t[1] then -- Detects protection spec
				if TidyPlatesThreat.db.profile.verbose then
					print(CurrentlyTank)
				end
			else
				if TidyPlatesThreat.db.profile.verbose then
					print(CurrentlyDPS)
				end
			end
			for i = 1, GetNumTalentGroups() do
				local z = self.db.char.specInfo[i]
				if z[3] > z[2] and z[3] > z[1] then -- Detects protection spec
					TidyPlatesThreat:setSpecTank(i)
				else
					TidyPlatesThreat:setSpecDPS(i)
				end
			end
		elseif PlayerClass == "PALADIN" then
			if t[2] > t[1] and t[2] > t[3] then -- Detects protection spec
				if TidyPlatesThreat.db.profile.verbose then
					print(CurrentlyTank)
				end
			else
				if TidyPlatesThreat.db.profile.verbose then
					print(CurrentlyDPS)
				end
			end
			for i = 1, GetNumTalentGroups() do
				local z = self.db.char.specInfo[i]
				if z and z[2] > z[1] and z[2] > z[3] then -- Detects protection spec
					TidyPlatesThreat:setSpecTank(i)
				else
					TidyPlatesThreat:setSpecDPS(i)
				end
			end
		elseif PlayerClass == "DRUID" then
			if (t[2] > t[1]) and (t[2] > t[3]) then
				if TidyPlatesThreat.db.profile.verbose then
					print(Undetermined)
				end
			else
				if TidyPlatesThreat.db.profile.verbose then
					print(CurrentlyDPS)
				end
			end
			for i = 1, GetNumTalentGroups() do
				local z = self.db.char.specInfo[i]
				if z and z[2] > z[1] and z[2] > z[3] then -- Detects feral spec
					TidyPlatesThreat:setSpecTank(i)
				else
					TidyPlatesThreat:setSpecDPS(i)
				end
			end
		elseif PlayerClass == "DEATHKNIGHT" then
			if TidyPlatesThreat.db.profile.verbose then
				print(Undetermined)
			end
		else
			if TidyPlatesThreat.db.profile.verbose then
				print(Welcome)
			end
		end
		if TidyPlatesThreat.db.profile.verbose then
			print(Conclusion)
		end
		self.db.char.threat.tanking = TidyPlatesThreat:currentRoleBool(Active()) -- Aligns tanking role with current spec on log in, post setup.
		if GetCVar("ShowVKeyCastbar") == "1" then
			TidyPlatesThreat.db.profile.settings.castbar.show = true
		else
			TidyPlatesThreat.db.profile.settings.castbar.show = false
		end
	end
end
--
local f = CreateFrame("Frame")
local function EventHandler(self, event, ...)
	DB = TidyPlatesThreat.db.profile
	local CharDB = TidyPlatesThreat.db.char
	local arg1, arg2 = ...
	if event == "ADDON_LOADED" then
		if arg1 == "CoA_Nameplates_Threat" then
			local setup = {
				SetStyle = TidyPlatesThreat.SetStyle,
				SetScale = TidyPlatesThreat.SetScale,
				SetAlpha = TidyPlatesThreat.SetAlpha,
				SetCustomText = TidyPlatesThreat.SetCustomText,
				SetNameColor = TidyPlatesThreat.SetNameColor,
				SetThreatColor = TidyPlatesThreat.SetThreatColor,
				SetCastbarColor = TidyPlatesThreat.SetCastbarColor,
				SetHealthbarColor = TidyPlatesThreat.SetHealthbarColor,
				ShowConfigPanel = ShowConfigPanel
			}
			TidyPlatesThemeList["Threat Plates"] = setup
		end
		f:UnregisterEvent("ADDON_LOADED")
	elseif event == "PLAYER_LOGIN" then
		TidyPlatesThreat:StartUp()
		CharDB.threat.tanking = TidyPlatesThreat:currentRoleBool(Active()) -- Aligns tanking role with current spec on log in.
		if GetCVar("nameplateShowEnemyTotems") == "1" then
			DB.nameplate.toggle["Totem"] = true
		else
			DB.nameplate.toggle["Totem"] = false
		end
		SetCVar("ShowClassColorInNameplate", 1)

		if CharDB.welcome and ((TidyPlatesOptions.primary == "Threat Plates") or (TidyPlatesOptions.secondary == "Threat Plates")) and DB.verbose then
			print(L["|cff89f559Threat Plates:|r Welcome back |cff"] .. HEX_CLASS_COLOR[PlayerClass] .. UnitName("player") .. "|r!!")
		end

		-- Enable Stances / Shapeshifts and Create Options Tables
		if PlayerClass == "WARRIOR" or PlayerClass == "DRUID" or PlayerClass == "DEATHKNIGHT" or PlayerClass == "PALADIN" then
			f:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		local iType = select(2, IsInInstance())
		if iType == "arena" or iType == "pvp" then
			DB.threat.ON = false
		elseif iType == "party" or iType == "raid" or iType == "none" then
			DB.threat.ON = DB.OldSetting
		end
		DB.cache = {}
		self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	elseif event == "PLAYER_LEAVING_WORLD" then
		self:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	elseif event == "ACTIVE_TALENT_GROUP_CHANGED" then
		local t = CharDB.specInfo[Active()]
		CharDB.threat.tanking = TidyPlatesThreat:currentRoleBool(Active())
		if ((TidyPlatesOptions.primary == "Threat Plates") or (TidyPlatesOptions.secondary == "Threat Plates")) and DB.verbose then
			print(L["|cff89F559Threat Plates|r: Player spec change detected: |cff"] .. HEX_CLASS_COLOR[PlayerClass] .. TidyPlatesThreat:specName() .. ": (" .. t[1] .. "/" .. t[2] .. "/" .. t[3] .. L[")|r, you are now in your |cff89F559"] .. TidyPlatesThreat:dualSpec() .. L["|r spec and are now in your "] .. TidyPlatesThreat:roleText() .. L[" role."])
		end
		TidyPlates:ForceUpdate()
	elseif event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_REGEN_ENABLED" then
		if DB.threat.ON and (tonumber(GetCVar("threatWarning")) ~= 3) then
			SetCVar("threatWarning", 3)
		elseif not DB.threat.ON and (tonumber(GetCVar("threatWarning")) ~= 0) then
			SetCVar("threatWarning", 0)
		end
	elseif event == "PLAYER_LOGOUT" then
		DB.cache = {}
	elseif event == "RAID_TARGET_UPDATE" then
		TidyPlates:Update()
	elseif event == "UPDATE_SHAPESHIFT_FORM" then
		TidyPlatesThreat.ShapeshiftUpdate()
	end
end
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_LEAVING_WORLD")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("PLAYER_LOGOUT")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("RAID_TARGET_UPDATE")
f:SetScript("OnEvent", EventHandler)