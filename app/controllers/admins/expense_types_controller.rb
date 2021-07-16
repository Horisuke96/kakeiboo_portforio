class Admins::ExpenseTypesController < ApplicationController
  def index
    @expense_type = ExpenseType.new
    @expense_types = ExpenseType.all
  end

  def create
    @expense_type = ExpenseType.new(params_expense_type)
    if @expense_type.save
      flash[:notice] = "支出カテゴリを追加しました"
      redirect_to admins_expense_types_path
    else
      render :index
    end
  end

  def edit
    @expense_type = ExpenseType.find(params[:id])
  end

  def update
    @expense_type = ExpenseType.find(params[:id])
    if @expense_type.update(params_expense_type)
      flash[:success] = "支出カテゴリを変更しました"
      redirect_to admins_expense_types_path
    else
      render :edit
    end
  end

  def destroy
    @expense_type = ExpenseType.find(params[:id])
    if @expense_type.destroy
      flash[:alert] = "支出カテゴリを削除しました"
      redirect_to admins_expense_types_path
    else
      @expense_types = ExpenseType.all
      render :index
    end
  end

  private

  def params_expense_type
    params.require(:expense_type).permit(:type_name)
  end
end
