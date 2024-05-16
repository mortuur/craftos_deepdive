
-- chest_monitor.luasdsdsdsdsdsdsd
function print_inventory_on_monitor(chest, monitor)
    monitor.clear()
    local width, height = monitor.getSize()
    local cursorY = math.floor((height - 1) / 2)

    for slot, item in pairs(chest.list()) do
        local name = string.gsub(item.name, "minecraft:", "")
        local text = item.count .. " x " .. name .. " in slot " .. slot

        -- Het horizontale midden vinden
        local cursorX = math.floor((width - string.len(text)) / 2)

        monitor.setCursorPos(cursorX, cursorY)
        monitor.write(text)
        
        cursorY = cursorY + 3 -- Naar de volgende regel gaan
    end
end


---  De while loop om elke 10 seconden de monitor te updaten
while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("chest")
    print_inventory_on_monitor(chest, monitor)

    sleep(10)
end

end
