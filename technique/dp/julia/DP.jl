Base.@kwdef struct DP
    matrix
end

function Base.getindex(dp::DP, i::Int, j::Int)
    dp.matrix[i+1, j+1]
end

function Base.setindex!(dp::DP, X, i::Int, j::Int)
    dp.matrix[i+1, j+1] = X
end

function DP(N, M)
    return DP(matrix=zeros(Int, N, M))
end
