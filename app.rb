require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/new") do
  erb(:home)
end

get("/square/results") do
  @number = params.fetch("number")
  @square = (@number.to_f ** 2).to_f
  erb(:squareResults)
end

get("/square_root/new") do
  erb(:root)
end

get("/square_root/results") do
  @number = params.fetch("user_number")
  @root = (@number.to_f ** 0.5).to_f
  erb(:rootResults)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @aprVal = params.fetch("user_apr")
  @apr = @aprVal.to_i.to_fs(:percentage, {:precision => 4})
  @numYrs = params.fetch("user_years")
  @princVal = params.fetch("user_pv")
  @principal = @princVal.to_i.to_fs(:currency)

  r = @aprVal.to_f / 1200
  pv = @princVal.to_f
  n = @numYrs.to_i * 12
  
  num = r*pv
  denom = (1-((1+r) ** (-n)))
  pay = num / denom

  @payment = pay.to_fs(:currency)
  erb(:paymentResults)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_min")
  @max = params.fetch("user_max")
  @random = rand(@min.to_f .. @max.to_f)
  erb(:randomResults)
end
