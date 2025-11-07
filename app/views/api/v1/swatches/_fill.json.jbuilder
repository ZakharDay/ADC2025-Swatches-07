json.extract! fill, :name

json.set! :colors do
  json.array! fill.colors, partial: "api/v1/swatches/color", as: :color
end