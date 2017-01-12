json.draw params["draw"].to_i
json.recordsTotal @response.count
json.recordsFiltered @response.count
json.data @data