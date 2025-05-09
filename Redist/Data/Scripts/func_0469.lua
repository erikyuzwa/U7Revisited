-- func_0469.lua
-- Zella's dialogue as an herbalist in Britain


function func_0469(eventid)
    local answers = {}
    local flag_00D9 = get_flag(0x00D9) -- First meeting
    local flag_0094 = get_flag(0x0094) -- Fellowship topic
    local flag_00E8 = get_flag(0x00E8) -- Herbs topic
    local npc_id = -88 -- Zella's NPC ID

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
        if flag_00E8 then
            add_answer( "herbs")
        end
        if flag_0094 then
            add_answer( "Fellowship")
        end

        if not flag_00D9 then
            add_dialogue("You see a knowledgeable woman sorting herbs, her shop fragrant with dried plants.")
            set_flag(0x00D9, true)
        else
            add_dialogue("\"Ho, \" .. get_player_name() .. \",\" Zella says, crushing leaves.")
        end

        while true do
            if #answers == 0 then
                add_dialogue("Zella brushes her hands. \"Need herbs or a bit of talk?\"")
                add_answer( "bye")
                add_answer( "job")
                add_answer( "name")
            end

            local choice = get_answer(answers)
            if choice == "name" then
                add_dialogue("\"Zella, herbalist of Britain, dealin' in nature's remedies.\"")
                remove_answer("name")
            elseif choice == "job" then
                add_dialogue("\"I sell herbs for healin' and cookin'. The Fellowship's trade deals bring supplies, but their grip on Patterson's a touch concernin'.\"")
                add_answer( "herbs")
                add_answer( "Fellowship")
                set_flag(0x00E8, true)
            elseif choice == "herbs" then
                add_dialogue("\"Got ginseng, mandrake, and more, but prices are steep. Folk like Weston can't afford 'em, and that's stirrin' trouble.\"")
                add_answer( "Weston")
                add_answer( "prices")
                remove_answer("herbs")
            elseif choice == "prices" then
                add_dialogue("\"Fellowship fees and taxes drive up my costs. It's hardest on Paws folk, pushin' 'em to acts like Weston's.\"")
                add_answer( "Paws")
                add_answer( "Fellowship")
                remove_answer("prices")
            elseif choice == "Paws" then
                add_dialogue("\"Paws is a poor village south of Britain. Weston's from there—starvin' folk, and the Fellowship's promises don't reach 'em.\"")
                add_answer( "Weston")
                remove_answer("Paws")
            elseif choice == "Weston" then
                add_dialogue("\"Weston stole apples to feed his kin—sad tale. Figg's arrest, backed by the Fellowship, was harsh, no kindness shown.\"")
                add_answer( "Figg")
                remove_answer("Weston")
            elseif choice == "Figg" then
                add_dialogue("\"Figg's a Fellowship man, pushin' their order. His role in Weston's arrest shows they care more for control than folk.\"")
                remove_answer("Figg")
            elseif choice == "Fellowship" then
                add_dialogue("\"The Fellowship's deals keep my herb stock full, but their ties to Patterson and Figg make me wonder what they're really after.\"")
                local response = call_extern(0x0919, var_0002)
                if response == 0 then
                    add_dialogue("\"Thou trustest 'em? They help trade, but I'm watchin' close.\"")
                    call_extern(0x091A, var_0003)
                else
                    add_dialogue("\"Good to doubt 'em. Their influence feels heavier than their words.\"")
                end
                remove_answer("Fellowship")
            elseif choice == "bye" then
                add_dialogue("\"Stay healthy, \" .. get_player_name() .. \".\"")
                break
            end
        end
    elseif eventid == 0 then
        call_extern(0x092E, npc_id)
    end
end

return func_0469