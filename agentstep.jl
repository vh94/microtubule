# Periodic agent step function
 # TODO: bounce check für agenten in eigene funktion aussiedeln
include("Polimerize.jl")
# Periodic agent step function
function agent_step!(agent,model)
    if agent.id > model.Nstarts
        if agent.polym == 0   # Logic for unpolymerized agents:    
                walk!(agent, rand, model, ifempty =true)
                polimerize(agent,model) 
            end
        if agent.polym > 0 # Logic for polymerized agents:    
            if agent.GDP == false   # if not hydrolized
                agent.GDP = rand(model.P_hyd,1)[1] # hydrolize with P_hyd
                end
               depolymerize(agent,model)
            end
         end
end