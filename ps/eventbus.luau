local EventBus = {}
local __EVENTS: { [string]: Event } = {}
local __DEBOUNCE = {}

function EventBus:Create(name: string, signal: RBXScriptSignal): Event
    __EVENTS[name] = { name, signal, calls = {} }
    __DEBOUNCE[name] = {}
    signal:Connect(function() self:Call(name) end)
    return __EVENTS[name]
end

function EventBus:Register(event: Event | string, priority: number, debounce: number, call: () -> any)
    if __EVENTS[event.name or event].calls[priority] then
        print(("Priority position %d on Event '%s' is already registed."):format(event.name, priority))
    else
        __EVENTS[event.name or event].calls[priority] = { debounce = debounce, call = call }
        __DEBOUNCE[event.name or event][priority] = false
    end
end

function EventBus:Call(event: Event | string)
    for i,f in pairs(__EVENTS[event.name or event].calls) do
        if f.debounce <= 0 then
            xpcall(f.call, print)
            continue
        end

        if not __DEBOUNCE[event.name or event][i] then
            xpcall(f.call, print)
            __DEBOUNCE[event.name or event][i] = true
            task.delay(f.debounce, function()
                __DEBOUNCE[event.name or event][i] = false
            end)
        end
    end
end

type Event = {
    signal: RBXScriptSignal,
    calls: { [number]: Function }
}

type Function = {
    debounce: number,
    call: () -> any
}

return EventBus
