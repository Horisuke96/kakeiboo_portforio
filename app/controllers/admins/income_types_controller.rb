class Admins::IncomeTypesController < ApplicationController
  def index
    @income_type = IncomeType.new
    @income_types = IncomeType.all
  end

  def create
    @income_type = IncomeType.new(params_income_type)
    if @income_type.save
      flash[:notice] = "支出カテゴリを追加しました"
      redirect_to admins_income_types_path
    else
      render :index
    end
  end

  def edit
    @income_type = IncomeType.find(params[:id])
  end

  def update
    @income_type = IncomeType.find(params[:id])
    if @income_type.update(params_income_type)
      flash[:success] = "支出カテゴリを変更しました"
      redirect_to admins_income_types_path
    else
      render :edit
    end
  end

  def destroy
    @income_type = IncomeType.find(params[:id])
    if @income_type.destroy
      flash[:alert] = "支出カテゴリを削除しました"
      redirect_to admins_income_types_path
    else
      @income_types = IncomeType.all
      render :index
    end
  end

  private

  def params_income_type
    params.require(:income_type).permit(:type_name)
  end
end
