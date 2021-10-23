# ABM microtubule dynamics

This repository contains Julia skripts to model and analyze the dynamical instabilty of Microtubules.
The model is an ABM with a two dimensional periodic gridspace .


### Agents 
 
The agents, representing \alpha + \beta -tubulindimers, are implemented by a
mutable struct tubulin <: AbstractAgent
containing the Fields:

    - id::Int64
    - pos::Tuple{Int64, Int64}
    - polym::Int64
    - GDP::Bool

Supertype Hierarchy:
      
      tubulin <: AbstractAgent <: Any
    
see file agent.jl

### Model


struct AgentBasedModel{GridSpace{2, true, Nothing}, tubulin, typeof(Agents.Schedulers.randomly), Dict{Symbol, Any}, Random.MersenneTwister} <: Any

Fields

	- agents::Dict{Int64, tubulin}
	- space::GridSpace{2, true, Nothing}
	- scheduler::typeof(Agents.Schedulers.randomly)
	- properties::Dict{Symbol, Any}
	- rng::Random.MersenneTwister
	- maxid::Base.RefValue{Int64}

### Model Properties :

    - Gridsize::Tuple{Int,2}
    - Number of agents::tubulin
    - Number of Seeding Points
    - Polimerization rate
    - Hydrolisation rate
    - Depolymerisation rate_GTP
    - Depolymerisation rate_GDP
    
    
### Stepping rules


Stepping rules for the model are created by running 'modelstep.jl' 


Stepping rules for the agents are created by either running 'agentstep_pretty.jl' or agentstep_fast.jl
