--- Best guess: Prompts the user to select a party member or “Nobody”, returning the selected member’s ID or 0.
function func_090E()
    local var_0000, var_0001, var_0002, var_0003, var_0004

    var_0000 = get_player_name(unknown_008DH())
    var_0001 = unknown_008DH()
    var_0002 = {0, 0}
    var_0003 = _SelectIndex({var_0000, "Nobody"})
    var_0004 = var_0002[var_0003]
    if var_0004 == 0 then
        return 0
    end
    return _003AH(var_0004)
end