--- Best guess: Animates an object with a sequence of frames, likely for a decorative or interactive effect.
function func_03F5(eventid, objectref)
    local var_0000, var_0001

    if not unknown_0079H(objectref) and eventid == 1 then
        var_0000 = {0, 8006, 3, 8006, 4, 8006, 17, 8024, 4, 8006, 3, 8006, 0, 8006, 1, 8006, 2, 8006, 17, 8024, 2, 8006, 1, 8006, 0, 7750}
        -- calli 005C, 1 (unmapped)
        unknown_005CH(objectref)
        var_0001 = unknown_0001H(var_0000, objectref)
    end
    return
end