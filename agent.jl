#= The agent type representing 1 tubulin dimer
     @agent is a macro from the Agents.jl package that creates a struct with default keys
    :polym is a Int indicating which Microtubule the dimerpolymer is associated (0 = unpolymerized)
    :GDP::bool true = hydrolized (GDP -tubulin ) , false = GTP ("Cap") 
=#

@agent tubulin GridAgent{2} begin
    polym::Int64
    GDP::Bool
    # Plus::Int64
end