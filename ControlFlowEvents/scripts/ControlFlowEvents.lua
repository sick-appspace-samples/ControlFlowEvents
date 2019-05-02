--[[----------------------------------------------------------------------------

  Application Name:
  ControlFlowEvents

  Summary:
  Introduction of how to notify and react on events from within a ControlFlow

  Description:
  This sample shows how to notify an event to which a ControlFlow block is
  registered to. Another event is notified from ControlFlow which a function in
  this script is registered to.
  1. Script notifying event -> Controlflow reacts
  2. Delay of 2000 ms within Controlflow
  3. ControlFlow notifying event -> Script reacts

  How to run:
  This sample can be run on any device or on the emulator. After startup the delayed
  event triggers a function from the script which prints to the console.

------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

-- Serving an event which is used to trigger the ControlFlow. Must be served to the Engine CROWN.
-- Engine events are always global, no serve in App properties necessary
Script.serveEvent('Engine.OnMyEventIn', 'OnMyEventIn')

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  -- Notify the event to trigger the ControlFlow directly after startup
  Script.notifyEvent('OnMyEventIn')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

-- Function is registered to the event which is raised from the flow
local function callFromFlow()
  print('ControlFlow says hello')
end
-- Registration to the 'Engine.OnMyEventOut' as specified in the ControlFlow
Script.register('Engine.OnMyEventOut', callFromFlow)

--End of Function and Event Scope-----------------------------------------------
