-- ProbablyEngine v0.0.1
-- Ben Phelps (c) 2013

ProbablyEngine.debug = function(message, level)
  if level == nil then level = 0 end
  if ProbablyEngine.debugLevel >= level then
    print("[Debug] " .. message)
  end
end

ProbablyEngine.print = function(message)
  print("|TInterface\\Addons\\Probably\\system\\media\\swords.tga:10:10|t|cFF"..ProbablyEngine.addonColor.."["..ProbablyEngine.addonName.."] " .. message .. "|r")
end

ProbablyEngine.dump = function(object) -- protected
  print(object)
  ProbablyEngine.have_plua = true
end

ProbablyEngine.plua_check = function() -- protected
  if ProbablyEngine.plua == true then return end
  RunMacroText("/run ProbablyEngine_plua_check_bool = true")
  if ProbablyEngine_plua_check_bool == true then
    ProbablyEngine.plua = true
    ProbablyEngine_plua_check_bool = nil
    ProbablyEngine.print("Plua functionality enabled, we are good to go.")
  end
end