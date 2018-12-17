class Game < Product
  belongs_to :category, optional: true
end
