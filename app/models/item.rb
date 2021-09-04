class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :region
  belongs_to :days_to_ship

  validates :image, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}




end

