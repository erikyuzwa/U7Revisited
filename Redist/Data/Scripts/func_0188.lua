--- Best guess: Manages another door interaction, similar to func_0178, toggling its state and updating position/frame with different parameters.
function func_0188(eventid, objectref)
    local var_0000

    if eventid ~= 1 then
        return
    end
    var_0000 = unknown_081BH(eventid, objectref)
    if var_0000 == 1 then
        if unknown_081DH(7, 0, 0, 0, 225, objectref) then
            unknown_081EH(1, 0, 3, 0, 246, 2, 1, 250, objectref)
            set_object_quality(objectref, 31)
        else
            unknown_0818H()
        end
    elseif var_0000 == 0 then
        if unknown_081DH(7, 0, 0, 1, 225, objectref) then
            unknown_081EH(7, -3, 0, 1, 246, 1, 0, 250, objectref)
            set_object_quality(objectref, 30)
        else
            unknown_0818H()
        end
    elseif var_0000 == 2 then
        unknown_0819H(objectref)
    elseif var_0000 == 3 then
        unknown_081AH(objectref)
    end
end