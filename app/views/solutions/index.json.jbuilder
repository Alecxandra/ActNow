json.array!(@solutions) do |solution|
  json.extract! solution, :id, :option
  json.url solution_url(solution, format: :json)
end
