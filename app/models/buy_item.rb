class BuyItem < ApplicationRecord
  #has_many :category

  MIN_PRICE = 2000.freeze
  MAX_PRICE = 100000.freeze
  validates :price, numericality: {only_interger: true, greater_than_or_equal_to:MIN_PRICE, less_than_or_equal_to: MAX_PRICE}

  #一覧表示
  scope :by_month_buy,-> (month) {
    where(created_at: month)
  }

  #購入可能かどうかを判定
  scope :buy_approval, -> (category) {
    where(
      category_id: category,
      created_at: Time.current.all_month
    )  
  }

  #チャート表示用にデータ取得
  scope :chart_scope, -> {
    select("to_char(created_at, 'yyyy-mm') as buy_month, sum(price) as month_price")
    .order("buy_month")
    .group("buy_month")
  }
end
