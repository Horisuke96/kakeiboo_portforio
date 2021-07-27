class Users::IncomesController < ApplicationController

  def new
    @income = Income.new
    @income_types = IncomeType.all
  end

  def create
    @income = Income.new(params_income)
    @income.user_id = current_user.id
    if @income.save
      redirect_to income_path(@income)
    else
      render :new
    end
  end

  def show
    @income = Income.find(params[:id])
  end

  def daily
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    # 取得した時刻が含まれる月の範囲のデータを取得
    @incomes = Income.where(date: @month.all_month)




  end

  def monthly
  end

  def edit
    @income = Income.find(params[:id])
    if @income.user == current_user
      render "edit"
    else
      redirect_to income_path(@income)
    end
  end

  def update
    @income = Income.find(params[:id])
    if @income.update(params_income)
      flash[:success] = "支出を変更しました"
      redirect_to income_path(@income)
    else
      render :edit
    end
  end

  def destroy
    @income = Income.find(params[:id])
    if @income.destroy
      flash[:alert] = "支出を削除しました"
      redirect_to daily_incomes_path
    else
      @income = Income.all
      render :index
    end
  end


  private
  def params_income
    params.require(:income).permit(:date, :amount, :note, :image, :user_id, :income_type_id)
  end
end
