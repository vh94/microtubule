
#= Main Function to initialize the model=#

using Agents
using Distributions

include("agent.jl")
include("agentstep.jl")
include("modelstep.jl")
function initialize(;Nstarts, numagents, periodic,
                        griddims, p_hyd,  p_polym,
                        p_depolym_GTP,p_depolym_GDP)
   
    P_hyd = Binomial(1,p_hyd)                      # Prob to hydrolize from GTP to GDP: 
    P_polym = Binomial(1,p_polym)                  # Prob to Polymerize/bind to the microtuble 
    P_depolym_GTP = Binomial(1,1-p_depolym_GTP)    # Prob to depolimerize if not hydrolized (GTP - tubulin) = lower
    P_depolym_GDP = Binomial(1,1-p_depolym_GDP)    # Prob to depolimerize if hydrolized (GDP - tubulin) = higher
    
    properties = Dict(:griddims=> griddims, :periodic=>periodic, :numagents => numagents,  # Dictionary containing 
                    :Nstarts => Nstarts, :p_hyd => p_hyd,:p_polym => p_polym,              # model properties
                    :p_depolym_GTP => p_depolym_GTP,:p_depolym_GDP => p_depolym_GDP,
                    :P_hyd => P_hyd,:P_polym=> P_polym, :P_depolym_GTP=>  P_depolym_GTP,
                    :P_depolym_GDP=> P_depolym_GDP)
    
    space = GridSpace(griddims, periodic= periodic) # initialize Gridspace
    
    model = ABM(tubulin, space;                     # create model
        scheduler = Schedulers.randomly,
        properties = properties )
    
    id = 0# populize Space ->
    for _ in 1:Nstarts # Startingpoints:
        id += 1
        agent =  tubulin(id,(50,50),true,true)
        if id == 1
            add_agent_pos!(agent,model)
        else
            add_agent_single!(agent,model) # add additional startingpoints to random positions 
        end
    end
    for _ in 1:numagents 
        id += 1
        agent =  tubulin(id,(1,1),false,false)
        add_agent_single!(agent,model) # add agents to random positions
    end
    return model
end
