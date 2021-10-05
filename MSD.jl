# MSD function
function MSD(data)   
    n_ids= maximum(data.id)
    n_steps=maximum(data.step)+1
    r=1:n_ids:n_steps*n_ids+n_ids
    poses=hcat(collect.(data.pos)...)
    x_0=poses[1,unique(data.id)]
    y_0=poses[2,unique(data.id)]
    MSD = zeros(n_steps) #array länge data.step init zeros()
        for i in 1:n_steps
            MSD[i]=mean(sqrt.((poses[1,r[i]:r[i+1]-1].-x_0).^2 + (poses[2,r[i]:r[i+1]-1].-y_0).^2))
        end
    return MSD
end