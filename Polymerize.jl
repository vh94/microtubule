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
            
 if (1 in agent.pos) == false && isempty(agent.pos.-1, model) || agent.pos[1]==1 && agent.pos[2]>1 && isempty(tuple(model.griddims[1],agent.pos[2]-1),model)  || agent.pos[1]>1 && agent.pos[2]==1 && isempty(tuple(agent.pos[1]-1,model.griddims[2]),model) || agent.pos==(1,1) && isempty(model.griddims,model) || agent.pos[1] == model.griddims[1] && agent.pos[2]>1 && isempty(tuple(1, agent.pos[2]-1),model)||agent.pos[1]>1 && agent.pos[2] == model.griddims[2] && isempty(tuple(agent.pos[2]-1,1 ),model)   
                if agent.GDP  # if hydrolized
                    agent.polym = rand(model.P_depolym_GDP,1)[1]== 1  ? agent.polym : 0 # depolyimerize P_depolym_GDP!!!!
                else
                    agent.polym = rand(model.P_depolym_GTP,1)[1]== 1  ? agent.polym : 0 ##
                end
            end 
end