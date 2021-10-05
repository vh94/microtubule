#=  Agent class representing 1 tubulin dimer
    those can polymerize and also hydrolize from GTP to GDP
maybe get a plus end direction in near future =#

@agent tubulin GridAgent{2} begin
    polym::Bool
    GDP::Bool
    # Plus::Int64
end