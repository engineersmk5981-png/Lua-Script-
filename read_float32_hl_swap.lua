--[[
    32-bit Floating Point Data Read
    --------------------------------
    Platform : Wecon HMI
    Data Type: 32-bit Floating Point
    Format   : High-Low Word (Swap)

    Description:
    Read 32-bit floating-point data from HAW1000
    using the Wecon HMI built-in function `we_bas_getdatas()`.

    The received value is then written to HAW1002
    as a Floating Point value.
--]]

-- Read 32-bit Floating Point data
-- Address : @W_0#HAW1000
-- Length  : 1 data item
-- Format : 32-bit Float, High-Low Word (Swap)
local data_table = we_bas_getdatas("@W_0#HAW1000", 1, 4, 0, 1)

if data_table then

    -- Get the first value from the returned data table
    local Data1 = data_table[1]

    -- Write the value as Floating Point
    we_bas_setfloat("@W_0#HAW1002", Data1)

    -- Display the value in the console
    print(Data1)

else

    -- Read operation failed
    print("Read failed")

end
