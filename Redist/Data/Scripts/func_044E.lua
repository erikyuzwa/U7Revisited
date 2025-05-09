-- func_044E.lua
-- Chuckles's dialogue as the court jester in Castle British


function func_044E(eventid)
    local answers = {}
    local flag_00C4 = get_flag(0x00C4) -- First meeting
    local flag_0094 = get_flag(0x0094) -- Fellowship topic
    local flag_00D3 = get_flag(0x00D3) -- Jests topic
    local npc_id = -67 -- Chuckles's NPC ID

    if eventid == 1 then
        switch_talk_to(npc_id, 0)
        local var_0000 = call_extern(0x0909, 0) -- Unknown interaction
        local var_0001 = call_extern(0x090A, 1) -- Item interaction
        local var_0002 = call_extern(0x0919, 2) -- Fellowship interaction
        local var_0003 = call_extern(0x091A, 3) -- Philosophy interaction
        local var_0004 = call_extern(0x092E, 4) -- Unknown interaction

        add_answer( "bye")
        add_answer( "job")
        add_answer( "name")
        if flag_00D3 then
            add_answer( "jests")
        end
        if flag_0094 then
            add_answer( "Fellowship")
        end

        if not flag_00C4 then
            add_dialogue("You see a wiry man in motley, juggling apples with a mischievous grin.")
            set_flag(0x00C4, true)
        else
            add_dialogue("\"Ho, \" .. get_player_name() .. \"!\" Chuckles cackles, tossing an apple.")
        end

        while true do
            if #answers == 0 then
                add_dialogue("Chuckles spins a coin. \"What’s thy jest, friend?\"")
                add_answer( "bye")
                add_answer( "job")
                add_answer( "name")
            end

            local choice = get_answer(answers)
            if choice == "name" then
                add_dialogue("\"Chuckles I be, jester to Lord British’s court!\"")
                remove_answer("name")
            elseif choice == "job" then
                add_dialogue("\"I juggle, jest, and jape to keep the castle merry! My quips lighten hearts, but I hear whispers darker than my riddles.\"")
                add_answer( "jests")
                add_answer( "whispers")
                set_flag(0x00D3, true)
            elseif choice == "jests" then
                add_dialogue("\"Here’s a riddle: what group speaks of unity but hides in shadows? Answer’s the Fellowship, methinks! Want another?\"")
                add_answer( "Fellowship")
                add_answer( "riddle")
                remove_answer("jests")
            elseif choice == "riddle" then
                add_dialogue("\"What’s green as emerald, yet rules no land? Lord British’s crown, for his heart serves Britannia! Ha! Like that one?\"")
                remove_answer("riddle")
            elseif choice == "whispers" then
                add_dialogue("\"Servants talk of Fellowship folk skulking in the halls, meeting advisors after dark. Even my jests can’t lighten that gloom.\"")
                add_answer( "Fellowship")
                set_flag(0x0094, true)
                remove_answer("whispers")
            elseif choice == "Fellowship" then
                add_dialogue("\"The Fellowship’s all smiles and promises, but their eyes dart like thieves in a market. I’d jest about ‘em, but my jokes might cut too deep.\"")
                local response = call_extern(0x0919, var_0002)
                if response == 0 then
                    add_dialogue("\"Thou likest their tune? I’ll keep my japes gentle, then.\"")
                    call_extern(0x091A, var_0003)
                else
                    add_dialogue("\"Wise to doubt ‘em! Their game’s no laughing matter.\"")
                end
                remove_answer("Fellowship")
            elseif choice == "bye" then
                add_dialogue("\"Keep a skip in thy step, \" .. get_player_name() .. \"!\"")
                break
            end
        end
    elseif eventid == 0 then
        call_extern(0x092E, npc_id)
    end
end

return func_044E