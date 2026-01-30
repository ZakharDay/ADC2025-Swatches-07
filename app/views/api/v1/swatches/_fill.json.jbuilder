json.extract! fill, :id, :name

json.set! :fill_colors do
  json.array! fill.fill_colors, partial: "api/v1/swatches/fill_color", as: :fill_color
end