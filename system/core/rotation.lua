-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.rotation = {
  rotations = { },
  oocrotations =  { },
  custom = { },
  ooccustom = { },
  cdesc = { },
  buttons = { },
  specId = { },
  classSpecId = { },
  currentStringComp = "",
  activeRotation = false,
  activeOOCRotation = false,
}

ProbablyEngine.rotation.specId[62] = 'Arcane Mage'
ProbablyEngine.rotation.specId[63] = 'Fire Mage'
ProbablyEngine.rotation.specId[64] = 'Frost Mage'
ProbablyEngine.rotation.specId[65] = 'Holy Paladin'
ProbablyEngine.rotation.specId[66] = 'Protection Paladin'
ProbablyEngine.rotation.specId[70] = 'Retribution Paladin'
ProbablyEngine.rotation.specId[71] = 'Arms Warrior'
ProbablyEngine.rotation.specId[72] = 'Furry Warrior'
ProbablyEngine.rotation.specId[73] = 'Protection Warrior'
ProbablyEngine.rotation.specId[102] = 'Balance Druid'
ProbablyEngine.rotation.specId[103] = 'Feral Combat Druid'
ProbablyEngine.rotation.specId[104] = 'Guardian Druid'
ProbablyEngine.rotation.specId[105] = 'Restoration Druid'
ProbablyEngine.rotation.specId[250] = 'Blood Death Knight'
ProbablyEngine.rotation.specId[251] = 'Frost Death Knight'
ProbablyEngine.rotation.specId[252] = 'Unholy Death Knight'
ProbablyEngine.rotation.specId[253] = 'Beast Mastery Hunter'
ProbablyEngine.rotation.specId[254] = 'Marksmanship Hunter'
ProbablyEngine.rotation.specId[255] = 'Survival Hunter'
ProbablyEngine.rotation.specId[256] = 'Discipline Priest'
ProbablyEngine.rotation.specId[257] = 'Holy Priest'
ProbablyEngine.rotation.specId[258] = 'Shadow Priest'
ProbablyEngine.rotation.specId[259] = 'Assassination Rogue'
ProbablyEngine.rotation.specId[260] = 'Combat Rogue'
ProbablyEngine.rotation.specId[261] = 'Subtlety Rogue'
ProbablyEngine.rotation.specId[262] = 'Elemental Shaman'
ProbablyEngine.rotation.specId[263] = 'Enhancement Shaman'
ProbablyEngine.rotation.specId[264] = 'Restoration Shaman'
ProbablyEngine.rotation.specId[265] = 'Affliction Warlock'
ProbablyEngine.rotation.specId[266] = 'Demonology Warlock'
ProbablyEngine.rotation.specId[267] = 'Destruction Warlock'
ProbablyEngine.rotation.specId[268] = 'Brewmaster Monk'
ProbablyEngine.rotation.specId[269] = 'Windwalker Monk'
ProbablyEngine.rotation.specId[270] = 'Mistweaver Monk'

ProbablyEngine.rotation.classSpecId[62] = 8
ProbablyEngine.rotation.classSpecId[63] = 8
ProbablyEngine.rotation.classSpecId[64] = 8
ProbablyEngine.rotation.classSpecId[65] = 2
ProbablyEngine.rotation.classSpecId[66] = 2
ProbablyEngine.rotation.classSpecId[70] = 2
ProbablyEngine.rotation.classSpecId[71] = 1
ProbablyEngine.rotation.classSpecId[72] = 1
ProbablyEngine.rotation.classSpecId[73] = 1
ProbablyEngine.rotation.classSpecId[102] = 11
ProbablyEngine.rotation.classSpecId[103] = 11
ProbablyEngine.rotation.classSpecId[104] = 11
ProbablyEngine.rotation.classSpecId[105] = 11
ProbablyEngine.rotation.classSpecId[250] = 6
ProbablyEngine.rotation.classSpecId[251] = 6
ProbablyEngine.rotation.classSpecId[252] = 6
ProbablyEngine.rotation.classSpecId[253] = 3
ProbablyEngine.rotation.classSpecId[254] = 3
ProbablyEngine.rotation.classSpecId[255] = 3
ProbablyEngine.rotation.classSpecId[256] = 5
ProbablyEngine.rotation.classSpecId[257] = 5
ProbablyEngine.rotation.classSpecId[258] = 5
ProbablyEngine.rotation.classSpecId[259] = 4
ProbablyEngine.rotation.classSpecId[260] = 4
ProbablyEngine.rotation.classSpecId[261] = 4
ProbablyEngine.rotation.classSpecId[262] = 7
ProbablyEngine.rotation.classSpecId[263] = 7
ProbablyEngine.rotation.classSpecId[264] = 7
ProbablyEngine.rotation.classSpecId[265] = 9
ProbablyEngine.rotation.classSpecId[266] = 9
ProbablyEngine.rotation.classSpecId[267] = 9
ProbablyEngine.rotation.classSpecId[268] = 10
ProbablyEngine.rotation.classSpecId[269] = 10
ProbablyEngine.rotation.classSpecId[270] = 10

ProbablyEngine.rotation.register = function(specId, spellTable, arg1, arg2)

  local buttons, oocrotation = nil, nil

  if type(arg1) == "table" then
    oocrotation = arg1
  end
  if type(arg1) == "function" then
    buttons = arg1
  end
  if type(arg2) == "table" then
    oocrotation = arg2
  end
  if type(arg2) == "function" then
    buttons = arg2
  end

  ProbablyEngine.rotation.rotations[specId] = spellTable

  if oocrotation then
    ProbablyEngine.rotation.oocrotations[specId] = oocrotation
  end

  if buttons and type(buttons) == 'function' then
    ProbablyEngine.rotation.buttons[specId] = buttons
  end

  ProbablyEngine.debug('Loaded Rotation for ' .. ProbablyEngine.rotation.specId[specId], 3)
end


ProbablyEngine.rotation.register_custom = function(specId, _desc, _spellTable, arg1, arg2)

  local _oocrotation, _buttons = false

  if type(arg1) == "table" then
    _oocrotation = arg1
  end
  if type(arg1) == "function" then
    _buttons = arg1
  end
  if type(arg2) == "table" then
    _oocrotation = arg2
  end
  if type(arg2) == "function" then
    _buttons = arg2
  end

  if _oocrotation then
    ProbablyEngine.rotation.ooccustom[specId] = _oocrotation
  end

  if not ProbablyEngine.rotation.custom[specId] then
    ProbablyEngine.rotation.custom[specId] = { }
  end

  table.insert(ProbablyEngine.rotation.custom[specId], {
    desc = _desc,
    spellTable = _spellTable,
    oocrotation = _oocrotation,
    buttons = _buttons,
  })

  ProbablyEngine.debug('Loaded Custom Rotation for ' .. ProbablyEngine.rotation.specId[specId], 3)
end

-- Lower memory used, no need in storing rotations for other classes
ProbablyEngine.rotation.auto_unregister = function()
  local classId = select(3, UnitClass("player"))
  for specId,_ in pairs(ProbablyEngine.rotation.rotations) do
    if ProbablyEngine.rotation.classSpecId[specId] ~= classId then
      ProbablyEngine.debug('AutoUnloaded Rotation for ' .. ProbablyEngine.rotation.specId[specId], 3)
      ProbablyEngine.rotation.classSpecId[specId] = nil
      ProbablyEngine.rotation.specId[specId] = nil
      ProbablyEngine.rotation.rotations[specId] = nil
      ProbablyEngine.rotation.buttons[specId] = nil
    end
  end
  collectgarbage('collect')
end

ProbablyEngine.rotation.add_buttons = function()
  if ProbablyEngine.rotation.buttons[ProbablyEngine.module.player.specId] then
    ProbablyEngine.rotation.buttons[ProbablyEngine.module.player.specId]()
  end
end
