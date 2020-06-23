class BuyItemsController < ApplicationController

  def index
    #今月/前月/前々月のデータ取得
    month_hash = {
      this_month: Time.current.all_month, 
      one_month_ago: 1.months.ago.all_month, 
      two_month_ago: 2.months.ago.all_month
    }

    @buy_items_hash = {}
    month_hash.each do |key, value|
      @buy_items_hash[key] = BuyItem.by_month_buy(value)
    end
  end

  def new
    @buy_item = BuyItem.new
  end

  def create
      if BuyItem.buy_approval(params[:buy_item][:category_id]).blank?
          buy_item = params.require(:buy_item).permit(:category_id, :name, :price)
          BuyItem.create(buy_item)
      else
          flash[:error] = "該当カテゴリは、今月既に購入済みです。"
      end
      redirect_to buy_items_path
  end

  #ログ表示画面
  def log_view
    # @buy_items = BuyItem.all
    @q = BuyItem.ransack(params[:q])
    @buy_items = @q.result(distinct: true)
  end

  #チャート表示画面
  def chart_view
    @chart_data = BuyItem.chart_scope.map {|item| [item.buy_month, item.month_price]}
  end

end
