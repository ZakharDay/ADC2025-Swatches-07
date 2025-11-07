json.extract! swatch, :id, :name
json.url api_v1_swatch_url(swatch, format: :json)

json.set! :fills do
  json.array! swatch.fills, partial: "api/v1/swatches/fill", as: :fill
end