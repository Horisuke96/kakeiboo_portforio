class Users::ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @expense_types = ExpenseType.all
  end

  def create
    @expense = Expense.new(params_expense)
    @expense.user_id = current_user.id
    if @expense.save
      redirect_to expense_path(@expense)
    else
      render :new
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def daily
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    # 取得した時刻が含まれる月の範囲のデータを取得
    @expenses = Expense.where(date: @month.all_month)
  end

  def monthly
  end

  def edit
    @expense = Expense.find(params[:id])
    if @expense.user == current_user
      render "edit"
    else
      redirect_to expense_path(@expense)
    end
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(params_expense)
      flash[:success] = "支出を変更しました"
      redirect_to expense_path(@expense)
    else
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    if @expense.destroy
      flash[:alert] = "支出を削除しました"
      redirect_to expense_path
    else
      @expense = Expense.all
      render :index
    end
  end


  private
  def params_expense
    params.require(:expense).permit(:date, :amount, :note, :image, :user_id, :expense_type_id)
  end
end
