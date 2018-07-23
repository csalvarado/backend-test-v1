class Operation < ApplicationRecord
  validates :numero1, presence: true
  validates :operador, presence: true
  validates :numero2, presence: true
  #validates :resultado, presence: true
end
