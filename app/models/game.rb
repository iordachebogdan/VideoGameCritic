class Game < Product
  belongs_to :category, optional: true

  scope :category_ids, -> (category_id){ where category_id: category_id }
end
