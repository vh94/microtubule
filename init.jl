#= Main Function to initialize the model=#
function initialize(;Nstarts, numagents, periodic, griddims, p_hyd,  p_polym,
                        p_depolym_GTP,p_depolym_GDP)
   
    P_hyd = Binomial(1,p_hyd)                      # Prob to hydrolize from GTP to GDP:  GTPase rate
    P_polym = Binomial(1,p_polym)                  # Prob to Polymerize/bind to the microtuble 
    P_depolym_GTP = Binomial(1,1-p_depolym_GTP)    # Prob to depolimerize if not hydrolized (GTP - tubulin) = lower
    P_depolym_GDP = Binomial(1,1-p_depolym_GDP)    # Prob to depolimerize if hydrolized (GDP - tubulin) = higher

    
 properties = @dict griddims numagents Nstarts p_depolym_GTP p_depolym_GDP p_polym p_hyd P_hyd P_polym P_depolym_GTP P_depolym_GDP
 
    properties[:tick] = 0

    space = GridSpace(griddims, periodic = periodic ) # initialize Gridspace
    
    model = ABM(tubulin, space;                     # create model using ?Agents.ABM
        scheduler = Schedulers.randomly,
        properties = properties )
    
    id = 0  #  populizing Grid Space with Agents  
    for _ in 1:Nstarts # Startingpoints:
        id += 1
        agent =  tubulin(id,griddims./2,id,true)
        if id == 1
            add_agent_pos!(agent,model)
        else
            add_agent_single!(agent,model) # add additional startingpoints to random positions 
        end
    end
    for _ in 1:numagents 
        id += 1
        agent =  tubulin(id,(1,1),0,false)
        add_agent_single!(agent,model) # add agents to random positions
    end
    return model
end