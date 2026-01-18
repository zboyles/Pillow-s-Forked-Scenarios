-- Storage for mod options (native B42 ModOptions API)
PillowModOptions = {
  options = {
    alwaysdire = nil,
    alwaysbrutal = nil,
  }
}

-- Initialize native B42 ModOptions
local function initPillowModOptions()
  local options = PZAPI.ModOptions:create("PillowsRandomScenarios", getText("UI_options_PillowsRandomScenarios_title"))

  options:addDescription(getText("UI_options_PillowsRandomScenarios_desc"))

  PillowModOptions.options.alwaysdire = options:addTickBox("alwaysdire", getText("UI_options_PillowsRandomScenarios_alwaysdire"), false, getText("UI_options_PillowsRandomScenarios_alwaysdire_tooltip"))
  PillowModOptions.options.alwaysbrutal = options:addTickBox("alwaysbrutal", getText("UI_options_PillowsRandomScenarios_alwaysbrutal"), false, getText("UI_options_PillowsRandomScenarios_alwaysbrutal_tooltip"))
end

initPillowModOptions()

-- Helper functions to get option values (for use by scenario files)
function PillowModOptions.getAlwaysDire()
  if PillowModOptions.options.alwaysdire then
    return PillowModOptions.options.alwaysdire:getValue()
  end
  return false
end

function PillowModOptions.getAlwaysBrutal()
  if PillowModOptions.options.alwaysbrutal then
    return PillowModOptions.options.alwaysbrutal:getValue()
  end
  return false
end

-- Check actual options at game loading.
Events.OnGameStart.Add(function()
  print("always dire = ", PillowModOptions.getAlwaysDire())
  print("always brutal = ", PillowModOptions.getAlwaysBrutal())
end)



local orig_clickPlay = NewGameScreen.clickPlay

--2024-12-16 add this stuff from Immersive Scenarios for sandbox settings
function NewGameScreen:clickPlay()
    self:setVisible(false);

    MainScreen.instance.charCreationProfession.previousScreen = "NewGameScreen";
    getWorld():setGameMode(self.selectedItem.mode);

    MainScreen.instance:setDefaultSandboxVars()

    if self.selectedItem.mode == "Challenge" then
        getWorld():setDifficulty("Hardcore");
        LastStandData.chosenChallenge = self.selectedItem.challenge;
        
        if LastStandData.chosenChallenge and LastStandData.chosenChallenge.enableSandbox == true then                     
            local worldName = LastStandData.chosenChallenge.id.."-"..ZombRand(100000)..ZombRand(100000)..ZombRand(100000)..ZombRand(100000);
            doChallenge(self.selectedItem.challenge);
            getWorld():setWorld(sanitizeWorldName(worldName));
            
            local globalChallenge = LastStandData.chosenChallenge;
            globalChallenge.OnInitWorld();
            --Events.OnGameStart.Add(globalChallenge.OnGameStart); -- Direct call. Normally called by OnInitWorld()
            
            getWorld():setMap("DEFAULT")
            MainScreen.instance.createWorld = true                  
            MapSpawnSelect.instance:useDefaultSpawnRegion()
            
            getWorld():setGameMode("Sandbox")
            MainScreen.instance.sandOptions:setVisible(true, self.joyfocus)
    
            return
        end
    end

    orig_clickPlay(self)
end

local orig_onOptionMouseDown = SandboxOptionsScreen.onOptionMouseDown

-- Override to back button for Sandbox Options
function SandboxOptionsScreen:onOptionMouseDown(button, x, y)

    if button.internal == "BACK" and LastStandData.chosenChallenge and LastStandData.chosenChallenge.enableSandbox == true then     
        self:setVisible(false);
        MainScreen.instance.soloScreen:setVisible(true, self.joyfocus)
    else
        orig_onOptionMouseDown(self, button, x, y)
    end 
    
end
