-- Function 04FF: Myrtle's dialogue in Bee Cave
function func_04FF(eventid, itemref)
    -- Local variables (5 as per .localc)
    local local0, local1, local2, local3, local4

    if eventid == 0 then
        return
    elseif eventid ~= 1 then
        return
    end

    switch_talk_to(255, 0)
    local0 = call_08F7H(-241) -- Murray
    local1 = call_08F7H(-2)   -- Spark
    local2 = call_08F7H(-1)   -- Iolo
    local3 = call_08F7H(-4)   -- Shamino
    local4 = false

    add_answer({"bye", "job", "name"})

    if not get_flag(0x02C0) then
        add_dialogue("You see a lovely naked woman. She is not in the least concerned that she is wearing no clothes.*")
        if local1 and local2 then
            switch_talk_to(2, 0)
            add_dialogue("Spark's eyes widen and his jaw drops.*")
            _HideNPC(-2)
            switch_talk_to(1, 0)
            add_dialogue("\"Close thy mouth, boy. An insect may fly in. And put thine eyes back in thine head. They shall look strange dangling out of their sockets.\"*")
            _HideNPC(-1)
            switch_talk_to(255, 0)
        end
        add_dialogue("\"Me Mama!\" the woman exclaims proudly.")
        if not get_flag(0x02D4) and local0 then
            switch_talk_to(241, 0)
            add_dialogue("\"Forget it, Myrtle. The jig is up. They know all about us.\"*")
            switch_talk_to(255, 0)
            add_dialogue("\"Murray! Didst thou give us away? How couldst thou do it? This just isn't going to be much fun anymore knowing that someone is aware of the truth!\"*")
            switch_talk_to(241, 0)
            add_dialogue("\"Sorry, dear.\"*")
            _HideNPC(-241)
            switch_talk_to(255, 0)
            local4 = true
        elseif local0 then
            add_dialogue("You tell the woman what Papa said about their past lives.~~\"Well, blast it! Why did he tell our secret? I will never forgive him! What a knave!\"")
            local4 = true
        end
        set_flag(0x02C0, true)
    else
        add_dialogue("\"Hmm?\" asks Mama.")
        if not get_flag(0x02D4) then
            local4 = true
        end
    end

    while true do
        local answer = wait_for_answer()

        if answer == "name" then
            if not local4 then
                add_dialogue("\"Me Mama!\" the woman exclaims again.")
            else
                add_dialogue("\"All right. My name is Myrtle. But I like to be called Mama.\"")
            end
            remove_answer("name")
        elseif answer == "job" then
            if not local4 then
                add_dialogue("\"Me live with Papa here in cave!\"")
            else
                add_dialogue("\"Well, I would not call it a job, but I just live here in Bee Cave with Papa.\"")
            end
            add_answer({"cave", "Papa", "live"})
        elseif answer == "live" then
            if not local4 then
                add_dialogue("Mama explains. \"Eat. Sleep. Love.\"*")
                if local3 then
                    switch_talk_to(4, 0)
                    add_dialogue("\"What else is there?\"*")
                    _HideNPC(-4)
                    switch_talk_to(255, 0)
                end
            else
                add_dialogue("\"We do our best to eat, sleep, and love each other down here isolated from the rest of society.\"")
            end
            remove_answer("live")
        elseif answer == "Papa" then
            if not local4 then
                add_dialogue("\"Mmmmmmm. Papa! Mama love Papa!\"")
            else
                add_dialogue("\"He's mostly a lazy beggar, but I still love him.\"")
            end
            remove_answer("Papa")
        elseif answer == "cave" then
            if not local4 then
                add_dialogue("\"Cave good. Warm. Safe.\"")
            else
                add_dialogue("\"It's been good to us. It keeps us warm. We are able to find food. I do not miss the old life.\"")
            end
            remove_answer("cave")
        elseif answer == "bye" then
            add_dialogue("\"'Bye!\"*")
            return
        end
    end

    return
end

-- Helper functions
function add_dialogue(...)
    print(table.concat({...}))
end

function wait_for_answer()
    return "bye" -- Placeholder
end

function get_flag(flag)
    return false -- Placeholder
end

function set_flag(flag, value)
    -- Placeholder
end