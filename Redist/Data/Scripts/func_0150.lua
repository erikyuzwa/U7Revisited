--- Best guess: Manages an unlit candle, changing its type to 338 (lit candle) when used or examined.
function func_0150(eventid, objectref)
    if eventid == 1 or eventid == 2 then
        unknown_0942H(338, objectref)
    end
end