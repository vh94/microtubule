#= fast Agent Step function =#

function polymerize(agent,model)
for id in nearby_ids(agent, model,1) # 
                if  model[id].polym >= 1  
                   if model[id].pos== agent.pos.+ 1  || model[id].pos  == (1,1) && agent.pos == model.griddims || model[id].pos == (1,agent.pos[2]+1) && agent.pos[1] == model.griddims[1]|| model[id].pos == (agent.pos[1]+1,1) && agent.pos[2] == model.griddims[1]
                        agent.polym = rand(model.P_polym,1)[1] ==1 ? model[id].polym : 0 # polimerize and get MT number
                    end
                end
             end
end


function depolymerize(agent,model)
      
 if (1 in agent.pos) == false && isempty(agent.pos.-1, model) || agent.pos[1]==1 && agent.pos[2]>1 && isempty(tuple(model.griddims[1],agent.pos[2]-1),model)  || agent.pos[1]>1 && agent.pos[2]==1 && isempty(tuple(agent.pos[1]-1,model.griddims[2]),model) || agent.pos==(1,1) && isempty(model.griddims,model) || agent.pos[1] == model.griddims[1] && agent.pos[2]>1 && isempty(tuple(1, agent.pos[2]-1),model)|| agent.pos[1]>1 && agent.pos[2] == model.griddims[2] && isempty(tuple(agent.pos[1]-1,1 ),model)   
                if agent.GDP  # if hydrolized
                    agent.polym = rand(model.P_depolym_GDP,1)[1]== 1  ? agent.polym : 0 # rand is called here so all good 
                else
                    agent.polym = rand(model.P_depolym_GTP,1)[1]== 1  ? agent.polym : 0 ##
                end
            end 
end


function agent_step!(agent,model)
if agent.id > model.Nstarts
    if agent.polym == 0   # Logic for unpolymerized agents:    
            walk!(agent, rand, model, ifempty =true)
            polymerize(agent,model) 
        end
    if agent.polym > 0 # Logic for polymerized agents:    
        if agent.GDP == false   # if not hydrolized
            agent.GDP = rand(model.P_hyd,1)[1] # hydrolize with P_hyd
            end
            depolymerize(agent,model)
        end
     end
end