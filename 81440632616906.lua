-- В функции LoadExternalTabs в main.lua замените выполнение кода на:

local func, err = loadstring("return "..response)()  -- Загружаем как функцию
if type(func) == "function" then
    -- Вызываем функцию, передавая Window и Rayfield
    local ok, msg = pcall(func, Window, Rayfield)
    if not ok then
        warn("Failed to execute external tabs:", msg)
        return false
    end
    return true
else
    warn("External tabs file should return a function")
    return false
end
