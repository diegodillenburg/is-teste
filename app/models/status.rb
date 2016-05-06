class Status < EnumerateIt::Base
  associate_values(
    active:   [0, 'Active'],
    inactive: [1, 'Inactive']
  )
end
