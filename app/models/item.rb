class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, presence: true
  validates :category_id, numericality: { other_than: 1 }

  belongs_to :condition
  validates :condition_id, presence: true
  validates :condition_id, numericality: { other_than: 1 }

  belongs_to :burden
  validates :burden_id, presence: true
  validates :burden_id, numericality: { other_than: 1 }

  belongs_to :region
  validates :region_id, presence: true
  validates :region_id, numericality: { other_than: 1 }

  belongs_to :shippment_days
  validates :shippment_days_id, presence: true
  validates :shippment_days_id, numericality: { other_than: 1 }

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true

  validates :price, presence: true,format: { with: /\A[0-9]+\z/, message: "Half-width number" },numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }


  

  has_one_attached :image
  belongs_to :user

  private

  def item_params
    params.require(:item).permit（:image）.merge(user_id: current_user.id)
  end
end
