class Status < EnumerateIt::Base
  associate_values(
    inactive: [0, 'Inactive'],
    active:   [1, 'Active']
  )
end
