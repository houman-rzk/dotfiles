local timeout
level = mp.get_property("osd-level")

function show_osc()
    wait = 5 
    small_wait = 0.1

    mp.set_property_number("osd-level", 0)

    if timeout == nil then
    --if require 'mp.utils'.shared_script_property_get('osc-visibility') ~= "always" then
        timeout = mp.add_timeout(
            small_wait,
            function()
                mp.command("script-message osc-visibility always")
                mp.add_timeout(
                    wait,
                    function()
                        mp.command("script-message osc-visibility auto")
                        mp.add_timeout(
                            small_wait,
                            function()
                                mp.set_property_number("osd-level", level)
                                timeout = nil
                            end
                        )
                    end
                )
            end
        )
    else
        timeout:kill()
        timeout = nil
        mp.add_timeout(
            small_wait,
            function()
                mp.command("script-message osc-visibility auto")
            end
        )
        mp.add_timeout(
            small_wait * 2,
            function()
                mp.set_property_number("osd-level", level)
            end
        )
    end
end

mp.add_key_binding("o", "show_osc", show_osc)
