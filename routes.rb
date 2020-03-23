require './models/post'

post '/push' do
  point = Point.create(json: {type: params[:type], coordinates: params[:coordinates].values})
  if !point.errors.empty?
    return point.errors.messages
  else
    return point.to_json
  end
end
