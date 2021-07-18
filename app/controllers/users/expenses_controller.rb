class Users::ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @expense_types = ExpenseType.all
  end

  def create
    @expense = Expense.new(params_expense)
    @expense.user_id = current_user.id
    if @expense.save
      redirect_to expenses_path(@expense)
    else
      render :new
    end
  end

  def show
    @expense = Expense.find(params_expense)
  end

  def daily
  end

  def monthly
  end

  def edit
    @expense = Expense.find(params[:id])
    if @expense.user == current_user
      redirect_to expenses_path(@expense)
    else
      render "edit"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params_expense)
      flash[:success] = "支出を変更しました"
      redirect_to expenses_path
    else
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    if @expense.destroy
      flash[:alert] = "支出を削除しました"
      redirect_to expenses_path
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
