# model-Step func:
include("agent_group_cont.jl")

function model_step!(model)
    model.MTmL = mean_agent_gs(model)
    model.MTstdL= std_gs(model)
    model.tick += 1
    model.P_hyd = Binomial(1,model.p_hyd)                      # Prob to hydrolize from GTP to GDP: 
    model.P_polym = Binomial(1,model.p_polym)                  # Prob to Polymerize/bind to the microtuble 
    model.P_depolym_GTP = Binomial(1,1-model.p_depolym_GTP)    # Prob to depolimerize if not hydrolized (GTP - tubulin) = lower
    model.P_depolym_GDP = Binomial(1,1-model.p_depolym_GDP)    # Prob to depolimerize if hydrolized (GDP - tubulin) = higher
end