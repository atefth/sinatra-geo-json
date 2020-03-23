require './models/point'

post '/push' do
  point = Point.create(json: {type: params[:type], coordinates: params[:coordinates].values})
  if !point.errors.empty?
    return point.errors.messages
  else
    return point.to_json
  end
end

get '/radius' do
  points = Point.within_radius(params[:coordinates].values, params[:radius])
  return points.as_json.to_json
end

get '/polygon' do
  points = Point.within_polygon(params[:coordinates]["0"].values)
  return points.as_json.to_json
end
